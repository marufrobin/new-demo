// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_location_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoLocationReferenceModel {

 List<double?>? get coordinates; String? get type;
/// Create a copy of GeoLocationReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoLocationReferenceModelCopyWith<GeoLocationReferenceModel> get copyWith => _$GeoLocationReferenceModelCopyWithImpl<GeoLocationReferenceModel>(this as GeoLocationReferenceModel, _$identity);

  /// Serializes this GeoLocationReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoLocationReferenceModel&&const DeepCollectionEquality().equals(other.coordinates, coordinates)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coordinates),type);

@override
String toString() {
  return 'GeoLocationReferenceModel(coordinates: $coordinates, type: $type)';
}


}

/// @nodoc
abstract mixin class $GeoLocationReferenceModelCopyWith<$Res>  {
  factory $GeoLocationReferenceModelCopyWith(GeoLocationReferenceModel value, $Res Function(GeoLocationReferenceModel) _then) = _$GeoLocationReferenceModelCopyWithImpl;
@useResult
$Res call({
 List<double?>? coordinates, String? type
});




}
/// @nodoc
class _$GeoLocationReferenceModelCopyWithImpl<$Res>
    implements $GeoLocationReferenceModelCopyWith<$Res> {
  _$GeoLocationReferenceModelCopyWithImpl(this._self, this._then);

  final GeoLocationReferenceModel _self;
  final $Res Function(GeoLocationReferenceModel) _then;

/// Create a copy of GeoLocationReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coordinates = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double?>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeoLocationReferenceModel implements GeoLocationReferenceModel {
  const _GeoLocationReferenceModel({final  List<double?>? coordinates, this.type}): _coordinates = coordinates;
  factory _GeoLocationReferenceModel.fromJson(Map<String, dynamic> json) => _$GeoLocationReferenceModelFromJson(json);

 final  List<double?>? _coordinates;
@override List<double?>? get coordinates {
  final value = _coordinates;
  if (value == null) return null;
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? type;

/// Create a copy of GeoLocationReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoLocationReferenceModelCopyWith<_GeoLocationReferenceModel> get copyWith => __$GeoLocationReferenceModelCopyWithImpl<_GeoLocationReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoLocationReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoLocationReferenceModel&&const DeepCollectionEquality().equals(other._coordinates, _coordinates)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coordinates),type);

@override
String toString() {
  return 'GeoLocationReferenceModel(coordinates: $coordinates, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GeoLocationReferenceModelCopyWith<$Res> implements $GeoLocationReferenceModelCopyWith<$Res> {
  factory _$GeoLocationReferenceModelCopyWith(_GeoLocationReferenceModel value, $Res Function(_GeoLocationReferenceModel) _then) = __$GeoLocationReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 List<double?>? coordinates, String? type
});




}
/// @nodoc
class __$GeoLocationReferenceModelCopyWithImpl<$Res>
    implements _$GeoLocationReferenceModelCopyWith<$Res> {
  __$GeoLocationReferenceModelCopyWithImpl(this._self, this._then);

  final _GeoLocationReferenceModel _self;
  final $Res Function(_GeoLocationReferenceModel) _then;

/// Create a copy of GeoLocationReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coordinates = freezed,Object? type = freezed,}) {
  return _then(_GeoLocationReferenceModel(
coordinates: freezed == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double?>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
