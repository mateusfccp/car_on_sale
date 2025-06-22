import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:cars_on_sale/ui/screens/login/login_view_model.dart';
import 'package:flutter/material.dart';

final class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static final _emailPattern = RegExp(r'.+@.+');
}

class _LoginScreenState extends State<LoginScreen> {
  // TODO(mateusfccp): set up DI
  final viewModel = LoginViewModel(repository: MockAuthenticationRepository());

  final _formKey = GlobalKey<FormState>();

  final _buttonFocusNode = FocusNode();

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Car On Sale Coding Challenge')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('User'),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: _userValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                    ),
                    obscureText: true,
                    onFieldSubmitted: (value) => _submitForm(),
                    textInputAction: TextInputAction.go,
                    validator: _passwordValidator,
                  ),
                  const SizedBox(height: 16.0),
                  ListenableBuilder(
                    listenable: viewModel.login,
                    builder: (context, child) {
                      return ElevatedButton.icon(
                        icon: viewModel.login.running
                            ? null
                            : CircularProgressIndicator(),
                        label: child!,
                        onPressed: viewModel.login.running ? null : _submitForm,
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState case final state?) {
      final result = state.validateGranularly();

      if (result.isEmpty) {
        viewModel.login();
      }
    }
  }

  String? _userValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else if (!LoginScreen._emailPattern.hasMatch(value)) {
      return 'Invalid user. An e-mail is expected.';
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else {
      return null;
    }
  }
}
