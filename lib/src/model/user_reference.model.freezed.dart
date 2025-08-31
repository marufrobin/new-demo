// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReference {

 String? get email; String? get name; String? get phoneNumber; String? get referenceId;
/// Create a copy of UserReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserReferenceCopyWith<UserReference> get copyWith => _$UserReferenceCopyWithImpl<UserReference>(this as UserReference, _$identity);

  /// Serializes this UserReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReference&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,name,phoneNumber,referenceId);

@override
String toString() {
  return 'UserReference(email: $email, name: $name, phoneNumber: $phoneNumber, referenceId: $referenceId)';
}


}

/// @nodoc
abstract mixin class $UserReferenceCopyWith<$Res>  {
  factory $UserReferenceCopyWith(UserReference value, $Res Function(UserReference) _then) = _$UserReferenceCopyWithImpl;
@useResult
$Res call({
 String? email, String? name, String? phoneNumber, String? referenceId
});




}
/// @nodoc
class _$UserReferenceCopyWithImpl<$Res>
    implements $UserReferenceCopyWith<$Res> {
  _$UserReferenceCopyWithImpl(this._self, this._then);

  final UserReference _self;
  final $Res Function(UserReference) _then;

/// Create a copy of UserReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? name = freezed,Object? phoneNumber = freezed,Object? referenceId = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserReference implements UserReference {
  const _UserReference({this.email, this.name, this.phoneNumber, this.referenceId});
  factory _UserReference.fromJson(Map<String, dynamic> json) => _$UserReferenceFromJson(json);

@override final  String? email;
@override final  String? name;
@override final  String? phoneNumber;
@override final  String? referenceId;

/// Create a copy of UserReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserReferenceCopyWith<_UserReference> get copyWith => __$UserReferenceCopyWithImpl<_UserReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReference&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,name,phoneNumber,referenceId);

@override
String toString() {
  return 'UserReference(email: $email, name: $name, phoneNumber: $phoneNumber, referenceId: $referenceId)';
}


}

/// @nodoc
abstract mixin class _$UserReferenceCopyWith<$Res> implements $UserReferenceCopyWith<$Res> {
  factory _$UserReferenceCopyWith(_UserReference value, $Res Function(_UserReference) _then) = __$UserReferenceCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? name, String? phoneNumber, String? referenceId
});




}
/// @nodoc
class __$UserReferenceCopyWithImpl<$Res>
    implements _$UserReferenceCopyWith<$Res> {
  __$UserReferenceCopyWithImpl(this._self, this._then);

  final _UserReference _self;
  final $Res Function(_UserReference) _then;

/// Create a copy of UserReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? name = freezed,Object? phoneNumber = freezed,Object? referenceId = freezed,}) {
  return _then(_UserReference(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
