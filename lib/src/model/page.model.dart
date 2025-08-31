import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/resource_commit_history_reference.model.dart';

part 'page.model.freezed.dart';
part 'page.model.g.dart';

@freezed
abstract class PageModel with _$PageModel {
  const factory PageModel({
    @JsonKey(name: '_id') String? id,
    String? body,
    ResourceCommitHistoryReference? commits,
    DateTime? createdAt,
    String? handel,
    String? title,
    DateTime? updatedAt,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, Object?> json) =>
      _$PageModelFromJson(json);
}
