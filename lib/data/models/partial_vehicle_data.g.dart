// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_vehicle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartialVehicleData _$PartialVehicleDataFromJson(Map<String, dynamic> json) =>
    _PartialVehicleData(
      make: json['make'] as String,
      model: json['model'] as String,
      containerName: json['containerName'] as String,
      similarity: (json['similarity'] as num).toInt(),
      externalId: json['externalId'] as String,
    );

Map<String, dynamic> _$PartialVehicleDataToJson(_PartialVehicleData instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'containerName': instance.containerName,
      'similarity': instance.similarity,
      'externalId': instance.externalId,
    };
