// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorReference {

 String? get name; String? get referenceId; String? get VendorUID;
/// Create a copy of VendorReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorReferenceCopyWith<VendorReference> get copyWith => _$VendorReferenceCopyWithImpl<VendorReference>(this as VendorReference, _$identity);

  /// Serializes this VendorReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorReference&&(identical(other.name, name) || other.name == name)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.VendorUID, VendorUID) || other.VendorUID == VendorUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,referenceId,VendorUID);

@override
String toString() {
  return 'VendorReference(name: $name, referenceId: $referenceId, VendorUID: $VendorUID)';
}


}

/// @nodoc
abstract mixin class $VendorReferenceCopyWith<$Res>  {
  factory $VendorReferenceCopyWith(VendorReference value, $Res Function(VendorReference) _then) = _$VendorReferenceCopyWithImpl;
@useResult
$Res call({
 String? name, String? referenceId, String? VendorUID
});




}
/// @nodoc
class _$VendorReferenceCopyWithImpl<$Res>
    implements $VendorReferenceCopyWith<$Res> {
  _$VendorReferenceCopyWithImpl(this._self, this._then);

  final VendorReference _self;
  final $Res Function(VendorReference) _then;

/// Create a copy of VendorReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? referenceId = freezed,Object? VendorUID = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,VendorUID: freezed == VendorUID ? _self.VendorUID : VendorUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VendorReference implements VendorReference {
  const _VendorReference({this.name, this.referenceId, this.VendorUID});
  factory _VendorReference.fromJson(Map<String, dynamic> json) => _$VendorReferenceFromJson(json);

@override final  String? name;
@override final  String? referenceId;
@override final  String? VendorUID;

/// Create a copy of VendorReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorReferenceCopyWith<_VendorReference> get copyWith => __$VendorReferenceCopyWithImpl<_VendorReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorReference&&(identical(other.name, name) || other.name == name)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.VendorUID, VendorUID) || other.VendorUID == VendorUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,referenceId,VendorUID);

@override
String toString() {
  return 'VendorReference(name: $name, referenceId: $referenceId, VendorUID: $VendorUID)';
}


}

/// @nodoc
abstract mixin class _$VendorReferenceCopyWith<$Res> implements $VendorReferenceCopyWith<$Res> {
  factory _$VendorReferenceCopyWith(_VendorReference value, $Res Function(_VendorReference) _then) = __$VendorReferenceCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? referenceId, String? VendorUID
});




}
/// @nodoc
class __$VendorReferenceCopyWithImpl<$Res>
    implements _$VendorReferenceCopyWith<$Res> {
  __$VendorReferenceCopyWithImpl(this._self, this._then);

  final _VendorReference _self;
  final $Res Function(_VendorReference) _then;

/// Create a copy of VendorReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? referenceId = freezed,Object? VendorUID = freezed,}) {
  return _then(_VendorReference(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,VendorUID: freezed == VendorUID ? _self.VendorUID : VendorUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
