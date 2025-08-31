// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationReference {

 String? get title; String? get address; double? get lat; double? get lng;
/// Create a copy of LocationReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationReferenceCopyWith<LocationReference> get copyWith => _$LocationReferenceCopyWithImpl<LocationReference>(this as LocationReference, _$identity);

  /// Serializes this LocationReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationReference&&(identical(other.title, title) || other.title == title)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,address,lat,lng);

@override
String toString() {
  return 'LocationReference(title: $title, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $LocationReferenceCopyWith<$Res>  {
  factory $LocationReferenceCopyWith(LocationReference value, $Res Function(LocationReference) _then) = _$LocationReferenceCopyWithImpl;
@useResult
$Res call({
 String? title, String? address, double? lat, double? lng
});




}
/// @nodoc
class _$LocationReferenceCopyWithImpl<$Res>
    implements $LocationReferenceCopyWith<$Res> {
  _$LocationReferenceCopyWithImpl(this._self, this._then);

  final LocationReference _self;
  final $Res Function(LocationReference) _then;

/// Create a copy of LocationReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LocationReference implements LocationReference {
  const _LocationReference({this.title, this.address, this.lat, this.lng});
  factory _LocationReference.fromJson(Map<String, dynamic> json) => _$LocationReferenceFromJson(json);

@override final  String? title;
@override final  String? address;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of LocationReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationReferenceCopyWith<_LocationReference> get copyWith => __$LocationReferenceCopyWithImpl<_LocationReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationReference&&(identical(other.title, title) || other.title == title)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,address,lat,lng);

@override
String toString() {
  return 'LocationReference(title: $title, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$LocationReferenceCopyWith<$Res> implements $LocationReferenceCopyWith<$Res> {
  factory _$LocationReferenceCopyWith(_LocationReference value, $Res Function(_LocationReference) _then) = __$LocationReferenceCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? address, double? lat, double? lng
});




}
/// @nodoc
class __$LocationReferenceCopyWithImpl<$Res>
    implements _$LocationReferenceCopyWith<$Res> {
  __$LocationReferenceCopyWithImpl(this._self, this._then);

  final _LocationReference _self;
  final $Res Function(_LocationReference) _then;

/// Create a copy of LocationReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_LocationReference(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
