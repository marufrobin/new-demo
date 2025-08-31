// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_from_token.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoFromTokenModel {

 String? get sub; String? get name; String? get email; bool? get email_verified; List<IdentityUserRole?>? get roles; List<String?>? get permissions; String? get tenantId; int? get logins_count; int? get iat; int? get exp; String? get aud; String? get iss;
/// Create a copy of UserInfoFromTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoFromTokenModelCopyWith<UserInfoFromTokenModel> get copyWith => _$UserInfoFromTokenModelCopyWithImpl<UserInfoFromTokenModel>(this as UserInfoFromTokenModel, _$identity);

  /// Serializes this UserInfoFromTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoFromTokenModel&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.email_verified, email_verified) || other.email_verified == email_verified)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.logins_count, logins_count) || other.logins_count == logins_count)&&(identical(other.iat, iat) || other.iat == iat)&&(identical(other.exp, exp) || other.exp == exp)&&(identical(other.aud, aud) || other.aud == aud)&&(identical(other.iss, iss) || other.iss == iss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,name,email,email_verified,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(permissions),tenantId,logins_count,iat,exp,aud,iss);

@override
String toString() {
  return 'UserInfoFromTokenModel(sub: $sub, name: $name, email: $email, email_verified: $email_verified, roles: $roles, permissions: $permissions, tenantId: $tenantId, logins_count: $logins_count, iat: $iat, exp: $exp, aud: $aud, iss: $iss)';
}


}

/// @nodoc
abstract mixin class $UserInfoFromTokenModelCopyWith<$Res>  {
  factory $UserInfoFromTokenModelCopyWith(UserInfoFromTokenModel value, $Res Function(UserInfoFromTokenModel) _then) = _$UserInfoFromTokenModelCopyWithImpl;
@useResult
$Res call({
 String? sub, String? name, String? email, bool? email_verified, List<IdentityUserRole?>? roles, List<String?>? permissions, String? tenantId, int? logins_count, int? iat, int? exp, String? aud, String? iss
});




}
/// @nodoc
class _$UserInfoFromTokenModelCopyWithImpl<$Res>
    implements $UserInfoFromTokenModelCopyWith<$Res> {
  _$UserInfoFromTokenModelCopyWithImpl(this._self, this._then);

  final UserInfoFromTokenModel _self;
  final $Res Function(UserInfoFromTokenModel) _then;

/// Create a copy of UserInfoFromTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sub = freezed,Object? name = freezed,Object? email = freezed,Object? email_verified = freezed,Object? roles = freezed,Object? permissions = freezed,Object? tenantId = freezed,Object? logins_count = freezed,Object? iat = freezed,Object? exp = freezed,Object? aud = freezed,Object? iss = freezed,}) {
  return _then(_self.copyWith(
sub: freezed == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,email_verified: freezed == email_verified ? _self.email_verified : email_verified // ignore: cast_nullable_to_non_nullable
as bool?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<IdentityUserRole?>?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String?>?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,logins_count: freezed == logins_count ? _self.logins_count : logins_count // ignore: cast_nullable_to_non_nullable
as int?,iat: freezed == iat ? _self.iat : iat // ignore: cast_nullable_to_non_nullable
as int?,exp: freezed == exp ? _self.exp : exp // ignore: cast_nullable_to_non_nullable
as int?,aud: freezed == aud ? _self.aud : aud // ignore: cast_nullable_to_non_nullable
as String?,iss: freezed == iss ? _self.iss : iss // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserInfoFromTokenModel implements UserInfoFromTokenModel {
  const _UserInfoFromTokenModel({this.sub, this.name, this.email, this.email_verified, final  List<IdentityUserRole?>? roles, final  List<String?>? permissions, this.tenantId, this.logins_count, this.iat, this.exp, this.aud, this.iss}): _roles = roles,_permissions = permissions;
  factory _UserInfoFromTokenModel.fromJson(Map<String, dynamic> json) => _$UserInfoFromTokenModelFromJson(json);

@override final  String? sub;
@override final  String? name;
@override final  String? email;
@override final  bool? email_verified;
 final  List<IdentityUserRole?>? _roles;
@override List<IdentityUserRole?>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String?>? _permissions;
@override List<String?>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? tenantId;
@override final  int? logins_count;
@override final  int? iat;
@override final  int? exp;
@override final  String? aud;
@override final  String? iss;

/// Create a copy of UserInfoFromTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoFromTokenModelCopyWith<_UserInfoFromTokenModel> get copyWith => __$UserInfoFromTokenModelCopyWithImpl<_UserInfoFromTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoFromTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoFromTokenModel&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.email_verified, email_verified) || other.email_verified == email_verified)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.logins_count, logins_count) || other.logins_count == logins_count)&&(identical(other.iat, iat) || other.iat == iat)&&(identical(other.exp, exp) || other.exp == exp)&&(identical(other.aud, aud) || other.aud == aud)&&(identical(other.iss, iss) || other.iss == iss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,name,email,email_verified,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_permissions),tenantId,logins_count,iat,exp,aud,iss);

@override
String toString() {
  return 'UserInfoFromTokenModel(sub: $sub, name: $name, email: $email, email_verified: $email_verified, roles: $roles, permissions: $permissions, tenantId: $tenantId, logins_count: $logins_count, iat: $iat, exp: $exp, aud: $aud, iss: $iss)';
}


}

/// @nodoc
abstract mixin class _$UserInfoFromTokenModelCopyWith<$Res> implements $UserInfoFromTokenModelCopyWith<$Res> {
  factory _$UserInfoFromTokenModelCopyWith(_UserInfoFromTokenModel value, $Res Function(_UserInfoFromTokenModel) _then) = __$UserInfoFromTokenModelCopyWithImpl;
@override @useResult
$Res call({
 String? sub, String? name, String? email, bool? email_verified, List<IdentityUserRole?>? roles, List<String?>? permissions, String? tenantId, int? logins_count, int? iat, int? exp, String? aud, String? iss
});




}
/// @nodoc
class __$UserInfoFromTokenModelCopyWithImpl<$Res>
    implements _$UserInfoFromTokenModelCopyWith<$Res> {
  __$UserInfoFromTokenModelCopyWithImpl(this._self, this._then);

  final _UserInfoFromTokenModel _self;
  final $Res Function(_UserInfoFromTokenModel) _then;

/// Create a copy of UserInfoFromTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sub = freezed,Object? name = freezed,Object? email = freezed,Object? email_verified = freezed,Object? roles = freezed,Object? permissions = freezed,Object? tenantId = freezed,Object? logins_count = freezed,Object? iat = freezed,Object? exp = freezed,Object? aud = freezed,Object? iss = freezed,}) {
  return _then(_UserInfoFromTokenModel(
sub: freezed == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,email_verified: freezed == email_verified ? _self.email_verified : email_verified // ignore: cast_nullable_to_non_nullable
as bool?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<IdentityUserRole?>?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String?>?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,logins_count: freezed == logins_count ? _self.logins_count : logins_count // ignore: cast_nullable_to_non_nullable
as int?,iat: freezed == iat ? _self.iat : iat // ignore: cast_nullable_to_non_nullable
as int?,exp: freezed == exp ? _self.exp : exp // ignore: cast_nullable_to_non_nullable
as int?,aud: freezed == aud ? _self.aud : aud // ignore: cast_nullable_to_non_nullable
as String?,iss: freezed == iss ? _self.iss : iss // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
