import 'package:flutter/widgets.dart';

/// A [ScrollPhysics] that conditionally applies different physics based on
/// whether the content fits within the viewport.
///
/// When the content's extent is less than or equal to the viewport's size
/// (meaning `metrics.maxScrollExtent <= metrics.minScrollExtent`), the
/// [physicsWhenContentFits] is used. This is typically a
/// [NeverScrollableScrollPhysics] to prevent scrolling and the overscroll glow
/// or bouncing when all content is visible.
///
/// When the content overflows the viewport, this class delegates to the parent
/// [ScrollPhysics], allowing for normal scrolling behavior.
final class ExtentAwareScrollPhysics extends ScrollPhysics {
  const ExtentAwareScrollPhysics({
    required this.physicsWhenContentFits,
  });

  /// The physics that will be used when the content fits the viewport.
  final ScrollPhysics physicsWhenContentFits;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (position.minScrollExtent <= position.maxScrollExtent) {
      return super.applyBoundaryConditions(position, value);
    } else {
      return physicsWhenContentFits.applyBoundaryConditions(position, value);
    }
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (position.minScrollExtent <= position.maxScrollExtent) {
      return super.applyPhysicsToUserOffset(position, offset);
    } else {
      return physicsWhenContentFits.applyPhysicsToUserOffset(position, offset);
    }
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if (position.minScrollExtent <= position.maxScrollExtent) {
      return super.createBallisticSimulation(position, velocity);
    } else {
      return physicsWhenContentFits.createBallisticSimulation(position, velocity);
    }
  }

  @override
  bool recommendDeferredLoading(double velocity, ScrollMetrics metrics, BuildContext context) {
    if (metrics.minScrollExtent <= metrics.maxScrollExtent) {
      return super.recommendDeferredLoading(velocity, metrics, context);
    } else {
      return physicsWhenContentFits.recommendDeferredLoading(velocity, metrics, context);
    }
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    if (position.minScrollExtent <= position.maxScrollExtent) {
      return super.shouldAcceptUserOffset(position);
    } else {
      return physicsWhenContentFits.shouldAcceptUserOffset(position);
    }
  }

  @override
  Tolerance toleranceFor(ScrollMetrics metrics) {
    if (metrics.minScrollExtent <= metrics.maxScrollExtent) {
      return super.toleranceFor(metrics);
    } else {
      return physicsWhenContentFits.toleranceFor(metrics);
    }
  }
}
