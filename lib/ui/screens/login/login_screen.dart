import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/ui/screens/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A screen that allows the user to log in to the app.
final class LoginScreen extends StatefulWidget {
  /// Creates a [LoginScreen] with the given [viewModel].
  const LoginScreen({super.key, required this.viewModel});

  /// The view-model for this screen.
  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _buttonFocusNode = FocusNode();

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset('assets/logo.png', scale: 2.0),
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: widget.viewModel.userTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('User'),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: _userValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: widget.viewModel.passwordTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                    ),
                    obscureText: true,
                    onFieldSubmitted: (value) {
                      _tapButton();
                    },
                    textInputAction: TextInputAction.go,
                    validator: _passwordValidator,
                  ),
                  const SizedBox(height: 16.0),
                  ListenableBuilder(
                    listenable: widget.viewModel.login,
                    builder: (context, child) {
                      return ElevatedButton.icon(
                        focusNode: _buttonFocusNode,
                        icon: widget.viewModel.login.running
                            ? CircularProgressIndicator(
                                constraints: BoxConstraints.tightFor(
                                  width: 16.0,
                                  height: 16.0,
                                ),
                                strokeCap: StrokeCap.round,
                                strokeWidth: 2.0,
                              )
                            : null,
                        label: child!,
                        onPressed: widget.viewModel.login.running
                            ? null
                            : _submitForm,
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

  // We progamatically tap the button so that the animation is executed and so
  // that the form is not submitted if the button callback is set to null.
  void _tapButton() {
    _buttonFocusNode.requestFocus();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_buttonFocusNode.context case final context? when context.mounted) {
        Actions.invoke(context, const ActivateIntent());
      }
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await widget.viewModel.login();

      if (mounted) {
        switch (widget.viewModel.login.result) {
          case Ok():
            context.go('/home');
          case Error result:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: Text('${result.error}'),
                showCloseIcon: true,
              ),
            );
          case null:
        }
      }

      widget.viewModel.login.clearResult();
    }
  }

  // This is enough to have a reasonable e-mail validation, as validating
  // e-mails strictly is almost always unnecessary and costful.
  static final _emailPattern = RegExp('.+@.+');

  String? _userValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else if (!_emailPattern.hasMatch(value)) {
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
