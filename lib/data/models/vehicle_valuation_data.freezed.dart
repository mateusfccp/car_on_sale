// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_valuation_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleValuationData {

/// The unique identifier for this record.
 int get id;/// Text feedback provided for the auction.
 String get feedback;/// The date when the vehicle was officially valuated.
 DateTime get valuatedAt;/// The date when the valuation was initially requested.
 DateTime get requestedAt;/// The date when this valuation record was created in the system.
 DateTime get createdAt;/// The date of the last update to this valuation record.
 DateTime get updatedAt;/// The make of the vehicle (e.g., "Toyota").
 String get make;/// The model of the vehicle (e.g., "GT 86 Basis").
 String get model;/// A unique external identifier for the vehicle data.
 String get externalId;/// The valuated price of the vehicle.
 int get price;/// Indicates whether the customer feedback was positive.
// ignore: invalid_annotation_target
@JsonKey(name: 'positiveCustomerFeedback') bool get isFeedbackPositive;/// The date when an inspector was requested for this vehicle.
 DateTime get inspectorRequestedAt;/// The origin of the valuation request.
 String get origin;/// The unique identifier for the associated estimation request.
 String get estimationRequestId;
/// Create a copy of VehicleValuationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleValuationDataCopyWith<VehicleValuationData> get copyWith => _$VehicleValuationDataCopyWithImpl<VehicleValuationData>(this as VehicleValuationData, _$identity);

  /// Serializes this VehicleValuationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleValuationData&&(identical(other.id, id) || other.id == id)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.valuatedAt, valuatedAt) || other.valuatedAt == valuatedAt)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFeedbackPositive, isFeedbackPositive) || other.isFeedbackPositive == isFeedbackPositive)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,feedback,valuatedAt,requestedAt,createdAt,updatedAt,make,model,externalId,price,isFeedbackPositive,inspectorRequestedAt,origin,estimationRequestId);

@override
String toString() {
  return 'VehicleValuationData(id: $id, feedback: $feedback, valuatedAt: $valuatedAt, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, make: $make, model: $model, externalId: $externalId, price: $price, isFeedbackPositive: $isFeedbackPositive, inspectorRequestedAt: $inspectorRequestedAt, origin: $origin, estimationRequestId: $estimationRequestId)';
}


}

