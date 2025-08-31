import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_reference.model.freezed.dart';
part 'vendor_reference.model.g.dart';

@freezed
abstract class VendorReference with _$VendorReference {
  const factory VendorReference({
    String? name,
    String? referenceId,
    String? VendorUID,
  }) = _VendorReference;

  factory VendorReference.fromJson(Map<String, Object?> json) =>
      _$VendorReferenceFromJson(json);
}
