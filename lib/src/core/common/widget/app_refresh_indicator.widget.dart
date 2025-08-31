import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRefreshIndicatorWidget extends StatelessWidget {
  const AppRefreshIndicatorWidget({
    super.key,
    required this.child,
    required this.onRefresh,
    this.scrollNotification,
    this.isScrollNotificationNeeded = true,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final bool Function(ScrollNotification)? scrollNotification;
  final bool isScrollNotificationNeeded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      notificationPredicate: isScrollNotificationNeeded
          ? (notification) {
              if (notification is OverscrollNotification || Platform.isIOS) {
                return notification.depth == 2;
              }
              return notification.depth == 0;
            }
          : (notification) {
              return true;
            },
      displacement: 40.r,
      backgroundColor: theme.colorScheme.surface,
      color: theme.colorScheme.primary,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => await Future.delayed(
        const Duration(milliseconds: 1500),
        onRefresh,
      ),
      child: child,
    );
  }
}
