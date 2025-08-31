// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerReference {

 String? get referenceId; String? get name; String? get phoneNumber; String? get email;
/// Create a copy of CustomerReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReferenceCopyWith<CustomerReference> get copyWith => _$CustomerReferenceCopyWithImpl<CustomerReference>(this as CustomerReference, _$identity);

  /// Serializes this CustomerReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReference&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referenceId,name,phoneNumber,email);

@override
String toString() {
  return 'CustomerReference(referenceId: $referenceId, name: $name, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class $CustomerReferenceCopyWith<$Res>  {
  factory $CustomerReferenceCopyWith(CustomerReference value, $Res Function(CustomerReference) _then) = _$CustomerReferenceCopyWithImpl;
@useResult
$Res call({
 String? referenceId, String? name, String? phoneNumber, String? email
});




}
/// @nodoc
class _$CustomerReferenceCopyWithImpl<$Res>
    implements $CustomerReferenceCopyWith<$Res> {
  _$CustomerReferenceCopyWithImpl(this._self, this._then);

  final CustomerReference _self;
  final $Res Function(CustomerReference) _then;

/// Create a copy of CustomerReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? referenceId = freezed,Object? name = freezed,Object? phoneNumber = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CustomerReference implements CustomerReference {
  const _CustomerReference({this.referenceId, this.name, this.phoneNumber, this.email});
  factory _CustomerReference.fromJson(Map<String, dynamic> json) => _$CustomerReferenceFromJson(json);

@override final  String? referenceId;
@override final  String? name;
@override final  String? phoneNumber;
@override final  String? email;

/// Create a copy of CustomerReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReferenceCopyWith<_CustomerReference> get copyWith => __$CustomerReferenceCopyWithImpl<_CustomerReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReference&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referenceId,name,phoneNumber,email);

@override
String toString() {
  return 'CustomerReference(referenceId: $referenceId, name: $name, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class _$CustomerReferenceCopyWith<$Res> implements $CustomerReferenceCopyWith<$Res> {
  factory _$CustomerReferenceCopyWith(_CustomerReference value, $Res Function(_CustomerReference) _then) = __$CustomerReferenceCopyWithImpl;
@override @useResult
$Res call({
 String? referenceId, String? name, String? phoneNumber, String? email
});




}
/// @nodoc
class __$CustomerReferenceCopyWithImpl<$Res>
    implements _$CustomerReferenceCopyWith<$Res> {
  __$CustomerReferenceCopyWithImpl(this._self, this._then);

  final _CustomerReference _self;
  final $Res Function(_CustomerReference) _then;

/// Create a copy of CustomerReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? referenceId = freezed,Object? name = freezed,Object? phoneNumber = freezed,Object? email = freezed,}) {
  return _then(_CustomerReference(
referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
