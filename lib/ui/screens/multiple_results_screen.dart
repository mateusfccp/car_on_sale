import 'package:car_on_sale/data/models/partial_vehicle_data.dart';
import 'package:car_on_sale/ui/widgets/extent_aware_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// A screen that shows the details of a valuation.
final class MultipleResultsScreen extends StatelessWidget {
  /// Creates a [MultipleResultsScreen].
  const MultipleResultsScreen({super.key, required this.results});

  /// The list of partial data returned from a search.
  final List<PartialVehicleData> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: CustomScrollView(
        physics: ExtentAwareScrollPhysics(
          physicsWhenContentFits: NeverScrollableScrollPhysics(),
        ),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                "We couldn't find the exact match for your search, but here "
                'are some similar results. Select an item from the list to '
                'autofill the form with its VIN.',
              ),
            ),
          ),
          SliverList.separated(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return _PartialDataTile(data: results[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 0.0);
            },
          ),
        ],
      ),
    );
  }
}

final class _PartialDataTile extends StatelessWidget {
  const _PartialDataTile({required this.data});

  final PartialVehicleData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${data.make} ${data.model}'),
      subtitle: Text(data.containerName),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Similarity'),
          Text(
            data.similarity.toString(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      onTap: () {
        context.pop(data);
      },
    );
  }
}
