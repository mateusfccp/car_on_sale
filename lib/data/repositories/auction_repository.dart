import 'dart:async';
import 'dart:convert';

import 'package:cars_on_sale/challenge.dart';
import 'package:cars_on_sale/core/authentication_service.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/models/api_error.dart';
import 'package:cars_on_sale/data/models/partial_vehicle_data.dart';
import 'package:cars_on_sale/data/models/vehicle_valuation_data.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A repository to search for auction valuations.
abstract interface class AuctionRepository {
  /// Search for an auction valuation based on the given [vin] code.
  Future<Result<Object?>> searchValuationByVIN(String vin);
}

/// A mock [AuctionRepository] that returns mocked data.
///
/// The data is obtained through the [CosChallange] helper, but it also handles
/// the codec and cache operations.
final class MockAuctionRepository implements AuctionRepository {
  const MockAuctionRepository({
    required AuthenticationService authenticationService,
    required SharedPreferencesAsync sharedPreferences,
    Logger? logger,
  }) : _authenticationService = authenticationService,
       _logger = logger,
       _sharedPreferences = sharedPreferences;

  final AuthenticationService _authenticationService;
  final Logger? _logger;
  final SharedPreferencesAsync _sharedPreferences;

  @override
  Future<Result<Object?>> searchValuationByVIN(String vin) async {
    Result<Object?> result;

    try {
      _logger?.info('Requesting data to mock CosChallenge.httpClient.');
      final response = await CosChallenge.httpClient.get(
        Uri.https('anyUrl'),
        headers: {CosChallenge.user: ?_authenticationService.token},
      );

      _logger?.info('Response status code: ${response.statusCode}');

      switch (response.statusCode) {
        case 200: // Single object response
          final json = jsonDecode(response.body) as Map<String, Object?>;
          final data = VehicleValuationData.fromJson(json);
          result = Result.ok(data);
        case 300: // Multiple objects response
          final json = jsonDecode(response.body) as List<Object?>;
          final data = [
            for (final item in json)
              PartialVehicleData.fromJson(item as Map<String, Object?>),
          ];
          result = Result.ok(data);
        case 400: // API Error
          final json = jsonDecode(response.body) as Map<String, Object?>;
          final data = ApiError.fromJson(json);
          result = Result.error(data);
        default:
          throw StateError('Unknown error.');
      }
    } on Exception catch (error) {
      result = Result.error(error);
    }

    switch (result) {
      case Ok(:VehicleValuationData value):
        unawaited(_cacheSuccessfulValuationData(value));
      case Error():
        final cachedValuationData = await _getCachedValuationData();
        if (cachedValuationData != null) {
          result = Result.ok(cachedValuationData);
        }
      default:
    }

    return result;
  }

  static final _cacheKey = 'cached_valuation_data';

  Future<VehicleValuationData?> _getCachedValuationData() async {
    _logger?.info('Looking for cached valuation data from local storage...');
    final cachedResultJson = await _sharedPreferences.getString(_cacheKey);

    if (cachedResultJson == null) {
      _logger?.info('There was no cached valuation data.');
      return null;
    } else {
      _logger?.info('Cached valuation data found. Using it.');
      final json = jsonDecode(cachedResultJson) as Map<String, Object?>;
      return VehicleValuationData.fromJson(json);
    }
  }

  Future<void> _cacheSuccessfulValuationData(VehicleValuationData data) async {
    final json = data.toJson();
    final jsonString = jsonEncode(json);

    _logger?.info('Caching successful valuation data to local storage.');
    await _sharedPreferences.setString(_cacheKey, jsonString);
  }
}
