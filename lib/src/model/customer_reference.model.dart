import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_reference.model.freezed.dart';
part 'customer_reference.model.g.dart';

@freezed
abstract class CustomerReference with _$CustomerReference {
  const factory CustomerReference({
    String? referenceId,
    String? name,
    String? phoneNumber,
    String? email,
  }) = _CustomerReference;

  factory CustomerReference.fromJson(Map<String, Object?> json) =>
      _$CustomerReferenceFromJson(json);
}
