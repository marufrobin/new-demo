import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/user.model.dart';
import 'package:rider/src/model/user_reference.model.dart';

part 'support_message.model.freezed.dart';
part 'support_message.model.g.dart';

@freezed
abstract class SupportMessageModel with _$SupportMessageModel {
  const factory SupportMessageModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') String? id,
    String? body,
    DateTime? createdAt,
    bool? softDeteled,
    String? threadId,
    DateTime? updatedAt,
    UserReference? user,
  }) = _SupportMessageModel;

  factory SupportMessageModel.fromJson(Map<String, Object?> json) =>
      _$SupportMessageModelFromJson(json);
}
