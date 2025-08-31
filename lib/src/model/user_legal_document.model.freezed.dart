// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_legal_document.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLegalDocumentModel {

 ServerFileReferenceModel? get license; ServerFileReferenceModel? get nidPhoto; ServerFileReferenceModel? get vehiclePhoto;
/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLegalDocumentModelCopyWith<UserLegalDocumentModel> get copyWith => _$UserLegalDocumentModelCopyWithImpl<UserLegalDocumentModel>(this as UserLegalDocumentModel, _$identity);

  /// Serializes this UserLegalDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLegalDocumentModel&&(identical(other.license, license) || other.license == license)&&(identical(other.nidPhoto, nidPhoto) || other.nidPhoto == nidPhoto)&&(identical(other.vehiclePhoto, vehiclePhoto) || other.vehiclePhoto == vehiclePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,license,nidPhoto,vehiclePhoto);

@override
String toString() {
  return 'UserLegalDocumentModel(license: $license, nidPhoto: $nidPhoto, vehiclePhoto: $vehiclePhoto)';
}


}

/// @nodoc
abstract mixin class $UserLegalDocumentModelCopyWith<$Res>  {
  factory $UserLegalDocumentModelCopyWith(UserLegalDocumentModel value, $Res Function(UserLegalDocumentModel) _then) = _$UserLegalDocumentModelCopyWithImpl;
@useResult
$Res call({
 ServerFileReferenceModel? license, ServerFileReferenceModel? nidPhoto, ServerFileReferenceModel? vehiclePhoto
});


$ServerFileReferenceModelCopyWith<$Res>? get license;$ServerFileReferenceModelCopyWith<$Res>? get nidPhoto;$ServerFileReferenceModelCopyWith<$Res>? get vehiclePhoto;

}
/// @nodoc
class _$UserLegalDocumentModelCopyWithImpl<$Res>
    implements $UserLegalDocumentModelCopyWith<$Res> {
  _$UserLegalDocumentModelCopyWithImpl(this._self, this._then);

  final UserLegalDocumentModel _self;
  final $Res Function(UserLegalDocumentModel) _then;

/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? license = freezed,Object? nidPhoto = freezed,Object? vehiclePhoto = freezed,}) {
  return _then(_self.copyWith(
license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,nidPhoto: freezed == nidPhoto ? _self.nidPhoto : nidPhoto // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,vehiclePhoto: freezed == vehiclePhoto ? _self.vehiclePhoto : vehiclePhoto // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,
  ));
}
/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get nidPhoto {
    if (_self.nidPhoto == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.nidPhoto!, (value) {
    return _then(_self.copyWith(nidPhoto: value));
  });
}/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get vehiclePhoto {
    if (_self.vehiclePhoto == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.vehiclePhoto!, (value) {
    return _then(_self.copyWith(vehiclePhoto: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserLegalDocumentModel implements UserLegalDocumentModel {
  const _UserLegalDocumentModel({this.license, this.nidPhoto, this.vehiclePhoto});
  factory _UserLegalDocumentModel.fromJson(Map<String, dynamic> json) => _$UserLegalDocumentModelFromJson(json);

@override final  ServerFileReferenceModel? license;
@override final  ServerFileReferenceModel? nidPhoto;
@override final  ServerFileReferenceModel? vehiclePhoto;

/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLegalDocumentModelCopyWith<_UserLegalDocumentModel> get copyWith => __$UserLegalDocumentModelCopyWithImpl<_UserLegalDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLegalDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLegalDocumentModel&&(identical(other.license, license) || other.license == license)&&(identical(other.nidPhoto, nidPhoto) || other.nidPhoto == nidPhoto)&&(identical(other.vehiclePhoto, vehiclePhoto) || other.vehiclePhoto == vehiclePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,license,nidPhoto,vehiclePhoto);

@override
String toString() {
  return 'UserLegalDocumentModel(license: $license, nidPhoto: $nidPhoto, vehiclePhoto: $vehiclePhoto)';
}


}

/// @nodoc
abstract mixin class _$UserLegalDocumentModelCopyWith<$Res> implements $UserLegalDocumentModelCopyWith<$Res> {
  factory _$UserLegalDocumentModelCopyWith(_UserLegalDocumentModel value, $Res Function(_UserLegalDocumentModel) _then) = __$UserLegalDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 ServerFileReferenceModel? license, ServerFileReferenceModel? nidPhoto, ServerFileReferenceModel? vehiclePhoto
});


@override $ServerFileReferenceModelCopyWith<$Res>? get license;@override $ServerFileReferenceModelCopyWith<$Res>? get nidPhoto;@override $ServerFileReferenceModelCopyWith<$Res>? get vehiclePhoto;

}
/// @nodoc
class __$UserLegalDocumentModelCopyWithImpl<$Res>
    implements _$UserLegalDocumentModelCopyWith<$Res> {
  __$UserLegalDocumentModelCopyWithImpl(this._self, this._then);

  final _UserLegalDocumentModel _self;
  final $Res Function(_UserLegalDocumentModel) _then;

/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? license = freezed,Object? nidPhoto = freezed,Object? vehiclePhoto = freezed,}) {
  return _then(_UserLegalDocumentModel(
license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,nidPhoto: freezed == nidPhoto ? _self.nidPhoto : nidPhoto // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,vehiclePhoto: freezed == vehiclePhoto ? _self.vehiclePhoto : vehiclePhoto // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,
  ));
}

/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get nidPhoto {
    if (_self.nidPhoto == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.nidPhoto!, (value) {
    return _then(_self.copyWith(nidPhoto: value));
  });
}/// Create a copy of UserLegalDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get vehiclePhoto {
    if (_self.vehiclePhoto == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.vehiclePhoto!, (value) {
    return _then(_self.copyWith(vehiclePhoto: value));
  });
}
}

// dart format on
