/// @docImport 'search_vehicle_screen.dart';
library;

import 'package:cars_on_sale/core/authentication_service.dart';
import 'package:cars_on_sale/core/command.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/repositories/auction_repository.dart';
import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:flutter/widgets.dart';

/// The view-model for the [SearchVehicleScreen].
final class SearchVehicleViewModel {
  SearchVehicleViewModel({
    required this.auctionRepository,
    required this.authenticationRepository,
    required this.authenticationService,
  });

  final AuctionRepository auctionRepository;
  final AuthenticationRepository authenticationRepository;
  final AuthenticationService authenticationService;

  final vinTextController = TextEditingController();

  late final searchValuationByVIN = Command0(_searchValuationByVIN);
  Future<Result<void>> _searchValuationByVIN() async {
    final vin = vinTextController.text;
    final result = await auctionRepository.searchValuationByVIN(vin);

    print(result);

    return result;
  }

  Future<void> logout() async {
    await authenticationService.clearToken();
  }
}
