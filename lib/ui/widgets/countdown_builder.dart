import 'dart:async';

import 'package:flutter/material.dart';

/// A class that counts down from some number to zero.
///
/// The [count] is available to the [builder], and you can opitionally execute
/// a callback when the count is over.
final class CountdownBuilder extends StatefulWidget {
  /// Creates a [CountdownBuilder].
  ///
  /// The [count] must be greater than zero.
  const CountdownBuilder({
    super.key,
    required this.count,
    this.onCountdownOver,
    required this.builder,
    this.child,
  }) : assert(count > 0, 'The count must be greater tha zero.');

  /// The initial count of the widget.
  ///
  /// Must be greater than zero.
  final int count;

  /// Callback to be executed when the count is over.
  ///
  /// This callback won't be called if the state is disposed before the
  /// countdown is over.
  final VoidCallback? onCountdownOver;

  /// Called every time the count decreases.
  ///
  /// The child given to the builder should typically be part of the returned
  /// widget tree.
  final ValueWidgetBuilder<int> builder;

  /// The child widget to pass to the [builder].
  ///
  /// If the [builder] function contains a subtree that does not depend on the
  /// count, it is more efficient to build that subtree once instead of
  /// rebuilding it on every change of the count.
  final Widget? child;

  @override
  State<CountdownBuilder> createState() => _CountdownBuilderState();
}

final class _CountdownBuilderState extends State<CountdownBuilder> {
  late int _count;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _count = _count - 1;
      });

      if (_count == 0) {
        widget.onCountdownOver?.call();
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _count, widget.child);
  }
}
