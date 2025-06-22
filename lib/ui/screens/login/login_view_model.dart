import 'package:cars_on_sale/core/command.dart';
import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:flutter/widgets.dart';

final class LoginViewModel {
  LoginViewModel({required this.repository});

  final AuthenticationRepository repository;
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  late final login = Command0(_login);

  Future<Result<void>> _login() async {
    final token = await repository.login(
      user: userTextController.text,
      password: passwordTextController.text,
    );

    print('Token received: $token');

    return token;
  }
}
