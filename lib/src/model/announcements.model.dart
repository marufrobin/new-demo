import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_meta.model.dart';

part 'announcements.model.freezed.dart';
part 'announcements.model.g.dart';

@freezed
abstract class AnnouncementsModel with _$AnnouncementsModel {
  const factory AnnouncementsModel({
    PaginationMeta? meta,
    List<Announcement?>? nodes,
  }) = _AnnouncementsModel;

  factory AnnouncementsModel.fromJson(Map<String, Object?> json) =>
      _$AnnouncementsModelFromJson(json);
}

@freezed
abstract class Announcement with _$Announcement {
  const factory Announcement({
    @JsonKey(name: '_id') String? id,
    String? body,
    DateTime? createdAt,
    String? title,
    DateTime? updatedAt,
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, Object?> json) =>
      _$AnnouncementFromJson(json);
}
