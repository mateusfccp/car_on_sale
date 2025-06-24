/// @docImport 'search_vehicle_screen.dart';
library;

import 'package:car_on_sale/core/authentication_service.dart';
import 'package:car_on_sale/core/command.dart';
import 'package:car_on_sale/core/result.dart';
import 'package:car_on_sale/data/models/partial_vehicle_data.dart';
import 'package:car_on_sale/data/repositories/auction_repository.dart';
import 'package:car_on_sale/ui/widgets/vin_input_formatter.dart';
import 'package:flutter/widgets.dart';

/// The view-model for the [SearchVehicleScreen].
final class SearchVehicleViewModel {
  SearchVehicleViewModel({
    required AuctionRepository auctionRepository,
    required AuthenticationService authenticationService,
  }) : _auctionRepository = auctionRepository,
       _authenticationService = authenticationService;

  final AuctionRepository _auctionRepository;
  final AuthenticationService _authenticationService;

  /// The text controller for the VIN input field.
  final vinTextController = TextEditingController();

  /// The command to search for a valuation by VIN.
  late final searchValuationByVIN = Command0(_searchValuationByVIN);

  Future<Result<void>> _searchValuationByVIN() async {
    final vin = vinTextController.text;
    final result = await _auctionRepository.searchValuationByVIN(vin);

    return result;
  }

  /// Logs out from the system.
  Future<void> logout() => _authenticationService.clearToken();

  /// Fills the text field with a VIN extracted from the partial result.
  void fillVinFieldWithPartialResult(PartialVehicleData data) {
    // This is not a real VIN, but it doesn't really matter, we are just mocking
    // it.

    final formattedText = VINInputFormatter().formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(
        text: data.externalId,
        selection: TextSelection.collapsed(offset: data.externalId.length),
      ),
    );

    vinTextController.value = formattedText;
  }
}
