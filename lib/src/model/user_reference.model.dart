import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_reference.model.freezed.dart';
part 'user_reference.model.g.dart';

@freezed
abstract class UserReference with _$UserReference {
  const factory UserReference({
    String? email,
    String? name,
    String? phoneNumber,
    String? referenceId,
  }) = _UserReference;

  factory UserReference.fromJson(Map<String, Object?> json) =>
      _$UserReferenceFromJson(json);
}
