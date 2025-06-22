// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiError {

/// A key identifying the type of error, e.g., "maintenance".
// ignore: invalid_annotation_target
@JsonKey(name: 'msgKey') String get messageKey;/// A map of parameters associated with the error.
// ignore: invalid_annotation_target
@JsonKey(name: 'params') ErrorParameters get parameters;/// A user-friendly error message.
 String get message;
/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorCopyWith<ApiError> get copyWith => _$ApiErrorCopyWithImpl<ApiError>(this as ApiError, _$identity);

  /// Serializes this ApiError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageKey,parameters,message);

@override
String toString() {
  return 'ApiError(messageKey: $messageKey, parameters: $parameters, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<$Res>  {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) _then) = _$ApiErrorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'msgKey') String messageKey,@JsonKey(name: 'params') ErrorParameters parameters, String message
});


$ErrorParametersCopyWith<$Res> get parameters;

}
/// @nodoc
class _$ApiErrorCopyWithImpl<$Res>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError _self;
  final $Res Function(ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageKey = null,Object? parameters = null,Object? message = null,}) {
  return _then(_self.copyWith(
messageKey: null == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as ErrorParameters,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorParametersCopyWith<$Res> get parameters {
  
  return $ErrorParametersCopyWith<$Res>(_self.parameters, (value) {
    return _then(_self.copyWith(parameters: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ApiError implements ApiError {
  const _ApiError({@JsonKey(name: 'msgKey') required this.messageKey, @JsonKey(name: 'params') required this.parameters, required this.message});
  factory _ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

/// A key identifying the type of error, e.g., "maintenance".
// ignore: invalid_annotation_target
@override@JsonKey(name: 'msgKey') final  String messageKey;
/// A map of parameters associated with the error.
// ignore: invalid_annotation_target
@override@JsonKey(name: 'params') final  ErrorParameters parameters;
/// A user-friendly error message.
@override final  String message;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorCopyWith<_ApiError> get copyWith => __$ApiErrorCopyWithImpl<_ApiError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiError&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageKey,parameters,message);

@override
String toString() {
  return 'ApiError(messageKey: $messageKey, parameters: $parameters, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$ApiErrorCopyWith(_ApiError value, $Res Function(_ApiError) _then) = __$ApiErrorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'msgKey') String messageKey,@JsonKey(name: 'params') ErrorParameters parameters, String message
});


@override $ErrorParametersCopyWith<$Res> get parameters;

}
/// @nodoc
class __$ApiErrorCopyWithImpl<$Res>
    implements _$ApiErrorCopyWith<$Res> {
  __$ApiErrorCopyWithImpl(this._self, this._then);

  final _ApiError _self;
  final $Res Function(_ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageKey = null,Object? parameters = null,Object? message = null,}) {
  return _then(_ApiError(
messageKey: null == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as ErrorParameters,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorParametersCopyWith<$Res> get parameters {
  
  return $ErrorParametersCopyWith<$Res>(_self.parameters, (value) {
    return _then(_self.copyWith(parameters: value));
  });
}
}


/// @nodoc
mixin _$ErrorParameters {

/// The delay in seconds, provided as a string.
 String get delaySeconds;
/// Create a copy of ErrorParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorParametersCopyWith<ErrorParameters> get copyWith => _$ErrorParametersCopyWithImpl<ErrorParameters>(this as ErrorParameters, _$identity);

  /// Serializes this ErrorParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorParameters&&(identical(other.delaySeconds, delaySeconds) || other.delaySeconds == delaySeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delaySeconds);

@override
String toString() {
  return 'ErrorParameters(delaySeconds: $delaySeconds)';
}


}

/// @nodoc
abstract mixin class $ErrorParametersCopyWith<$Res>  {
  factory $ErrorParametersCopyWith(ErrorParameters value, $Res Function(ErrorParameters) _then) = _$ErrorParametersCopyWithImpl;
@useResult
$Res call({
 String delaySeconds
});




}
/// @nodoc
class _$ErrorParametersCopyWithImpl<$Res>
    implements $ErrorParametersCopyWith<$Res> {
  _$ErrorParametersCopyWithImpl(this._self, this._then);

  final ErrorParameters _self;
  final $Res Function(ErrorParameters) _then;

/// Create a copy of ErrorParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? delaySeconds = null,}) {
  return _then(_self.copyWith(
delaySeconds: null == delaySeconds ? _self.delaySeconds : delaySeconds // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ErrorParameters implements ErrorParameters {
  const _ErrorParameters({required this.delaySeconds});
  factory _ErrorParameters.fromJson(Map<String, dynamic> json) => _$ErrorParametersFromJson(json);

/// The delay in seconds, provided as a string.
@override final  String delaySeconds;

/// Create a copy of ErrorParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorParametersCopyWith<_ErrorParameters> get copyWith => __$ErrorParametersCopyWithImpl<_ErrorParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorParameters&&(identical(other.delaySeconds, delaySeconds) || other.delaySeconds == delaySeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delaySeconds);

@override
String toString() {
  return 'ErrorParameters(delaySeconds: $delaySeconds)';
}


}

/// @nodoc
abstract mixin class _$ErrorParametersCopyWith<$Res> implements $ErrorParametersCopyWith<$Res> {
  factory _$ErrorParametersCopyWith(_ErrorParameters value, $Res Function(_ErrorParameters) _then) = __$ErrorParametersCopyWithImpl;
@override @useResult
$Res call({
 String delaySeconds
});




}
/// @nodoc
class __$ErrorParametersCopyWithImpl<$Res>
    implements _$ErrorParametersCopyWith<$Res> {
  __$ErrorParametersCopyWithImpl(this._self, this._then);

  final _ErrorParameters _self;
  final $Res Function(_ErrorParameters) _then;

/// Create a copy of ErrorParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? delaySeconds = null,}) {
  return _then(_ErrorParameters(
delaySeconds: null == delaySeconds ? _self.delaySeconds : delaySeconds // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
