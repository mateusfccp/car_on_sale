import 'package:car_on_sale/data/models/vehicle_valuation_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// A screen that shows the details of a valuation.
final class ValuationDetailsScreen extends StatelessWidget {
  /// Creates a [ValuationDetailsScreen].
  const ValuationDetailsScreen({super.key, required this.valuationData});

  /// The valuation data to be shown in the screen.
  final VehicleValuationData valuationData;

  static final _currencyFormatter = NumberFormat.currency(symbol: '€');

  @override
  Widget build(BuildContext context) {
    final sentimentColor = valuationData.isFeedbackPositive
        ? Colors.green
        : Colors.red;
    final sentimentIcon = valuationData.isFeedbackPositive
        ? Icons.thumb_up_alt_outlined
        : Icons.thumb_down_alt_outlined;

    return Scaffold(
      appBar: AppBar(title: const Text('Valuation Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _DetailRow(
                  icon: Icon(Icons.confirmation_number_outlined),
                  label: Text('ID'),
                  value: Text(valuationData.externalId),
                ),
                const Divider(height: 24),
                _DetailRow(
                  icon: Icon(Icons.directions_car_filled_outlined),
                  label: Text('Model'),
                  value: Text('${valuationData.make} ${valuationData.model}'),
                ),
                const Divider(height: 24),
                _DetailRow(
                  icon: Icon(Icons.price_change_outlined),
                  label: Text('Price'),
                  value: Text(_currencyFormatter.format(valuationData.price)),
                ),
                const Divider(height: 24),
                _DetailRow(
                  icon: Icon(Icons.feedback_outlined),
                  label: Text('Feedback'),
                  value: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            sentimentIcon,
                            color: sentimentColor,
                            size: 16.0,
                          ),
                        ),
                        TextSpan(text: ' ${valuationData.feedback}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final Widget icon;
  final Widget label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTheme(
          data: IconThemeData(
            color: Theme.of(context).primaryColor,
            size: 28.0,
          ),
          child: icon,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleMedium,
                child: label,
              ),
              const SizedBox(height: 4.0),
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.bodyLarge,
                child: value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
