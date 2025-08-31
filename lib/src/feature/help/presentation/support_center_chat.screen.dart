import 'dart:developer';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_bottom_sheet.dart';
import 'package:rider/src/feature/help/presentation/widgets/update_message.screen.dart';
import 'package:rider/src/model/support_message.model.dart';
import 'package:rider/src/model/support_message_with_pagination.model.dart';
import 'package:rider/src/model/user_reference.model.dart';

import '../../../core/clients/socket_service.client.dart';
import '../../../core/common/widget/app_refresh_indicator.widget.dart';
import '../../../core/config/app.dependency.dart';
import '../../../core/utils/app_toaster.dart';
import '../../account/bloc/user_bloc/user_bloc.dart';
import '../bloc/support_message_bloc/support_message_bloc.dart';

class SupportCenterChatScreen extends StatefulWidget {
  const SupportCenterChatScreen({super.key, required this.threadId});

  final String threadId;

  @override
  State<SupportCenterChatScreen> createState() =>
      _SupportCenterChatScreenState();
}

class _SupportCenterChatScreenState extends State<SupportCenterChatScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    log("<<-----InIt state enter ----->>");
    onRefresh();
    log("<<-----InIt state end ----->>");
    super.initState();
  }

  onRefresh() async {
    context.read<UserBloc>().add(UserDataFetchingEvent());
    context.read<SupportMessageBloc>().add(
      SupportMessageMessagesFetchEvent(threadId: widget.threadId),
    );
    context.read<SupportMessageBloc>().add(JoinRoomEvent(widget.threadId));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 40.r,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    disposeSocket();
    super.dispose();
  }

  void disposeSocket() {
    if (!context.mounted) return;
    // ref.read(kSocketIOServiceProvider).dispose();
    // ref.read(kSocketIOServiceProvider).leaveRoom(widget.threadId);
    /// TODO: Dispose socket connection and leave room
    context.read<SupportMessageBloc>().add(LeaveRoomEvent(widget.threadId));
    getIt<SocketService>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "",
      hideAppBar: true,
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final senderUser = state is UserData ? state.userModel : null;
            UserReference senderUserReference = UserReference(
              name: senderUser?.name,
              email: senderUser?.email,
              phoneNumber: senderUser?.phone_number,
              referenceId: senderUser?.id,
            );
            return BlocConsumer<SupportMessageBloc, SupportMessageState>(
              listener: (context, state) {
                if (state is SupportMessageError) {
                  AppToaster.error(
                    message: state.error ?? "Something went wrong",
                    context: context,
                  );
                }
                if (state is UpdateSupportMessageSuccess) {
                  state.isSuccess ?? false
                      ? AppToaster.success(
                        message: "Message update successfully",
                        context: context,
                      )
                      : AppToaster.error(
                        message: "Something went wrong",
                        context: context,
                      );
                }
              },
              builder: (context, state) {
                UserReference? currentUser;
                SupportMessageWithPaginationModel? supportMessageData;

                if (state is! SupportMessageInitial ||
                    state is! SupportMessageLoading) {
                  currentUser =
                      state
                          .supportMessageWithPagination
                          ?.nodes
                          ?.firstOrNull
                          ?.user;
                  supportMessageData = state.supportMessageWithPagination;
                }

                return AppScaffold(
                  title: "",
                  backgroundColor: theme.colorScheme.surface,
                  isLoading:
                      state is SupportMessageLoading || state is UserLoading,
                  appBar: _appbar(width: width, context: context, theme: theme),
                  bottomSheet: _SupportMessageBar(
                    key: const Key("SupportMessageBottomSheet"),
                    isSendingLoading: state is SupportMessageSendLoading,
                    onSend: (message) {
                      log(message, name: "Message-->> ");

                      log(name: "Sender User", "$senderUserReference");
                      log(name: "Current User", "$currentUser");
                      context.read<SupportMessageBloc>().add(
                        SupportMessageSendEvent(
                          message: message,
                          senderUser: senderUserReference,
                          threadId: widget.threadId,
                        ),
                      );
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent + 40.r,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  // floatingActionButton: upAndDownButton(),
                  body: AppRefreshIndicatorWidget(
                    isScrollNotificationNeeded: false,
                    onRefresh: () async => onRefresh(),
                    child: Container(
                      height: height,
                      width: width,
                      margin: EdgeInsets.only(bottom: 90.r),
                      child: _SupportMessageChatBody(
                        key: const Key("SupportMessageChatBody"),
                        senderUser: senderUserReference,
                        supportMessageWithPagination: supportMessageData,
                        scrollController: scrollController,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // supportMessageWithPagination: supportMessageSocketStream
  // .whenOrNull(
  //   data: (data) {
  //     log(name: "Data of socket message", "$data");
  //     if (data != null) {
  //       bool isMessageAlreadyExist = false;
  //       for (var element
  //           in _supportMessageWithPagination?.nodes ?? []) {
  //         if (element?.id == data.id) {
  //           isMessageAlreadyExist = true;
  //         }
  //       }
  //       if (!isMessageAlreadyExist) {
  //         setState(() {
  //           _supportMessageWithPagination =
  //               _supportMessageWithPagination?.copyWith(
  //                 nodes: [
  //                   data,
  //                   ..._supportMessageWithPagination?.nodes ??
  //                       [],
  //                 ],
  //               );
  //         });
  //       }
  //     } else {
  //       _supportMessageWithPagination;
  //     }
  //     return _supportMessageWithPagination;
  //   },
  //   error: (error, stackTrace) {
  //     log(error: error, stackTrace: stackTrace, "Error");
  //     AppToaster.error(
  //       message: "Error on socket stream",
  //       context: context,
  //     );
  //     return _supportMessageWithPagination;
  //   },
  //   loading: () => _supportMessageWithPagination,
  // ),

  AppBar _appbar({
    required double width,
    required BuildContext context,
    // required UserReference? recipientUser,
    required ThemeData theme,
  }) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      title: SizedBox(
        width: width * 0.7,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Container(
                height: 56.r,
                width: 56.r,
                padding: EdgeInsets.all(8.r),
                child: Image.asset(ImagePath.logo),
              ),
            ),
            10.horizontalSpace,
            const Text("Dinebd"),
          ],
        ),
      ),
      leading: BackButton(
        onPressed: () {
          disposeSocket();
          context.pop();
        },
      ),
      actions: [
        IconButton(
          onPressed: onRefresh,
          icon: Icon(Icons.refresh_rounded, color: theme.colorScheme.primary),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(width, 70.r),
        child: Container(
          color: theme.colorScheme.primary,
          // height: 50.r,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Text(
            "Please maintain respect and politeness when communicating and refrain from sharing any personal or account information here. Thank you.",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  /* Widget popUpMenuContainer() {
    return PopupMenuButton(
      position: PopupMenuPosition.over,
      color: ColorPallet.kWhiteColor,
      surfaceTintColor: ColorPallet.kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: kAppContainerBoxDecoration()
            .copyWith(color: ColorPallet.kPrimaryColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add_rounded,
              color: ColorPallet.kWhiteColor,
            ),
            6.w.pw,
            Text(
              "Add new",
              style: textStyleNunitoSans(labelColor: ColorPallet.kWhiteColor),
            ),
          ],
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(child: Icon(Icons.edit)),
        PopupMenuItem(child: Icon(Icons.delete)),
      ],
    );
  }*/
}

class _SupportMessageChatBody extends StatelessWidget {
  const _SupportMessageChatBody({
    super.key,
    this.senderUser,
    this.supportMessageWithPagination,
    required this.scrollController,
  });

  final UserReference? senderUser;
  final SupportMessageWithPaginationModel? supportMessageWithPagination;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      reverse: false,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: scrollController,
      itemBuilder: (context, index) {
        SupportMessageModel? supportMessage = supportMessageWithPagination
            ?.nodes
            ?.elementAt(index);

        /// shouldShowTail
        bool shouldShowTail = false;
        if (index == (supportMessageWithPagination?.nodes?.length ?? 1) - 1) {
          shouldShowTail = true;
        } else {
          SupportMessageModel? nextSupportMessage = supportMessageWithPagination
              ?.nodes
              ?.elementAt(index + 1);
          shouldShowTail =
              supportMessage?.user?.referenceId !=
              nextSupportMessage?.user?.referenceId;
        }
        //---------------------------------------------------------------------------
        /// isSender
        bool isSender =
            supportMessage?.user?.referenceId == senderUser?.referenceId;
        log(name: "Is Sender", "$isSender");
        log(name: "Sender User", "${senderUser?.referenceId}");
        log(name: "Current User", "${supportMessage?.user?.referenceId}");
        //---------------------------------------------------------------------------

        /// isAbsorbing
        bool isAbsorbing =
            supportMessage?.user?.referenceId != senderUser?.referenceId ||
                    (supportMessage?.softDeteled ?? false)
                ? true
                : false;

        /// isEdited
        bool isEdited = supportMessage?.createdAt != supportMessage?.updatedAt;

        return AbsorbPointer(
          absorbing: isAbsorbing,
          child: ReactionButton(
            boxElevation: 6,
            direction: ReactionsBoxAlignment.rtl,
            onReactionChanged: (value) async {
              log(name: "Reaction -->>", "${value?.value}");
              log(name: "Reaction -->>", """ ${supportMessage?.id}""");
              if (value?.value == "Edit") {
                await AppBottomSheet.fullScreenBottomSheet(
                  height: height * 0.6,
                  context: context,
                  body: UpdateMessageScreen(
                    messageId: supportMessage?.id ?? "",
                    threadId: supportMessage?.threadId ?? "",
                    message: supportMessage?.body ?? "",
                  ),
                );

                // getSupportMessageWithPaginationData();
              } else if (value?.value == "Delete") {
                if (supportMessage?.threadId != null &&
                    supportMessage?.id != null) {
                  context.read<SupportMessageBloc>().add(
                    UpdateSupportMessageEvent(
                      messageId: supportMessage!.id!,
                      threadId: supportMessage.threadId!,
                      softDeteled: true,
                    ),
                  );
                }
              }
            },
            reactions: [
              Reaction(
                value: "Edit",
                icon: Icon(
                  Icons.edit,
                  size: 24.r,
                  color: theme.colorScheme.primary,
                ),
              ),
              Reaction(
                value: "Delete",
                icon: Icon(
                  Icons.delete,
                  size: 24.r,
                  color: theme.colorScheme.error,
                ),
              ),
            ],
            itemSize: Size(50.w, 30.h),
            child: chatMessageWidget(
              theme: theme,
              isMessageDeleted: supportMessage?.softDeteled ?? false,
              message: supportMessage?.body ?? "No message!",
              tail: shouldShowTail,
              isSender: isSender,
              isMessageUpdated: isEdited,
            ),
          ),
        );

        // return Card(child: Text("     Index-->> $index"));
      },
      itemCount: supportMessageWithPagination?.nodes?.length ?? 1,
    );
  }

  Column chatMessageWidget({
    required ThemeData theme,
    required bool tail,
    required bool isSender,
    required bool isMessageDeleted,
    required bool isMessageUpdated,
    required String message,
  }) {
    Color color = isSender ? Colors.blue.withValues(alpha: 0.14) : Colors.blue;
    Color textColor = isSender ? theme.colorScheme.onSurface : Colors.white;
    return Column(
      children: [
        BubbleSpecialThree(
          text: isMessageDeleted ? "Message has been deleted." : message,
          color: color,
          tail: tail,
          isSender: isSender,
          textStyle:
              theme.textTheme.bodyMedium?.copyWith(
                color:
                    isMessageDeleted
                        ? theme.colorScheme.error.withValues(alpha: 0.4)
                        : textColor,
                fontSize: (isMessageDeleted ? 14 : 16).sp,
                fontStyle:
                    isMessageDeleted ? FontStyle.italic : FontStyle.normal,
              ) ??
              TextStyle(color: textColor),
        ),
        !isMessageUpdated || isMessageDeleted
            ? const SizedBox()
            : Align(
              alignment:
                  isSender ? Alignment.bottomRight : Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Edited",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
      ],
    );
  }
}

class _SupportMessageBar extends StatelessWidget {
  const _SupportMessageBar({
    super.key,
    this.isSendingLoading = false,
    this.onSend,
  });

  final bool isSendingLoading;

  final Function(String message)? onSend;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 80.h,
      padding: EdgeInsets.only(bottom: 16.h),
      child: MessageBar(
        actions: [
          isSendingLoading ? _loadingWidget(theme) : const SizedBox.shrink(),
        ],
        sendButtonColor: theme.colorScheme.primary,
        messageBarHintStyle: TextStyle(
          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
          fontSize: theme.textTheme.bodyMedium?.fontSize,
        ),
        onSend: onSend,
      ),
    );
  }

  Container _loadingWidget(ThemeData theme) {
    return Container(
      width: 20.r,
      height: 20.r,
      margin: EdgeInsets.symmetric(horizontal: 8.r),
      child: CircularProgressIndicator(
        strokeWidth: 2.6,
        color: theme.colorScheme.primary,
        // Change this to your desired color
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
