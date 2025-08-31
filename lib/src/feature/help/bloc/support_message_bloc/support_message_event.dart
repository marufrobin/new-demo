part of 'support_message_bloc.dart';

sealed class SupportMessageEvent extends Equatable {
  const SupportMessageEvent();

  @override
  List<Object?> get props => [];
}

final class SupportMessageMessagesFetchEvent extends SupportMessageEvent {
  final String threadId;
  final int? limit;
  final int? page;
  final SortType? sort;
  final String? sortBy;

  const SupportMessageMessagesFetchEvent({
    required this.threadId,
    this.limit,
    this.page,
    this.sort,
    this.sortBy,
  });

  @override
  List<Object?> get props => [threadId, limit, page, sort, sortBy];
}

final class SupportMessageSendEvent extends SupportMessageEvent {
  final String message;
  final String threadId;
  final UserReference? senderUser;

  const SupportMessageSendEvent({
    required this.message,
    required this.threadId,
    this.senderUser,
  });

  @override
  List<Object?> get props => [message, threadId, senderUser];
}

final class UpdateSupportMessageEvent extends SupportMessageEvent {
  final String messageId;
  final String threadId;
  final String? body;
  final bool? softDeteled;

  const UpdateSupportMessageEvent({
    required this.messageId,
    required this.threadId,
    this.body,
    this.softDeteled,
  });

  @override
  List<Object?> get props => [messageId, threadId, body, softDeteled];
}

class JoinRoomEvent extends SupportMessageEvent {
  final String threadId;

  const JoinRoomEvent(this.threadId);

  @override
  List<Object?> get props => [threadId];
}

class LeaveRoomEvent extends SupportMessageEvent {
  final String threadId;

  const LeaveRoomEvent(this.threadId);

  @override
  List<Object?> get props => [threadId];
}
