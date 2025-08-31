import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/feature/help/presentation/widgets/no_more_data.widget.dart';

import '../../../../core/common/widget/app_overlay_loading.widget.dart';
import '../../../../core/common/widget/app_refresh_indicator.widget.dart';
import '../../../../core/config/app.routes.dart';
import '../../../../core/utils/app_toaster.dart';
import '../../../../model/support_thread_with_pagination.model.dart';
import '../../bloc/support_center_bloc/support_center_bloc.dart';
import 'chat_list_tile.widget.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _refresh();
    super.initState();
  }

  void _onScroll() {
    if (_isScrolledToEnd) {
      context.read<SupportCenterBloc>().add(
        const SupportCenterThreadsFetchMoreEvent(),
      );
    }
  }

  bool get _isScrolledToEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= maxScroll;
  }

  _refresh() {
    context.read<SupportCenterBloc>().add(
      const SupportCenterThreadsFetchEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<SupportCenterBloc, SupportCenterState>(
      listener: (context, state) {
        log(name: "SupportCenterBloc", state.toString());
        if (state is SupportCenterThreadsError) {
          AppToaster.error(
            context: context,
            message: state.error ?? "Something went wrong",
          );
        }
      },
      builder: (context, state) {
        if (state is SupportCenterThreadsData) {
          final data = state.chatHistory;
          return Column(
            children: [
              _body(theme: theme, width: width, data: data),

              /// No more data to show
              if (state.hasReachedEnd ?? false)
                Center(
                  child: SupportCenterNoMoreDataWidget(
                    theme: theme,
                    width: width,
                  ),
                ),

              /// Loading more data
              if (state.isMoreLoading ?? false)
                AppOverlayLoadingWidget(
                  height: 100.r,
                  width: width,
                  overlayColor: Colors.transparent,
                ),
            ],
          );
        } else if (state is SupportCenterLoading) {
          return AppOverlayLoadingWidget(height: height, width: width);
        } else if (state is SupportCenterThreadsError) {
          return SupportCenterNoMoreDataWidget(
            theme: theme,
            width: width,
            message: state.error ?? "Something went wrong",
            onRefreshPressed: () => _refresh(),
          );
        } else {
          return SupportCenterNoMoreDataWidget(
            theme: theme,
            width: width,
            onRefreshPressed: () => _refresh(),
          );
        }
      },
    );
  }

  AppRefreshIndicatorWidget _body({
    required ThemeData theme,
    required double width,
    required SupportThreadWithPaginationModel? data,
  }) {
    return AppRefreshIndicatorWidget(
      isScrollNotificationNeeded: false,
      onRefresh: () async => _refresh(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:
            (data?.nodes?.isEmpty ?? true) ? 1 : data?.nodes?.length ?? 1,
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
          top: 16.r,
          bottom: 120.r,
        ),
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (data?.nodes?.isEmpty ?? true) {
            return SupportCenterNoMoreDataWidget(
              theme: theme,
              width: width,
              onRefreshPressed: () => _refresh(),
            );
          }
          return ChatListTileWidget(
            theme: theme,
            onPressed: () {
              final threadId = data?.nodes?.elementAt(index)?.id;

              if (threadId != null) {
                context.pushNamed(
                  AppRoutesNames.supportCenterChatScreen,
                  pathParameters: {"threadId": threadId},
                );
              }
            },
            title: data?.nodes?.elementAt(index)?.title,
            subtitle: data?.nodes?.elementAt(index)?.body,
            date:
                data?.nodes?.elementAt(index)?.updatedAt ??
                data?.nodes?.elementAt(index)?.createdAt,
          );
        },
      ),
    );
  }
}
