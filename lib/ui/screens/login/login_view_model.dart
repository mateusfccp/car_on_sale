/// @docImport 'login_screen.dart';
library;

import 'package:cars_on_sale/core/authentication_service.dart';
import 'package:cars_on_sale/core/command.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:flutter/widgets.dart';

/// The view-model for the [LoginScreen].
final class LoginViewModel {
  LoginViewModel({
    required this.authenticationRepository,
    required this.authenticationService,
  });

  final AuthenticationRepository authenticationRepository;
  final AuthenticationService authenticationService;
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  /// A command to log in.
  late final login = Command0(_login);

  Future<Result<void>> _login() async {
    final token = await authenticationRepository.login(
      user: userTextController.text,
      password: passwordTextController.text,
    );

    if (token case Ok(:final value)) {
      authenticationService.setToken(value);
    }

    return token;
  }
}
