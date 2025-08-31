// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageModel {

@JsonKey(name: '_id') String? get id; String? get body; ResourceCommitHistoryReference? get commits; DateTime? get createdAt; String? get handel; String? get title; DateTime? get updatedAt;
/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageModelCopyWith<PageModel> get copyWith => _$PageModelCopyWithImpl<PageModel>(this as PageModel, _$identity);

  /// Serializes this PageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.commits, commits) || other.commits == commits)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.handel, handel) || other.handel == handel)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,commits,createdAt,handel,title,updatedAt);

@override
String toString() {
  return 'PageModel(id: $id, body: $body, commits: $commits, createdAt: $createdAt, handel: $handel, title: $title, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PageModelCopyWith<$Res>  {
  factory $PageModelCopyWith(PageModel value, $Res Function(PageModel) _then) = _$PageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, ResourceCommitHistoryReference? commits, DateTime? createdAt, String? handel, String? title, DateTime? updatedAt
});


$ResourceCommitHistoryReferenceCopyWith<$Res>? get commits;

}
/// @nodoc
class _$PageModelCopyWithImpl<$Res>
    implements $PageModelCopyWith<$Res> {
  _$PageModelCopyWithImpl(this._self, this._then);

  final PageModel _self;
  final $Res Function(PageModel) _then;

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? body = freezed,Object? commits = freezed,Object? createdAt = freezed,Object? handel = freezed,Object? title = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,commits: freezed == commits ? _self.commits : commits // ignore: cast_nullable_to_non_nullable
as ResourceCommitHistoryReference?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,handel: freezed == handel ? _self.handel : handel // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCommitHistoryReferenceCopyWith<$Res>? get commits {
    if (_self.commits == null) {
    return null;
  }

  return $ResourceCommitHistoryReferenceCopyWith<$Res>(_self.commits!, (value) {
    return _then(_self.copyWith(commits: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PageModel implements PageModel {
  const _PageModel({@JsonKey(name: '_id') this.id, this.body, this.commits, this.createdAt, this.handel, this.title, this.updatedAt});
  factory _PageModel.fromJson(Map<String, dynamic> json) => _$PageModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? body;
@override final  ResourceCommitHistoryReference? commits;
@override final  DateTime? createdAt;
@override final  String? handel;
@override final  String? title;
@override final  DateTime? updatedAt;

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageModelCopyWith<_PageModel> get copyWith => __$PageModelCopyWithImpl<_PageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.commits, commits) || other.commits == commits)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.handel, handel) || other.handel == handel)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,commits,createdAt,handel,title,updatedAt);

@override
String toString() {
  return 'PageModel(id: $id, body: $body, commits: $commits, createdAt: $createdAt, handel: $handel, title: $title, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PageModelCopyWith<$Res> implements $PageModelCopyWith<$Res> {
  factory _$PageModelCopyWith(_PageModel value, $Res Function(_PageModel) _then) = __$PageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, ResourceCommitHistoryReference? commits, DateTime? createdAt, String? handel, String? title, DateTime? updatedAt
});


@override $ResourceCommitHistoryReferenceCopyWith<$Res>? get commits;

}
/// @nodoc
class __$PageModelCopyWithImpl<$Res>
    implements _$PageModelCopyWith<$Res> {
  __$PageModelCopyWithImpl(this._self, this._then);

  final _PageModel _self;
  final $Res Function(_PageModel) _then;

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? body = freezed,Object? commits = freezed,Object? createdAt = freezed,Object? handel = freezed,Object? title = freezed,Object? updatedAt = freezed,}) {
  return _then(_PageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,commits: freezed == commits ? _self.commits : commits // ignore: cast_nullable_to_non_nullable
as ResourceCommitHistoryReference?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,handel: freezed == handel ? _self.handel : handel // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCommitHistoryReferenceCopyWith<$Res>? get commits {
    if (_self.commits == null) {
    return null;
  }

  return $ResourceCommitHistoryReferenceCopyWith<$Res>(_self.commits!, (value) {
    return _then(_self.copyWith(commits: value));
  });
}
}

// dart format on
