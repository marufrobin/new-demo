// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rider_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RiderReferenceModel {

 String? get address; String? get contactNumber; String? get email; String? get name; String? get riderId; String? get serialNumber;
/// Create a copy of RiderReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiderReferenceModelCopyWith<RiderReferenceModel> get copyWith => _$RiderReferenceModelCopyWithImpl<RiderReferenceModel>(this as RiderReferenceModel, _$identity);

  /// Serializes this RiderReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RiderReferenceModel&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,contactNumber,email,name,riderId,serialNumber);

@override
String toString() {
  return 'RiderReferenceModel(address: $address, contactNumber: $contactNumber, email: $email, name: $name, riderId: $riderId, serialNumber: $serialNumber)';
}


}

/// @nodoc
abstract mixin class $RiderReferenceModelCopyWith<$Res>  {
  factory $RiderReferenceModelCopyWith(RiderReferenceModel value, $Res Function(RiderReferenceModel) _then) = _$RiderReferenceModelCopyWithImpl;
@useResult
$Res call({
 String? address, String? contactNumber, String? email, String? name, String? riderId, String? serialNumber
});




}
/// @nodoc
class _$RiderReferenceModelCopyWithImpl<$Res>
    implements $RiderReferenceModelCopyWith<$Res> {
  _$RiderReferenceModelCopyWithImpl(this._self, this._then);

  final RiderReferenceModel _self;
  final $Res Function(RiderReferenceModel) _then;

/// Create a copy of RiderReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = freezed,Object? contactNumber = freezed,Object? email = freezed,Object? name = freezed,Object? riderId = freezed,Object? serialNumber = freezed,}) {
  return _then(_self.copyWith(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,riderId: freezed == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RiderReferenceModel implements RiderReferenceModel {
   _RiderReferenceModel({this.address, this.contactNumber, this.email, this.name, this.riderId, this.serialNumber});
  factory _RiderReferenceModel.fromJson(Map<String, dynamic> json) => _$RiderReferenceModelFromJson(json);

@override final  String? address;
@override final  String? contactNumber;
@override final  String? email;
@override final  String? name;
@override final  String? riderId;
@override final  String? serialNumber;

/// Create a copy of RiderReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RiderReferenceModelCopyWith<_RiderReferenceModel> get copyWith => __$RiderReferenceModelCopyWithImpl<_RiderReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RiderReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RiderReferenceModel&&(identical(other.address, address) || other.address == address)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,contactNumber,email,name,riderId,serialNumber);

@override
String toString() {
  return 'RiderReferenceModel(address: $address, contactNumber: $contactNumber, email: $email, name: $name, riderId: $riderId, serialNumber: $serialNumber)';
}


}

/// @nodoc
abstract mixin class _$RiderReferenceModelCopyWith<$Res> implements $RiderReferenceModelCopyWith<$Res> {
  factory _$RiderReferenceModelCopyWith(_RiderReferenceModel value, $Res Function(_RiderReferenceModel) _then) = __$RiderReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 String? address, String? contactNumber, String? email, String? name, String? riderId, String? serialNumber
});




}
/// @nodoc
class __$RiderReferenceModelCopyWithImpl<$Res>
    implements _$RiderReferenceModelCopyWith<$Res> {
  __$RiderReferenceModelCopyWithImpl(this._self, this._then);

  final _RiderReferenceModel _self;
  final $Res Function(_RiderReferenceModel) _then;

/// Create a copy of RiderReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = freezed,Object? contactNumber = freezed,Object? email = freezed,Object? name = freezed,Object? riderId = freezed,Object? serialNumber = freezed,}) {
  return _then(_RiderReferenceModel(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,riderId: freezed == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
