// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_file_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerFileReferenceModel {

 String? get bucket; String? get externalUrl; String? get key; String? get region;
/// Create a copy of ServerFileReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<ServerFileReferenceModel> get copyWith => _$ServerFileReferenceModelCopyWithImpl<ServerFileReferenceModel>(this as ServerFileReferenceModel, _$identity);

  /// Serializes this ServerFileReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFileReferenceModel&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.key, key) || other.key == key)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucket,externalUrl,key,region);

@override
String toString() {
  return 'ServerFileReferenceModel(bucket: $bucket, externalUrl: $externalUrl, key: $key, region: $region)';
}


}

/// @nodoc
abstract mixin class $ServerFileReferenceModelCopyWith<$Res>  {
  factory $ServerFileReferenceModelCopyWith(ServerFileReferenceModel value, $Res Function(ServerFileReferenceModel) _then) = _$ServerFileReferenceModelCopyWithImpl;
@useResult
$Res call({
 String? bucket, String? externalUrl, String? key, String? region
});




}
/// @nodoc
class _$ServerFileReferenceModelCopyWithImpl<$Res>
    implements $ServerFileReferenceModelCopyWith<$Res> {
  _$ServerFileReferenceModelCopyWithImpl(this._self, this._then);

  final ServerFileReferenceModel _self;
  final $Res Function(ServerFileReferenceModel) _then;

/// Create a copy of ServerFileReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucket = freezed,Object? externalUrl = freezed,Object? key = freezed,Object? region = freezed,}) {
  return _then(_self.copyWith(
bucket: freezed == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServerFileReferenceModel implements ServerFileReferenceModel {
  const _ServerFileReferenceModel({this.bucket, this.externalUrl, this.key, this.region});
  factory _ServerFileReferenceModel.fromJson(Map<String, dynamic> json) => _$ServerFileReferenceModelFromJson(json);

@override final  String? bucket;
@override final  String? externalUrl;
@override final  String? key;
@override final  String? region;

/// Create a copy of ServerFileReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerFileReferenceModelCopyWith<_ServerFileReferenceModel> get copyWith => __$ServerFileReferenceModelCopyWithImpl<_ServerFileReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerFileReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFileReferenceModel&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.key, key) || other.key == key)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucket,externalUrl,key,region);

@override
String toString() {
  return 'ServerFileReferenceModel(bucket: $bucket, externalUrl: $externalUrl, key: $key, region: $region)';
}


}

/// @nodoc
abstract mixin class _$ServerFileReferenceModelCopyWith<$Res> implements $ServerFileReferenceModelCopyWith<$Res> {
  factory _$ServerFileReferenceModelCopyWith(_ServerFileReferenceModel value, $Res Function(_ServerFileReferenceModel) _then) = __$ServerFileReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 String? bucket, String? externalUrl, String? key, String? region
});




}
/// @nodoc
class __$ServerFileReferenceModelCopyWithImpl<$Res>
    implements _$ServerFileReferenceModelCopyWith<$Res> {
  __$ServerFileReferenceModelCopyWithImpl(this._self, this._then);

  final _ServerFileReferenceModel _self;
  final $Res Function(_ServerFileReferenceModel) _then;

/// Create a copy of ServerFileReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bucket = freezed,Object? externalUrl = freezed,Object? key = freezed,Object? region = freezed,}) {
  return _then(_ServerFileReferenceModel(
bucket: freezed == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
