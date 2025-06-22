// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => _ApiError(
  messageKey: json['msgKey'] as String,
  parameters: ErrorParameters.fromJson(json['params'] as Map<String, dynamic>),
  message: json['message'] as String,
);

Map<String, dynamic> _$ApiErrorToJson(_ApiError instance) => <String, dynamic>{
  'msgKey': instance.messageKey,
  'params': instance.parameters,
  'message': instance.message,
};

_ErrorParameters _$ErrorParametersFromJson(Map<String, dynamic> json) =>
    _ErrorParameters(delaySeconds: json['delaySeconds'] as String);

Map<String, dynamic> _$ErrorParametersToJson(_ErrorParameters instance) =>
    <String, dynamic>{'delaySeconds': instance.delaySeconds};
