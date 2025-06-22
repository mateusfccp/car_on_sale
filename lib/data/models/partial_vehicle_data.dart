import 'package:freezed_annotation/freezed_annotation.dart';

part 'partial_vehicle_data.freezed.dart';
part 'partial_vehicle_data.g.dart';

/// Represents partial vehicle data for when the exact vehicle is not found.
///
/// This is returned when a search does not find an exact match for the vehicle,
/// and instead a list of similar results is returned. The [similarity] score
/// indicates how closer the result is from the search.
@freezed
sealed class PartialVehicleData with _$PartialVehicleData {
  /// Creates a [PartialVehicleData].
  const factory PartialVehicleData({
    /// The make of the vehicle (e.g., "Toyota").
    required String make,

    /// The model of the vehicle (e.g., "GT 86 Basis").
    required String model,

    /// A descriptive name for the container or version.
    required String containerName,

    /// A similarity score.
    ///
    /// The bigger this value, the more similar this result is from the search
    /// input.
    required int similarity,

    /// A unique external identifier for the vehicle data.
    required String externalId,
  }) = _PartialVehicleData;

  /// Creates a [PartialVehicleData] from a JSON object.
  factory PartialVehicleData.fromJson(Map<String, Object?> json) =>
      _$PartialVehicleDataFromJson(json);
}
