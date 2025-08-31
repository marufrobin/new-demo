import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/app_calculate_time_ago.dart';

import '../../../core/common/widget/app_overlay_loading.widget.dart';
import '../../../core/common/widget/button_widget/app_icon_button.widget.dart';
import '../bloc/notifications_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _onRefresh(context);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onRefresh(BuildContext context) {
    context.read<NotificationsBloc>().add(const NotificationsFetchEvent());
  }

  void _onScroll() {
    if (_isScrolledToEnd) {
      context.read<NotificationsBloc>().add(
        const NotificationsFetchMoreEvent(),
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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Notification',
      backgroundColor: theme.colorScheme.surface,
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(context),
        child: SingleChildScrollView(
          child: SafeArea(
            child: BlocBuilder<NotificationsBloc, NotificationsState>(
              builder: (context, state) {
                log(state.toString(), name: 'state');
                if (state is NotificationsLoading) {
                  return AppOverlayLoadingWidget(
                    height: height * 0.7,
                    width: width,
                    overlayColor: Colors.transparent,
                  );
                }

                /// Error
                if (state is NotificationsError) {
                  return _NoMoreDataWidget(
                    theme: theme,
                    width: width,
                    message: state.message ?? "Something went wrong",
                    onRefreshPressed: () => _onRefresh(context),
                  );
                }
                if (state is NotificationsLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _body(state, width, theme),

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

  ListView _body(NotificationsLoaded state, double width, ThemeData theme) {
    final notifications = state.notifications?.nodes;

    return ListView.builder(
      itemCount:
          (notifications?.isEmpty ?? false) ? 1 : notifications?.length ?? 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final notifications = state.notifications?.nodes;

        if (notifications?.isEmpty ?? false) {
          return _NoMoreDataWidget(
            theme: theme,
            width: width,
            message: "No notifications found",
            onRefreshPressed: () => _onRefresh(context),
          );
        } else {
          return _notificationTileWidget(
            onTap: () {
              /// TODO: Implement notifications read or unread
            },
            width: width,
            theme: theme,
            isRead: index % 2 == 0,
          );
        }
      },
    );
  }

  Widget _notificationTileWidget({
    required double width,
    required ThemeData theme,
    required bool isRead,
    required VoidCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        child: Container(
          // height: 100.h,
          width: width,
          padding: EdgeInsets.all(16.0.r),
          decoration: BoxDecoration(
            color:
                isRead
                    ? Colors.transparent
                    : theme.colorScheme.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0.r,
            children: [
              Text(
                "Welcome message from Dinebd",
                style: theme.textTheme.titleMedium,
              ),
              Text(
                "lorem ipsum dolor sit amet consectetur adipisicing elit,sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              Text(
                calculateTimeAgo(
                  inputTimeString:
                      (DateTime.now().subtract(
                        const Duration(hours: 2),
                      )).toString(),
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.error_outline, size: 24.r),
              title: Text(message, style: theme.textTheme.bodyMedium),
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
