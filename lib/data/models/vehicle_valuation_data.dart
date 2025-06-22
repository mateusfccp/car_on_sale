import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_valuation_data.freezed.dart';
part 'vehicle_valuation_data.g.dart';

/// The data of a vehicle valuation.
@freezed
sealed class VehicleValuationData with _$VehicleValuationData {
  /// Create an [VehicleValuationData].
  const factory VehicleValuationData({
    /// The unique identifier for this record.
    required int id,

    /// Text feedback provided for the auction.
    required String feedback,

    /// The date when the vehicle was officially valuated.
    required DateTime valuatedAt,

    /// The date when the valuation was initially requested.
    required DateTime requestedAt,

    /// The date when this valuation record was created in the system.
    required DateTime createdAt,

    /// The date of the last update to this valuation record.
    required DateTime updatedAt,

    /// The make of the vehicle (e.g., "Toyota").
    required String make,

    /// The model of the vehicle (e.g., "GT 86 Basis").
    required String model,

    /// A unique external identifier for the vehicle data.
    required String externalId,

    /// The valuated price of the vehicle.
    required int price,

    /// Indicates whether the customer feedback was positive.
    // ignore: invalid_annotation_target
    @JsonKey(name: 'positiveCustomerFeedback') required bool isFeedbackPositive,

    /// The date when an inspector was requested for this vehicle.
    required DateTime inspectorRequestedAt,

    /// The origin of the valuation request.
    required String origin,

    /// The unique identifier for the associated estimation request.
    required String estimationRequestId,
  }) = _VehicleValuationData;

  /// Creates a [VehicleValuationData] from a JSON object.
  factory VehicleValuationData.fromJson(Map<String, Object?> json) =>
      _$VehicleValuationDataFromJson(json);
}
