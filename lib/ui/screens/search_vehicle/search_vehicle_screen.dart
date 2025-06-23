import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'search_vehicle_view_model.dart';

/// A screen that allows the user to log in to the app.
final class SearchVehicleScreen extends StatefulWidget {
  /// Creates a [SearchVehicleScreen] with the given [viewModel].
  const SearchVehicleScreen({super.key, required this.viewModel});

  /// The view-model for this screen.
  final SearchVehicleViewModel viewModel;

  @override
  State<SearchVehicleScreen> createState() => _SearchVehicleScreenState();
}

class _SearchVehicleScreenState extends State<SearchVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _buttonFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'logo',
            child: Image.asset('assets/logo.png', scale: 2.0),
          ),
        ),
        title: Text('Search Vehicle'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () async {
                // TODO(mateusfccp): check if we can do better in relation to this await
                await widget.viewModel.logout();

                if (context.mounted) {
                  context.go('/login');
                }
              },
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: widget.viewModel.vinTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('VIN'),
                ),
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (value) => _tapButton(),
                validator: _vinValidator,
              ),
              const SizedBox(height: 16.0),
              ListenableBuilder(
                listenable: widget.viewModel.searchVin,
                builder: (context, child) {
                  return ElevatedButton.icon(
                    focusNode: _buttonFocusNode,
                    icon: widget.viewModel.searchVin.running
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
                    onPressed: widget.viewModel.searchVin.running
                        ? null
                        : _submitForm,
                  );
                },
                child: const Text('Search'),
              ),
            ],
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

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.viewModel.searchVin();
    }
  }

  String? _vinValidator(String? value) {
    // TODO(mateusfccp): check if we can/should check the vin
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else {
      return null;
    }
  }
}
