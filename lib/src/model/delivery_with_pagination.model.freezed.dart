// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_with_pagination.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryWithPaginationModel {

 PaginationMeta? get meta; List<DeliveryModel?>? get nodes;
/// Create a copy of DeliveryWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryWithPaginationModelCopyWith<DeliveryWithPaginationModel> get copyWith => _$DeliveryWithPaginationModelCopyWithImpl<DeliveryWithPaginationModel>(this as DeliveryWithPaginationModel, _$identity);

  /// Serializes this DeliveryWithPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'DeliveryWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $DeliveryWithPaginationModelCopyWith<$Res>  {
  factory $DeliveryWithPaginationModelCopyWith(DeliveryWithPaginationModel value, $Res Function(DeliveryWithPaginationModel) _then) = _$DeliveryWithPaginationModelCopyWithImpl;
@useResult
$Res call({
 PaginationMeta? meta, List<DeliveryModel?>? nodes
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$DeliveryWithPaginationModelCopyWithImpl<$Res>
    implements $DeliveryWithPaginationModelCopyWith<$Res> {
  _$DeliveryWithPaginationModelCopyWithImpl(this._self, this._then);

  final DeliveryWithPaginationModel _self;
  final $Res Function(DeliveryWithPaginationModel) _then;

/// Create a copy of DeliveryWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}
/// Create a copy of DeliveryWithPaginationModel
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

class _DeliveryWithPaginationModel implements DeliveryWithPaginationModel {
  const _DeliveryWithPaginationModel({this.meta, final  List<DeliveryModel?>? nodes}): _nodes = nodes;
  factory _DeliveryWithPaginationModel.fromJson(Map<String, dynamic> json) => _$DeliveryWithPaginationModelFromJson(json);

@override final  PaginationMeta? meta;
 final  List<DeliveryModel?>? _nodes;
@override List<DeliveryModel?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DeliveryWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryWithPaginationModelCopyWith<_DeliveryWithPaginationModel> get copyWith => __$DeliveryWithPaginationModelCopyWithImpl<_DeliveryWithPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryWithPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryWithPaginationModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'DeliveryWithPaginationModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$DeliveryWithPaginationModelCopyWith<$Res> implements $DeliveryWithPaginationModelCopyWith<$Res> {
  factory _$DeliveryWithPaginationModelCopyWith(_DeliveryWithPaginationModel value, $Res Function(_DeliveryWithPaginationModel) _then) = __$DeliveryWithPaginationModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationMeta? meta, List<DeliveryModel?>? nodes
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$DeliveryWithPaginationModelCopyWithImpl<$Res>
    implements _$DeliveryWithPaginationModelCopyWith<$Res> {
  __$DeliveryWithPaginationModelCopyWithImpl(this._self, this._then);

  final _DeliveryWithPaginationModel _self;
  final $Res Function(_DeliveryWithPaginationModel) _then;

/// Create a copy of DeliveryWithPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_DeliveryWithPaginationModel(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}

/// Create a copy of DeliveryWithPaginationModel
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