/// @nodoc
abstract mixin class $VehicleValuationDataCopyWith<$Res>  {
  factory $VehicleValuationDataCopyWith(VehicleValuationData value, $Res Function(VehicleValuationData) _then) = _$VehicleValuationDataCopyWithImpl;
@useResult
$Res call({
 int id, String feedback, DateTime valuatedAt, DateTime requestedAt, DateTime createdAt, DateTime updatedAt, String make, String model, String externalId, int price,@JsonKey(name: 'positiveCustomerFeedback') bool isFeedbackPositive, DateTime inspectorRequestedAt, String origin, String estimationRequestId
});




}
/// @nodoc
class _$VehicleValuationDataCopyWithImpl<$Res>
    implements $VehicleValuationDataCopyWith<$Res> {
  _$VehicleValuationDataCopyWithImpl(this._self, this._then);

  final VehicleValuationData _self;
  final $Res Function(VehicleValuationData) _then;

/// Create a copy of VehicleValuationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? feedback = null,Object? valuatedAt = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? make = null,Object? model = null,Object? externalId = null,Object? price = null,Object? isFeedbackPositive = null,Object? inspectorRequestedAt = null,Object? origin = null,Object? estimationRequestId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,valuatedAt: null == valuatedAt ? _self.valuatedAt : valuatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isFeedbackPositive: null == isFeedbackPositive ? _self.isFeedbackPositive : isFeedbackPositive // ignore: cast_nullable_to_non_nullable
as bool,inspectorRequestedAt: null == inspectorRequestedAt ? _self.inspectorRequestedAt : inspectorRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,estimationRequestId: null == estimationRequestId ? _self.estimationRequestId : estimationRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VehicleValuationData implements VehicleValuationData {
  const _VehicleValuationData({required this.id, required this.feedback, required this.valuatedAt, required this.requestedAt, required this.createdAt, required this.updatedAt, required this.make, required this.model, required this.externalId, required this.price, @JsonKey(name: 'positiveCustomerFeedback') required this.isFeedbackPositive, required this.inspectorRequestedAt, required this.origin, required this.estimationRequestId});
  factory _VehicleValuationData.fromJson(Map<String, dynamic> json) => _$VehicleValuationDataFromJson(json);

/// The unique identifier for this record.
@override final  int id;
/// Text feedback provided for the auction.
@override final  String feedback;
/// The date when the vehicle was officially valuated.
@override final  DateTime valuatedAt;
/// The date when the valuation was initially requested.
@override final  DateTime requestedAt;
/// The date when this valuation record was created in the system.
@override final  DateTime createdAt;
/// The date of the last update to this valuation record.
@override final  DateTime updatedAt;
/// The make of the vehicle (e.g., "Toyota").
@override final  String make;
/// The model of the vehicle (e.g., "GT 86 Basis").
@override final  String model;
/// A unique external identifier for the vehicle data.
@override final  String externalId;
/// The valuated price of the vehicle.
@override final  int price;
/// Indicates whether the customer feedback was positive.
// ignore: invalid_annotation_target
@override@JsonKey(name: 'positiveCustomerFeedback') final  bool isFeedbackPositive;
/// The date when an inspector was requested for this vehicle.
@override final  DateTime inspectorRequestedAt;
/// The origin of the valuation request.
@override final  String origin;
/// The unique identifier for the associated estimation request.
@override final  String estimationRequestId;

/// Create a copy of VehicleValuationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleValuationDataCopyWith<_VehicleValuationData> get copyWith => __$VehicleValuationDataCopyWithImpl<_VehicleValuationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleValuationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleValuationData&&(identical(other.id, id) || other.id == id)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.valuatedAt, valuatedAt) || other.valuatedAt == valuatedAt)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFeedbackPositive, isFeedbackPositive) || other.isFeedbackPositive == isFeedbackPositive)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,feedback,valuatedAt,requestedAt,createdAt,updatedAt,make,model,externalId,price,isFeedbackPositive,inspectorRequestedAt,origin,estimationRequestId);

@override
String toString() {
  return 'VehicleValuationData(id: $id, feedback: $feedback, valuatedAt: $valuatedAt, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, make: $make, model: $model, externalId: $externalId, price: $price, isFeedbackPositive: $isFeedbackPositive, inspectorRequestedAt: $inspectorRequestedAt, origin: $origin, estimationRequestId: $estimationRequestId)';
}


}

/// @nodoc
abstract mixin class _$VehicleValuationDataCopyWith<$Res> implements $VehicleValuationDataCopyWith<$Res> {
  factory _$VehicleValuationDataCopyWith(_VehicleValuationData value, $Res Function(_VehicleValuationData) _then) = __$VehicleValuationDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String feedback, DateTime valuatedAt, DateTime requestedAt, DateTime createdAt, DateTime updatedAt, String make, String model, String externalId, int price,@JsonKey(name: 'positiveCustomerFeedback') bool isFeedbackPositive, DateTime inspectorRequestedAt, String origin, String estimationRequestId
});




}
/// @nodoc
class __$VehicleValuationDataCopyWithImpl<$Res>
    implements _$VehicleValuationDataCopyWith<$Res> {
  __$VehicleValuationDataCopyWithImpl(this._self, this._then);

  final _VehicleValuationData _self;
  final $Res Function(_VehicleValuationData) _then;

/// Create a copy of VehicleValuationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? feedback = null,Object? valuatedAt = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? make = null,Object? model = null,Object? externalId = null,Object? price = null,Object? isFeedbackPositive = null,Object? inspectorRequestedAt = null,Object? origin = null,Object? estimationRequestId = null,}) {
  return _then(_VehicleValuationData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,valuatedAt: null == valuatedAt ? _self.valuatedAt : valuatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isFeedbackPositive: null == isFeedbackPositive ? _self.isFeedbackPositive : isFeedbackPositive // ignore: cast_nullable_to_non_nullable
as bool,inspectorRequestedAt: null == inspectorRequestedAt ? _self.inspectorRequestedAt : inspectorRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,estimationRequestId: null == estimationRequestId ? _self.estimationRequestId : estimationRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
