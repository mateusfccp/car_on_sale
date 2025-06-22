// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_valuation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleValuationData _$VehicleValuationDataFromJson(
  Map<String, dynamic> json,
) => _VehicleValuationData(
  id: (json['id'] as num).toInt(),
  feedback: json['feedback'] as String,
  valuatedAt: DateTime.parse(json['valuatedAt'] as String),
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  make: json['make'] as String,
  model: json['model'] as String,
  externalId: json['externalId'] as String,
  price: (json['price'] as num).toInt(),
  isFeedbackPositive: json['positiveCustomerFeedback'] as bool,
  inspectorRequestedAt: DateTime.parse(json['inspectorRequestedAt'] as String),
  origin: json['origin'] as String,
  estimationRequestId: json['estimationRequestId'] as String,
);

Map<String, dynamic> _$VehicleValuationDataToJson(
  _VehicleValuationData instance,
) => <String, dynamic>{
  'id': instance.id,
  'feedback': instance.feedback,
  'valuatedAt': instance.valuatedAt.toIso8601String(),
  'requestedAt': instance.requestedAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'make': instance.make,
  'model': instance.model,
  'externalId': instance.externalId,
  'price': instance.price,
  'positiveCustomerFeedback': instance.isFeedbackPositive,
  'inspectorRequestedAt': instance.inspectorRequestedAt.toIso8601String(),
  'origin': instance.origin,
  'estimationRequestId': instance.estimationRequestId,
};
