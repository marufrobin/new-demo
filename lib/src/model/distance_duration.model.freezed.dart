// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_duration.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistanceDurationModel {

 DistanceDurationResponse? get distance; DistanceDurationResponse? get duration;
/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistanceDurationModelCopyWith<DistanceDurationModel> get copyWith => _$DistanceDurationModelCopyWithImpl<DistanceDurationModel>(this as DistanceDurationModel, _$identity);

  /// Serializes this DistanceDurationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistanceDurationModel&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distance,duration);

@override
String toString() {
  return 'DistanceDurationModel(distance: $distance, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $DistanceDurationModelCopyWith<$Res>  {
  factory $DistanceDurationModelCopyWith(DistanceDurationModel value, $Res Function(DistanceDurationModel) _then) = _$DistanceDurationModelCopyWithImpl;
@useResult
$Res call({
 DistanceDurationResponse? distance, DistanceDurationResponse? duration
});


$DistanceDurationResponseCopyWith<$Res>? get distance;$DistanceDurationResponseCopyWith<$Res>? get duration;

}
/// @nodoc
class _$DistanceDurationModelCopyWithImpl<$Res>
    implements $DistanceDurationModelCopyWith<$Res> {
  _$DistanceDurationModelCopyWithImpl(this._self, this._then);

  final DistanceDurationModel _self;
  final $Res Function(DistanceDurationModel) _then;

/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? distance = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as DistanceDurationResponse?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DistanceDurationResponse?,
  ));
}
/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceDurationResponseCopyWith<$Res>? get distance {
    if (_self.distance == null) {
    return null;
  }

  return $DistanceDurationResponseCopyWith<$Res>(_self.distance!, (value) {
    return _then(_self.copyWith(distance: value));
  });
}/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceDurationResponseCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DistanceDurationResponseCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DistanceDurationModel implements DistanceDurationModel {
   _DistanceDurationModel({this.distance, this.duration});
  factory _DistanceDurationModel.fromJson(Map<String, dynamic> json) => _$DistanceDurationModelFromJson(json);

@override final  DistanceDurationResponse? distance;
@override final  DistanceDurationResponse? duration;

/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistanceDurationModelCopyWith<_DistanceDurationModel> get copyWith => __$DistanceDurationModelCopyWithImpl<_DistanceDurationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistanceDurationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistanceDurationModel&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distance,duration);

@override
String toString() {
  return 'DistanceDurationModel(distance: $distance, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$DistanceDurationModelCopyWith<$Res> implements $DistanceDurationModelCopyWith<$Res> {
  factory _$DistanceDurationModelCopyWith(_DistanceDurationModel value, $Res Function(_DistanceDurationModel) _then) = __$DistanceDurationModelCopyWithImpl;
@override @useResult
$Res call({
 DistanceDurationResponse? distance, DistanceDurationResponse? duration
});


@override $DistanceDurationResponseCopyWith<$Res>? get distance;@override $DistanceDurationResponseCopyWith<$Res>? get duration;

}
/// @nodoc
class __$DistanceDurationModelCopyWithImpl<$Res>
    implements _$DistanceDurationModelCopyWith<$Res> {
  __$DistanceDurationModelCopyWithImpl(this._self, this._then);

  final _DistanceDurationModel _self;
  final $Res Function(_DistanceDurationModel) _then;

/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? distance = freezed,Object? duration = freezed,}) {
  return _then(_DistanceDurationModel(
distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as DistanceDurationResponse?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DistanceDurationResponse?,
  ));
}

/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceDurationResponseCopyWith<$Res>? get distance {
    if (_self.distance == null) {
    return null;
  }

  return $DistanceDurationResponseCopyWith<$Res>(_self.distance!, (value) {
    return _then(_self.copyWith(distance: value));
  });
}/// Create a copy of DistanceDurationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceDurationResponseCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DistanceDurationResponseCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// @nodoc
mixin _$DistanceDurationResponse {

 String? get text; int? get value;
/// Create a copy of DistanceDurationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistanceDurationResponseCopyWith<DistanceDurationResponse> get copyWith => _$DistanceDurationResponseCopyWithImpl<DistanceDurationResponse>(this as DistanceDurationResponse, _$identity);

  /// Serializes this DistanceDurationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistanceDurationResponse&&(identical(other.text, text) || other.text == text)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,value);

@override
String toString() {
  return 'DistanceDurationResponse(text: $text, value: $value)';
}


}

/// @nodoc
abstract mixin class $DistanceDurationResponseCopyWith<$Res>  {
  factory $DistanceDurationResponseCopyWith(DistanceDurationResponse value, $Res Function(DistanceDurationResponse) _then) = _$DistanceDurationResponseCopyWithImpl;
@useResult
$Res call({
 String? text, int? value
});




}
/// @nodoc
class _$DistanceDurationResponseCopyWithImpl<$Res>
    implements $DistanceDurationResponseCopyWith<$Res> {
  _$DistanceDurationResponseCopyWithImpl(this._self, this._then);

  final DistanceDurationResponse _self;
  final $Res Function(DistanceDurationResponse) _then;

/// Create a copy of DistanceDurationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DistanceDurationResponse implements DistanceDurationResponse {
   _DistanceDurationResponse({this.text, this.value});
  factory _DistanceDurationResponse.fromJson(Map<String, dynamic> json) => _$DistanceDurationResponseFromJson(json);

@override final  String? text;
@override final  int? value;

/// Create a copy of DistanceDurationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistanceDurationResponseCopyWith<_DistanceDurationResponse> get copyWith => __$DistanceDurationResponseCopyWithImpl<_DistanceDurationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistanceDurationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistanceDurationResponse&&(identical(other.text, text) || other.text == text)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,value);

@override
String toString() {
  return 'DistanceDurationResponse(text: $text, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DistanceDurationResponseCopyWith<$Res> implements $DistanceDurationResponseCopyWith<$Res> {
  factory _$DistanceDurationResponseCopyWith(_DistanceDurationResponse value, $Res Function(_DistanceDurationResponse) _then) = __$DistanceDurationResponseCopyWithImpl;
@override @useResult
$Res call({
 String? text, int? value
});




}
/// @nodoc
class __$DistanceDurationResponseCopyWithImpl<$Res>
    implements _$DistanceDurationResponseCopyWith<$Res> {
  __$DistanceDurationResponseCopyWithImpl(this._self, this._then);

  final _DistanceDurationResponse _self;
  final $Res Function(_DistanceDurationResponse) _then;

/// Create a copy of DistanceDurationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? value = freezed,}) {
  return _then(_DistanceDurationResponse(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
