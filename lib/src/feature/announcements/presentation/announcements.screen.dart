import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_overlay_loading.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/app_calculate_time_ago.dart';
import 'package:rider/src/feature/announcements/bloc/announcements_bloc.dart';

import '../../../model/announcements.model.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _onRefresh(context);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_isScrolledToEnd) {
      context.read<AnnouncementsBloc>().add(
        const AnnouncementsFetchingMoreEvent(),
      );
    }
  }

  bool get _isScrolledToEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= maxScroll;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onRefresh(BuildContext context) {
    context.read<AnnouncementsBloc>().add(const AnnouncementsFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Announcements',
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(context),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
              builder: (context, state) {
                log(state.toString(), name: 'state');
                if (state is AnnouncementsLoading) {
                  return AppOverlayLoadingWidget(
                    height: height * 0.7,
                    width: width,
                    overlayColor: Colors.transparent,
                  );
                }

                /// Error
                if (state is AnnouncementsError) {
                  return _NoMoreDataWidget(
                    theme: theme,
                    width: width,
                    message: state.message,
                    onRefreshPressed: () => _onRefresh(context),
                  );
                }
                if (state is AnnouncementsData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _announcementsBody(state, theme, width),

                      /// No more data to show
                      if (state.isNoMoreData)
                        Center(
                          child: _NoMoreDataWidget(theme: theme, width: width),
                        ),

                      /// Loading more data
                      if (state.isMoreLoading)
                        AppOverlayLoadingWidget(
                          height: 100.r,
                          width: width,
                          overlayColor: Colors.transparent,
                        ),
                    ],
                  );
                } else {
                  return _NoMoreDataWidget(
                    theme: theme,
                    width: width,
                    onRefreshPressed: () => _onRefresh(context),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  ListView _announcementsBody(
    AnnouncementsData state,
    ThemeData theme,
    double width,
  ) {
    return ListView.builder(
      itemCount: state.data?.nodes?.length ?? 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final announcements = state.data?.nodes;

        if (announcements?.isEmpty ?? true) {
          return _NoMoreDataWidget(
            theme: theme,
            width: width,
            onRefreshPressed: () => _onRefresh(context),
          );
        } else {
          return _notificationTileWidget(
            width: width,
            theme: theme,
            announcement: announcements?.elementAt(index),
          );
        }
      },
    );
  }

  Container _notificationTileWidget({
    required double width,
    required ThemeData theme,
    required Announcement? announcement,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16.0.r),
      margin: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.0.r,
        children: [
          Text(announcement?.title ?? "", style: theme.textTheme.titleMedium),
          ExpandableText(
            announcement?.body ?? "Body",
            expandText: 'Read more',
            collapseText: 'Read less',
            linkColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            maxLines: 2,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
          Text(
            calculateTimeAgo(
              inputTimeString:
                  (announcement?.createdAt ?? DateTime.now()).toString(),
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoMoreDataWidget extends StatelessWidget {
  const _NoMoreDataWidget({
    super.key,
    required this.theme,
    required this.width,
    this.message = "No more data",
    this.onRefreshPressed,
  });

  final ThemeData theme;
  final double width;
  final String message;

  final VoidCallback? onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.r),
      width: width,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 10.0.r,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 24.r),
                Expanded(
                  child: Text(message, style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
            if (onRefreshPressed != null)
              AppIconButton(
                onPressed: onRefreshPressed,
                icon: const Icon(Icons.refresh),
              ),
          ],
        ),
      ),
    );
  }
}
