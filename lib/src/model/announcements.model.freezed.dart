// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcements.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnouncementsModel {

 PaginationMeta? get meta; List<Announcement?>? get nodes;
/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementsModelCopyWith<AnnouncementsModel> get copyWith => _$AnnouncementsModelCopyWithImpl<AnnouncementsModel>(this as AnnouncementsModel, _$identity);

  /// Serializes this AnnouncementsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementsModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'AnnouncementsModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $AnnouncementsModelCopyWith<$Res>  {
  factory $AnnouncementsModelCopyWith(AnnouncementsModel value, $Res Function(AnnouncementsModel) _then) = _$AnnouncementsModelCopyWithImpl;
@useResult
$Res call({
 PaginationMeta? meta, List<Announcement?>? nodes
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$AnnouncementsModelCopyWithImpl<$Res>
    implements $AnnouncementsModelCopyWith<$Res> {
  _$AnnouncementsModelCopyWithImpl(this._self, this._then);

  final AnnouncementsModel _self;
  final $Res Function(AnnouncementsModel) _then;

/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<Announcement?>?,
  ));
}
/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AnnouncementsModel implements AnnouncementsModel {
  const _AnnouncementsModel({this.meta, final  List<Announcement?>? nodes}): _nodes = nodes;
  factory _AnnouncementsModel.fromJson(Map<String, dynamic> json) => _$AnnouncementsModelFromJson(json);

@override final  PaginationMeta? meta;
 final  List<Announcement?>? _nodes;
@override List<Announcement?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementsModelCopyWith<_AnnouncementsModel> get copyWith => __$AnnouncementsModelCopyWithImpl<_AnnouncementsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'AnnouncementsModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementsModelCopyWith<$Res> implements $AnnouncementsModelCopyWith<$Res> {
  factory _$AnnouncementsModelCopyWith(_AnnouncementsModel value, $Res Function(_AnnouncementsModel) _then) = __$AnnouncementsModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationMeta? meta, List<Announcement?>? nodes
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$AnnouncementsModelCopyWithImpl<$Res>
    implements _$AnnouncementsModelCopyWith<$Res> {
  __$AnnouncementsModelCopyWithImpl(this._self, this._then);

  final _AnnouncementsModel _self;
  final $Res Function(_AnnouncementsModel) _then;

/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_AnnouncementsModel(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<Announcement?>?,
  ));
}

/// Create a copy of AnnouncementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$Announcement {

@JsonKey(name: '_id') String? get id; String? get body; DateTime? get createdAt; String? get title; DateTime? get updatedAt;
/// Create a copy of Announcement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementCopyWith<Announcement> get copyWith => _$AnnouncementCopyWithImpl<Announcement>(this as Announcement, _$identity);

  /// Serializes this Announcement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Announcement&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,createdAt,title,updatedAt);

@override
String toString() {
  return 'Announcement(id: $id, body: $body, createdAt: $createdAt, title: $title, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnnouncementCopyWith<$Res>  {
  factory $AnnouncementCopyWith(Announcement value, $Res Function(Announcement) _then) = _$AnnouncementCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, DateTime? createdAt, String? title, DateTime? updatedAt
});




}
/// @nodoc
class _$AnnouncementCopyWithImpl<$Res>
    implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._self, this._then);

  final Announcement _self;
  final $Res Function(Announcement) _then;

/// Create a copy of Announcement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? body = freezed,Object? createdAt = freezed,Object? title = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Announcement implements Announcement {
  const _Announcement({@JsonKey(name: '_id') this.id, this.body, this.createdAt, this.title, this.updatedAt});
  factory _Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? body;
@override final  DateTime? createdAt;
@override final  String? title;
@override final  DateTime? updatedAt;

/// Create a copy of Announcement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementCopyWith<_Announcement> get copyWith => __$AnnouncementCopyWithImpl<_Announcement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Announcement&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,createdAt,title,updatedAt);

@override
String toString() {
  return 'Announcement(id: $id, body: $body, createdAt: $createdAt, title: $title, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementCopyWith<$Res> implements $AnnouncementCopyWith<$Res> {
  factory _$AnnouncementCopyWith(_Announcement value, $Res Function(_Announcement) _then) = __$AnnouncementCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, DateTime? createdAt, String? title, DateTime? updatedAt
});




}
/// @nodoc
class __$AnnouncementCopyWithImpl<$Res>
    implements _$AnnouncementCopyWith<$Res> {
  __$AnnouncementCopyWithImpl(this._self, this._then);

  final _Announcement _self;
  final $Res Function(_Announcement) _then;

/// Create a copy of Announcement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? body = freezed,Object? createdAt = freezed,Object? title = freezed,Object? updatedAt = freezed,}) {
  return _then(_Announcement(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
