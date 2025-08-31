// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_commit_history_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResourceCommitHistoryReference {

 String? get action; UserReference? get commitedBy; DateTime? get committedAt;
/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCommitHistoryReferenceCopyWith<ResourceCommitHistoryReference> get copyWith => _$ResourceCommitHistoryReferenceCopyWithImpl<ResourceCommitHistoryReference>(this as ResourceCommitHistoryReference, _$identity);

  /// Serializes this ResourceCommitHistoryReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceCommitHistoryReference&&(identical(other.action, action) || other.action == action)&&(identical(other.commitedBy, commitedBy) || other.commitedBy == commitedBy)&&(identical(other.committedAt, committedAt) || other.committedAt == committedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,commitedBy,committedAt);

@override
String toString() {
  return 'ResourceCommitHistoryReference(action: $action, commitedBy: $commitedBy, committedAt: $committedAt)';
}


}

/// @nodoc
abstract mixin class $ResourceCommitHistoryReferenceCopyWith<$Res>  {
  factory $ResourceCommitHistoryReferenceCopyWith(ResourceCommitHistoryReference value, $Res Function(ResourceCommitHistoryReference) _then) = _$ResourceCommitHistoryReferenceCopyWithImpl;
@useResult
$Res call({
 String? action, UserReference? commitedBy, DateTime? committedAt
});


$UserReferenceCopyWith<$Res>? get commitedBy;

}
/// @nodoc
class _$ResourceCommitHistoryReferenceCopyWithImpl<$Res>
    implements $ResourceCommitHistoryReferenceCopyWith<$Res> {
  _$ResourceCommitHistoryReferenceCopyWithImpl(this._self, this._then);

  final ResourceCommitHistoryReference _self;
  final $Res Function(ResourceCommitHistoryReference) _then;

/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = freezed,Object? commitedBy = freezed,Object? committedAt = freezed,}) {
  return _then(_self.copyWith(
action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,commitedBy: freezed == commitedBy ? _self.commitedBy : commitedBy // ignore: cast_nullable_to_non_nullable
as UserReference?,committedAt: freezed == committedAt ? _self.committedAt : committedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReferenceCopyWith<$Res>? get commitedBy {
    if (_self.commitedBy == null) {
    return null;
  }

  return $UserReferenceCopyWith<$Res>(_self.commitedBy!, (value) {
    return _then(_self.copyWith(commitedBy: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ResourceCommitHistoryReference implements ResourceCommitHistoryReference {
  const _ResourceCommitHistoryReference({this.action, this.commitedBy, this.committedAt});
  factory _ResourceCommitHistoryReference.fromJson(Map<String, dynamic> json) => _$ResourceCommitHistoryReferenceFromJson(json);

@override final  String? action;
@override final  UserReference? commitedBy;
@override final  DateTime? committedAt;

/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCommitHistoryReferenceCopyWith<_ResourceCommitHistoryReference> get copyWith => __$ResourceCommitHistoryReferenceCopyWithImpl<_ResourceCommitHistoryReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceCommitHistoryReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceCommitHistoryReference&&(identical(other.action, action) || other.action == action)&&(identical(other.commitedBy, commitedBy) || other.commitedBy == commitedBy)&&(identical(other.committedAt, committedAt) || other.committedAt == committedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,commitedBy,committedAt);

@override
String toString() {
  return 'ResourceCommitHistoryReference(action: $action, commitedBy: $commitedBy, committedAt: $committedAt)';
}


}

/// @nodoc
abstract mixin class _$ResourceCommitHistoryReferenceCopyWith<$Res> implements $ResourceCommitHistoryReferenceCopyWith<$Res> {
  factory _$ResourceCommitHistoryReferenceCopyWith(_ResourceCommitHistoryReference value, $Res Function(_ResourceCommitHistoryReference) _then) = __$ResourceCommitHistoryReferenceCopyWithImpl;
@override @useResult
$Res call({
 String? action, UserReference? commitedBy, DateTime? committedAt
});


@override $UserReferenceCopyWith<$Res>? get commitedBy;

}
/// @nodoc
class __$ResourceCommitHistoryReferenceCopyWithImpl<$Res>
    implements _$ResourceCommitHistoryReferenceCopyWith<$Res> {
  __$ResourceCommitHistoryReferenceCopyWithImpl(this._self, this._then);

  final _ResourceCommitHistoryReference _self;
  final $Res Function(_ResourceCommitHistoryReference) _then;

/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = freezed,Object? commitedBy = freezed,Object? committedAt = freezed,}) {
  return _then(_ResourceCommitHistoryReference(
action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,commitedBy: freezed == commitedBy ? _self.commitedBy : commitedBy // ignore: cast_nullable_to_non_nullable
as UserReference?,committedAt: freezed == committedAt ? _self.committedAt : committedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ResourceCommitHistoryReference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserReferenceCopyWith<$Res>? get commitedBy {
    if (_self.commitedBy == null) {
    return null;
  }

  return $UserReferenceCopyWith<$Res>(_self.commitedBy!, (value) {
    return _then(_self.copyWith(commitedBy: value));
  });
}
}

// dart format on
