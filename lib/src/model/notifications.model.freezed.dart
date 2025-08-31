// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsModel {

 List<NotificationModel?>? get nodes; PaginationMeta? get meta;
/// Create a copy of NotificationsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsModelCopyWith<NotificationsModel> get copyWith => _$NotificationsModelCopyWithImpl<NotificationsModel>(this as NotificationsModel, _$identity);

  /// Serializes this NotificationsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsModel&&const DeepCollectionEquality().equals(other.nodes, nodes)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nodes),meta);

@override
String toString() {
  return 'NotificationsModel(nodes: $nodes, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationsModelCopyWith<$Res>  {
  factory $NotificationsModelCopyWith(NotificationsModel value, $Res Function(NotificationsModel) _then) = _$NotificationsModelCopyWithImpl;
@useResult
$Res call({
 List<NotificationModel?>? nodes, PaginationMeta? meta
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._self, this._then);

  final NotificationsModel _self;
  final $Res Function(NotificationsModel) _then;

/// Create a copy of NotificationsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodes = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<NotificationModel?>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}
/// Create a copy of NotificationsModel
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

class _NotificationsModel implements NotificationsModel {
  const _NotificationsModel({final  List<NotificationModel?>? nodes, this.meta}): _nodes = nodes;
  factory _NotificationsModel.fromJson(Map<String, dynamic> json) => _$NotificationsModelFromJson(json);

 final  List<NotificationModel?>? _nodes;
@override List<NotificationModel?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PaginationMeta? meta;

/// Create a copy of NotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsModelCopyWith<_NotificationsModel> get copyWith => __$NotificationsModelCopyWithImpl<_NotificationsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsModel&&const DeepCollectionEquality().equals(other._nodes, _nodes)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nodes),meta);

@override
String toString() {
  return 'NotificationsModel(nodes: $nodes, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationsModelCopyWith<$Res> implements $NotificationsModelCopyWith<$Res> {
  factory _$NotificationsModelCopyWith(_NotificationsModel value, $Res Function(_NotificationsModel) _then) = __$NotificationsModelCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationModel?>? nodes, PaginationMeta? meta
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationsModelCopyWithImpl<$Res>
    implements _$NotificationsModelCopyWith<$Res> {
  __$NotificationsModelCopyWithImpl(this._self, this._then);

  final _NotificationsModel _self;
  final $Res Function(_NotificationsModel) _then;

/// Create a copy of NotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodes = freezed,Object? meta = freezed,}) {
  return _then(_NotificationsModel(
nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<NotificationModel?>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}

/// Create a copy of NotificationsModel
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
mixin _$NotificationModel {

@JsonKey(name: '_id') String? get id; String? get body; DateTime? get createdAt; String? get payload; List<String>? get recipients; String? get title; String? get topic; DateTime? get updatedAt;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.payload, payload) || other.payload == payload)&&const DeepCollectionEquality().equals(other.recipients, recipients)&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,createdAt,payload,const DeepCollectionEquality().hash(recipients),title,topic,updatedAt);

@override
String toString() {
  return 'NotificationModel(id: $id, body: $body, createdAt: $createdAt, payload: $payload, recipients: $recipients, title: $title, topic: $topic, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, DateTime? createdAt, String? payload, List<String>? recipients, String? title, String? topic, DateTime? updatedAt
});




}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? body = freezed,Object? createdAt = freezed,Object? payload = freezed,Object? recipients = freezed,Object? title = freezed,Object? topic = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,recipients: freezed == recipients ? _self.recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
  const _NotificationModel({@JsonKey(name: '_id') this.id, this.body, this.createdAt, this.payload, final  List<String>? recipients, this.title, this.topic, this.updatedAt}): _recipients = recipients;
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? body;
@override final  DateTime? createdAt;
@override final  String? payload;
 final  List<String>? _recipients;
@override List<String>? get recipients {
  final value = _recipients;
  if (value == null) return null;
  if (_recipients is EqualUnmodifiableListView) return _recipients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? title;
@override final  String? topic;
@override final  DateTime? updatedAt;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.payload, payload) || other.payload == payload)&&const DeepCollectionEquality().equals(other._recipients, _recipients)&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,createdAt,payload,const DeepCollectionEquality().hash(_recipients),title,topic,updatedAt);

@override
String toString() {
  return 'NotificationModel(id: $id, body: $body, createdAt: $createdAt, payload: $payload, recipients: $recipients, title: $title, topic: $topic, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? body, DateTime? createdAt, String? payload, List<String>? recipients, String? title, String? topic, DateTime? updatedAt
});




}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? body = freezed,Object? createdAt = freezed,Object? payload = freezed,Object? recipients = freezed,Object? title = freezed,Object? topic = freezed,Object? updatedAt = freezed,}) {
  return _then(_NotificationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,recipients: freezed == recipients ? _self._recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
