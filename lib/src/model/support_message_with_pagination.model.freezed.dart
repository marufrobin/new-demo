// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_message_with_pagination.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportMessageWithPaginationModel {

 PaginationMeta? get meta; List<SupportMessageModel?>? get nodes;
/// Create a copy of SupportMessageWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportMessageWithPaginationModelCopyWith<SupportMessageWithPaginationModel> get copyWith => _$SupportMessageWithPaginationModelCopyWithImpl<SupportMessageWithPaginationModel>(this as SupportMessageWithPaginationModel, _$identity);

  /// Serializes this SupportMessageWithPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportMessageWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'SupportMessageWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $SupportMessageWithPaginationModelCopyWith<$Res>  {
  factory $SupportMessageWithPaginationModelCopyWith(SupportMessageWithPaginationModel value, $Res Function(SupportMessageWithPaginationModel) _then) = _$SupportMessageWithPaginationModelCopyWithImpl;
@useResult
$Res call({
 PaginationMeta? meta, List<SupportMessageModel?>? nodes
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$SupportMessageWithPaginationModelCopyWithImpl<$Res>
    implements $SupportMessageWithPaginationModelCopyWith<$Res> {
  _$SupportMessageWithPaginationModelCopyWithImpl(this._self, this._then);

  final SupportMessageWithPaginationModel _self;
  final $Res Function(SupportMessageWithPaginationModel) _then;

/// Create a copy of SupportMessageWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<SupportMessageModel?>?,
  ));
}
/// Create a copy of SupportMessageWithPaginationModel
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

class _SupportMessageWithPaginationModel implements SupportMessageWithPaginationModel {
  const _SupportMessageWithPaginationModel({this.meta, final  List<SupportMessageModel?>? nodes}): _nodes = nodes;
  factory _SupportMessageWithPaginationModel.fromJson(Map<String, dynamic> json) => _$SupportMessageWithPaginationModelFromJson(json);

@override final  PaginationMeta? meta;
 final  List<SupportMessageModel?>? _nodes;
@override List<SupportMessageModel?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SupportMessageWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportMessageWithPaginationModelCopyWith<_SupportMessageWithPaginationModel> get copyWith => __$SupportMessageWithPaginationModelCopyWithImpl<_SupportMessageWithPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportMessageWithPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportMessageWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'SupportMessageWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$SupportMessageWithPaginationModelCopyWith<$Res> implements $SupportMessageWithPaginationModelCopyWith<$Res> {
  factory _$SupportMessageWithPaginationModelCopyWith(_SupportMessageWithPaginationModel value, $Res Function(_SupportMessageWithPaginationModel) _then) = __$SupportMessageWithPaginationModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationMeta? meta, List<SupportMessageModel?>? nodes
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$SupportMessageWithPaginationModelCopyWithImpl<$Res>
    implements _$SupportMessageWithPaginationModelCopyWith<$Res> {
  __$SupportMessageWithPaginationModelCopyWithImpl(this._self, this._then);

  final _SupportMessageWithPaginationModel _self;
  final $Res Function(_SupportMessageWithPaginationModel) _then;

/// Create a copy of SupportMessageWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_SupportMessageWithPaginationModel(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<SupportMessageModel?>?,
  ));
}

/// Create a copy of SupportMessageWithPaginationModel
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

// dart format on
