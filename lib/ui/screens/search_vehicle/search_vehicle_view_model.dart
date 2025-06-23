/// @docImport 'search_vehicle_screen.dart';
library;

import 'package:cars_on_sale/core/authentication_service.dart';
import 'package:cars_on_sale/core/command.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:flutter/widgets.dart';

/// The view-model for the [SearchVehicleScreen].
final class SearchVehicleViewModel {
  SearchVehicleViewModel({
    required this.authenticationRepository,
    required this.authenticationService,
  });

  final AuthenticationRepository authenticationRepository;
  final AuthenticationService authenticationService;
  final vinTextController = TextEditingController();

  final searchVin = Command0(() async => Result.ok(null));

  Future<void> logout() async {
    await authenticationService.clearToken();
  }
}
