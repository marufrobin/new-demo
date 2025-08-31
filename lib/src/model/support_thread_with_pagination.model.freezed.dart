// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_thread_with_pagination.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportThreadWithPaginationModel {

 PaginationMeta? get meta; List<SupportThreadModel?>? get nodes;
/// Create a copy of SupportThreadWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportThreadWithPaginationModelCopyWith<SupportThreadWithPaginationModel> get copyWith => _$SupportThreadWithPaginationModelCopyWithImpl<SupportThreadWithPaginationModel>(this as SupportThreadWithPaginationModel, _$identity);

  /// Serializes this SupportThreadWithPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportThreadWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'SupportThreadWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $SupportThreadWithPaginationModelCopyWith<$Res>  {
  factory $SupportThreadWithPaginationModelCopyWith(SupportThreadWithPaginationModel value, $Res Function(SupportThreadWithPaginationModel) _then) = _$SupportThreadWithPaginationModelCopyWithImpl;
@useResult
$Res call({
 PaginationMeta? meta, List<SupportThreadModel?>? nodes
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$SupportThreadWithPaginationModelCopyWithImpl<$Res>
    implements $SupportThreadWithPaginationModelCopyWith<$Res> {
  _$SupportThreadWithPaginationModelCopyWithImpl(this._self, this._then);

  final SupportThreadWithPaginationModel _self;
  final $Res Function(SupportThreadWithPaginationModel) _then;

/// Create a copy of SupportThreadWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<SupportThreadModel?>?,
  ));
}
/// Create a copy of SupportThreadWithPaginationModel
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

class _SupportThreadWithPaginationModel implements SupportThreadWithPaginationModel {
  const _SupportThreadWithPaginationModel({this.meta, final  List<SupportThreadModel?>? nodes}): _nodes = nodes;
  factory _SupportThreadWithPaginationModel.fromJson(Map<String, dynamic> json) => _$SupportThreadWithPaginationModelFromJson(json);

@override final  PaginationMeta? meta;
 final  List<SupportThreadModel?>? _nodes;
@override List<SupportThreadModel?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SupportThreadWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportThreadWithPaginationModelCopyWith<_SupportThreadWithPaginationModel> get copyWith => __$SupportThreadWithPaginationModelCopyWithImpl<_SupportThreadWithPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportThreadWithPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportThreadWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'SupportThreadWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$SupportThreadWithPaginationModelCopyWith<$Res> implements $SupportThreadWithPaginationModelCopyWith<$Res> {
  factory _$SupportThreadWithPaginationModelCopyWith(_SupportThreadWithPaginationModel value, $Res Function(_SupportThreadWithPaginationModel) _then) = __$SupportThreadWithPaginationModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationMeta? meta, List<SupportThreadModel?>? nodes
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$SupportThreadWithPaginationModelCopyWithImpl<$Res>
    implements _$SupportThreadWithPaginationModelCopyWith<$Res> {
  __$SupportThreadWithPaginationModelCopyWithImpl(this._self, this._then);

  final _SupportThreadWithPaginationModel _self;
  final $Res Function(_SupportThreadWithPaginationModel) _then;

/// Create a copy of SupportThreadWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_SupportThreadWithPaginationModel(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<SupportThreadModel?>?,
  ));
}

/// Create a copy of SupportThreadWithPaginationModel
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
