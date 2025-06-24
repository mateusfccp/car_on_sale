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
    final sortedResults = [...results]
      ..sort((a, b) => b.similarity.compareTo(a.similarity));

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
            itemCount: sortedResults.length,
            itemBuilder: (context, index) {
              return _PartialDataTile(
                data: sortedResults[index],
                highlight: index == 0,
              );
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
  const _PartialDataTile({required this.data, required this.highlight});

  final PartialVehicleData data;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '${data.make} ${data.model}'),
            if (highlight) ...[
              TextSpan(text: ' '),
              WidgetSpan(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      'Best Match',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      subtitle: Text(data.containerName),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Similarity'),
          Text(
            '${data.similarity}%',
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
