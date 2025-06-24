/// @docImport 'login_screen.dart';
library;

import 'package:car_on_sale/core/authentication_service.dart';
import 'package:car_on_sale/core/command.dart';
import 'package:car_on_sale/core/result.dart';
import 'package:car_on_sale/data/repositories/authentication_repository.dart';
import 'package:flutter/widgets.dart';

/// The view-model for the [LoginScreen].
final class LoginViewModel {
  /// Creates a [LoginViewModel].
  LoginViewModel({
    required AuthenticationRepository authenticationRepository,
    required AuthenticationService authenticationService,
  }) : _authenticationRepository = authenticationRepository,
       _authenticationService = authenticationService;

  final AuthenticationRepository _authenticationRepository;
  final AuthenticationService _authenticationService;

  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  /// A command to log in into the app.
  late final login = Command0(_login);

  Future<Result<void>> _login() async {
    final token = await _authenticationRepository.login(
      user: userTextController.text,
      password: passwordTextController.text,
    );

    if (token case Ok(:final value)) {
      _authenticationService.setToken(value);
    }

    return token;
  }
}
