import 'dart:convert';

import 'package:cars_on_sale/challenge.dart';
import 'package:cars_on_sale/core/authentication_service.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/models/api_error.dart';
import 'package:cars_on_sale/data/models/partial_vehicle_data.dart';
import 'package:cars_on_sale/data/models/vehicle_valuation_data.dart';

abstract interface class AuctionRepository {
  Future<Result<Object?>> searchValuationByVIN(String vin);
}

final class MockAuctionRepository implements AuctionRepository {
  const MockAuctionRepository({
    required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  final AuthenticationService _authenticationService;

  @override
  Future<Result<Object?>> searchValuationByVIN(String vin) async {
    try {
      final response = await CosChallenge.httpClient.get(
        Uri.https('anyUrl'),
        headers: {CosChallenge.user: ?_authenticationService.token},
      );

      switch (response.statusCode) {
        case 200: // Single object response
          final json = jsonDecode(response.body) as Map<String, Object?>;
          final data = VehicleValuationData.fromJson(json);
          return Result.ok(data);
        case 300: // Multiple objects response
          final json = jsonDecode(response.body) as List<Object?>;
          final data = [
            for (final item in json)
              PartialVehicleData.fromJson(item as Map<String, Object?>),
          ];
          return Result.ok(data);
        case 400: // API Error
          final json = jsonDecode(response.body) as Map<String, Object?>;
          final data = ApiError.fromJson(json);
          return Result.error(data);
        default:
          throw StateError('Unknown error.');
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
