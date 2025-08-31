import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/server_file_reference.model.dart';

part 'user_legal_document.model.freezed.dart';
part 'user_legal_document.model.g.dart';

@freezed
abstract class UserLegalDocumentModel with _$UserLegalDocumentModel {
  const factory UserLegalDocumentModel({
    ServerFileReferenceModel? license,
    ServerFileReferenceModel? nidPhoto,
    ServerFileReferenceModel? vehiclePhoto,
  }) = _UserLegalDocumentModel;

  factory UserLegalDocumentModel.fromJson(Map<String, Object?> json) =>
      _$UserLegalDocumentModelFromJson(json);
}
