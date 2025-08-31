// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_thread.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportThreadModel {

@JsonKey(name: '_id') String? get id; List<ServerFileReferenceModel?>? get attachments; String? get body; DateTime? get createdAt; bool? get softDeteled; SUPPORT_THREAD_STATUS? get status; SUPPORT_DOMAIN? get supportThreadDomain; String? get title; DateTime? get updatedAt; UserReference? get user;
/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportThreadModelCopyWith<SupportThreadModel> get copyWith => _$SupportThreadModelCopyWithImpl<SupportThreadModel>(this as SupportThreadModel, _$identity);

  /// Serializes this SupportThreadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportThreadModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.softDeteled, softDeteled) || other.softDeteled == softDeteled)&&(identical(other.status, status) || other.status == status)&&(identical(other.supportThreadDomain, supportThreadDomain) || other.supportThreadDomain == supportThreadDomain)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(attachments),body,createdAt,softDeteled,status,supportThreadDomain,title,updatedAt,user);

@override
String toString() {
  return 'SupportThreadModel(id: $id, attachments: $attachments, body: $body, createdAt: $createdAt, softDeteled: $softDeteled, status: $status, supportThreadDomain: $supportThreadDomain, title: $title, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $SupportThreadModelCopyWith<$Res>  {
  factory $SupportThreadModelCopyWith(SupportThreadModel value, $Res Function(SupportThreadModel) _then) = _$SupportThreadModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, List<ServerFileReferenceModel?>? attachments, String? body, DateTime? createdAt, bool? softDeteled, SUPPORT_THREAD_STATUS? status, SUPPORT_DOMAIN? supportThreadDomain, String? title, DateTime? updatedAt, UserReference? user
});


$UserReferenceCopyWith<$Res>? get user;

}
/// @nodoc
class _$SupportThreadModelCopyWithImpl<$Res>
    implements $SupportThreadModelCopyWith<$Res> {
  _$SupportThreadModelCopyWithImpl(this._self, this._then);

  final SupportThreadModel _self;
  final $Res Function(SupportThreadModel) _then;

/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? attachments = freezed,Object? body = freezed,Object? createdAt = freezed,Object? softDeteled = freezed,Object? status = freezed,Object? supportThreadDomain = freezed,Object? title = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ServerFileReferenceModel?>?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,softDeteled: freezed == softDeteled ? _self.softDeteled : softDeteled // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SUPPORT_THREAD_STATUS?,supportThreadDomain: freezed == supportThreadDomain ? _self.supportThreadDomain : supportThreadDomain // ignore: cast_nullable_to_non_nullable
as SUPPORT_DOMAIN?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserReference?,
  ));
}
/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReferenceCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserReferenceCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SupportThreadModel implements SupportThreadModel {
  const _SupportThreadModel({@JsonKey(name: '_id') this.id, final  List<ServerFileReferenceModel?>? attachments, this.body, this.createdAt, this.softDeteled, this.status, this.supportThreadDomain, this.title, this.updatedAt, this.user}): _attachments = attachments;
  factory _SupportThreadModel.fromJson(Map<String, dynamic> json) => _$SupportThreadModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
 final  List<ServerFileReferenceModel?>? _attachments;
@override List<ServerFileReferenceModel?>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? body;
@override final  DateTime? createdAt;
@override final  bool? softDeteled;
@override final  SUPPORT_THREAD_STATUS? status;
@override final  SUPPORT_DOMAIN? supportThreadDomain;
@override final  String? title;
@override final  DateTime? updatedAt;
@override final  UserReference? user;

/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportThreadModelCopyWith<_SupportThreadModel> get copyWith => __$SupportThreadModelCopyWithImpl<_SupportThreadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportThreadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportThreadModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.softDeteled, softDeteled) || other.softDeteled == softDeteled)&&(identical(other.status, status) || other.status == status)&&(identical(other.supportThreadDomain, supportThreadDomain) || other.supportThreadDomain == supportThreadDomain)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_attachments),body,createdAt,softDeteled,status,supportThreadDomain,title,updatedAt,user);

@override
String toString() {
  return 'SupportThreadModel(id: $id, attachments: $attachments, body: $body, createdAt: $createdAt, softDeteled: $softDeteled, status: $status, supportThreadDomain: $supportThreadDomain, title: $title, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$SupportThreadModelCopyWith<$Res> implements $SupportThreadModelCopyWith<$Res> {
  factory _$SupportThreadModelCopyWith(_SupportThreadModel value, $Res Function(_SupportThreadModel) _then) = __$SupportThreadModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, List<ServerFileReferenceModel?>? attachments, String? body, DateTime? createdAt, bool? softDeteled, SUPPORT_THREAD_STATUS? status, SUPPORT_DOMAIN? supportThreadDomain, String? title, DateTime? updatedAt, UserReference? user
});


@override $UserReferenceCopyWith<$Res>? get user;

}
/// @nodoc
class __$SupportThreadModelCopyWithImpl<$Res>
    implements _$SupportThreadModelCopyWith<$Res> {
  __$SupportThreadModelCopyWithImpl(this._self, this._then);

  final _SupportThreadModel _self;
  final $Res Function(_SupportThreadModel) _then;

/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? attachments = freezed,Object? body = freezed,Object? createdAt = freezed,Object? softDeteled = freezed,Object? status = freezed,Object? supportThreadDomain = freezed,Object? title = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_SupportThreadModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ServerFileReferenceModel?>?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,softDeteled: freezed == softDeteled ? _self.softDeteled : softDeteled // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SUPPORT_THREAD_STATUS?,supportThreadDomain: freezed == supportThreadDomain ? _self.supportThreadDomain : supportThreadDomain // ignore: cast_nullable_to_non_nullable
as SUPPORT_DOMAIN?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserReference?,
  ));
}

/// Create a copy of SupportThreadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReferenceCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserReferenceCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
