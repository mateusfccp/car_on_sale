// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partial_vehicle_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartialVehicleData {

/// The make of the vehicle (e.g., "Toyota").
 String get make;/// The model of the vehicle (e.g., "GT 86 Basis").
 String get model;/// A descriptive name for the container or version.
 String get containerName;/// A similarity score.
///
/// The bigger this value, the more similar this result is from the search
/// input.
 int get similarity;/// A unique external identifier for the vehicle data.
 String get externalId;
/// Create a copy of PartialVehicleData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartialVehicleDataCopyWith<PartialVehicleData> get copyWith => _$PartialVehicleDataCopyWithImpl<PartialVehicleData>(this as PartialVehicleData, _$identity);

  /// Serializes this PartialVehicleData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartialVehicleData&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.containerName, containerName) || other.containerName == containerName)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.externalId, externalId) || other.externalId == externalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,make,model,containerName,similarity,externalId);

@override
String toString() {
  return 'PartialVehicleData(make: $make, model: $model, containerName: $containerName, similarity: $similarity, externalId: $externalId)';
}


}

/// @nodoc
abstract mixin class $PartialVehicleDataCopyWith<$Res>  {
  factory $PartialVehicleDataCopyWith(PartialVehicleData value, $Res Function(PartialVehicleData) _then) = _$PartialVehicleDataCopyWithImpl;
@useResult
$Res call({
 String make, String model, String containerName, int similarity, String externalId
});




}
/// @nodoc
class _$PartialVehicleDataCopyWithImpl<$Res>
    implements $PartialVehicleDataCopyWith<$Res> {
  _$PartialVehicleDataCopyWithImpl(this._self, this._then);

  final PartialVehicleData _self;
  final $Res Function(PartialVehicleData) _then;

/// Create a copy of PartialVehicleData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? make = null,Object? model = null,Object? containerName = null,Object? similarity = null,Object? externalId = null,}) {
  return _then(_self.copyWith(
make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,containerName: null == containerName ? _self.containerName : containerName // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PartialVehicleData implements PartialVehicleData {
  const _PartialVehicleData({required this.make, required this.model, required this.containerName, required this.similarity, required this.externalId});
  factory _PartialVehicleData.fromJson(Map<String, dynamic> json) => _$PartialVehicleDataFromJson(json);

/// The make of the vehicle (e.g., "Toyota").
@override final  String make;
/// The model of the vehicle (e.g., "GT 86 Basis").
@override final  String model;
/// A descriptive name for the container or version.
@override final  String containerName;
/// A similarity score.
///
/// The bigger this value, the more similar this result is from the search
/// input.
@override final  int similarity;
/// A unique external identifier for the vehicle data.
@override final  String externalId;

/// Create a copy of PartialVehicleData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartialVehicleDataCopyWith<_PartialVehicleData> get copyWith => __$PartialVehicleDataCopyWithImpl<_PartialVehicleData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartialVehicleDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartialVehicleData&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.containerName, containerName) || other.containerName == containerName)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.externalId, externalId) || other.externalId == externalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,make,model,containerName,similarity,externalId);

@override
String toString() {
  return 'PartialVehicleData(make: $make, model: $model, containerName: $containerName, similarity: $similarity, externalId: $externalId)';
}


}

/// @nodoc
abstract mixin class _$PartialVehicleDataCopyWith<$Res> implements $PartialVehicleDataCopyWith<$Res> {
  factory _$PartialVehicleDataCopyWith(_PartialVehicleData value, $Res Function(_PartialVehicleData) _then) = __$PartialVehicleDataCopyWithImpl;
@override @useResult
$Res call({
 String make, String model, String containerName, int similarity, String externalId
});




}
/// @nodoc
class __$PartialVehicleDataCopyWithImpl<$Res>
    implements _$PartialVehicleDataCopyWith<$Res> {
  __$PartialVehicleDataCopyWithImpl(this._self, this._then);

  final _PartialVehicleData _self;
  final $Res Function(_PartialVehicleData) _then;

/// Create a copy of PartialVehicleData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? make = null,Object? model = null,Object? containerName = null,Object? similarity = null,Object? externalId = null,}) {
  return _then(_PartialVehicleData(
make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,containerName: null == containerName ? _self.containerName : containerName // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
