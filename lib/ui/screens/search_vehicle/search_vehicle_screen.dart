import 'dart:async';
import 'dart:math';

import 'package:car_on_sale/challenge.dart';
import 'package:car_on_sale/core/result.dart';
import 'package:car_on_sale/data/models/api_error.dart';
import 'package:car_on_sale/data/models/partial_vehicle_data.dart';
import 'package:car_on_sale/data/models/vehicle_valuation_data.dart';
import 'package:car_on_sale/ui/widgets/countdown_builder.dart';
import 'package:car_on_sale/ui/widgets/vin_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

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

final class _SearchVehicleScreenState extends State<SearchVehicleScreen> {
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
            child: IconButton(onPressed: _logout, icon: Icon(Icons.logout)),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: widget.viewModel.vinTextController,
                    decoration: InputDecoration(
                      filled: true,
                      label: Text('Enter VIN'),
                      prefixIcon: Icon(Icons.search),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(CosChallenge.vinLength),
                      VINInputFormatter(),
                    ],
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (value) => _tapButton(),
                    validator: _vinValidator,
                  ),
                  const SizedBox(height: 16.0),
                  ListenableBuilder(
                    listenable: widget.viewModel.searchValuationByVIN,
                    builder: (context, child) {
                      return ElevatedButton.icon(
                        focusNode: _buttonFocusNode,
                        icon: widget.viewModel.searchValuationByVIN.running
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
                        onPressed: widget.viewModel.searchValuationByVIN.running
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
        ),
      ),
    );
  }

  Future<void> _logout() async {
    // TODO(mateusfccp): check if we can do better in relation to this await
    await widget.viewModel.logout();

    if (mounted) {
      context.go('/login');
    }
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
      await widget.viewModel.searchValuationByVIN();

      if (mounted) {
        switch (widget.viewModel.searchValuationByVIN.result) {
          case Ok(:VehicleValuationData value):
            context.push('/valuation', extra: value);
          case Ok(:List<PartialVehicleData> value):
            final selected = await context.push<PartialVehicleData>(
              '/results',
              extra: value,
            );

            if (selected != null) {
              widget.viewModel.fillVinFieldWithPartialResult(selected);
            }
          case Error(error: TimeoutException()):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: Text(
                  'Request timed out. Try again later, or, if the problem '
                  'persists, contact technical support.',
                ),
                showCloseIcon: true,
              ),
            );
          case Error(error: ClientException(message: 'Auth')):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: CountdownBuilder(
                  count: 3,
                  onCountdownOver: _logout,
                  builder: (context, count, child) {
                    return Text(
                      'Permission error. You are going to be logged out in a '
                      'few seconds.',
                    );
                  },
                ),
                duration: const Duration(seconds: 4),
              ),
            );
          case Error(error: ApiError(messageKey: 'maintenance') && var error):
            final delaySeconds = error.parameters.delaySeconds;
            final seconds = int.parse(delaySeconds);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: CountdownBuilder(
                  count: seconds,
                  builder: (context, count, child) {
                    return Text(
                      count > 0
                          ? 'System in maintenance. Please, try again in '
                                '$count seconds.'
                          : 'System in maintenance. Please, try again.',
                    );
                  },
                ),
                duration: Duration(seconds: max(seconds, 5)),
                showCloseIcon: true,
              ),
            );
          case Error error:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                content: Text('Unknown error: ${error.error}'),
                showCloseIcon: true,
              ),
            );
          default:
        }
      }

      widget.viewModel.searchValuationByVIN.clearResult();
    }
  }

  String? _vinValidator(String? value) {
    // TODO(mateusfccp): check if we can/should check the vin
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else if (value.length < CosChallenge.vinLength) {
      return 'The VIN should have ${CosChallenge.vinLength} digits.';
    } else {
      return null;
    }
  }
}
