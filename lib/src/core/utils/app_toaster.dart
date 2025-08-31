import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider/src/core/config/app.dependency.dart';

// class AppToaster {
//   static void success({
//     required String message,
//     required BuildContext context,
//   }) {
//     FToast fToast = FToast();
//     fToast.init(context);
//     final theme = Theme.of(context);
//     fToast.showToast(
//       gravity: ToastGravity.TOP,
//       child: toastWidget(
//         message: message,
//         bgColor: Colors.green,
//         textColor: theme.colorScheme.onTertiary,
//         icon: Icons.check,
//         iconColor: theme.colorScheme.onTertiary,
//       ),
//     );
//   }
//
//   static void error({required String message, required BuildContext context}) {
//     FToast fToast = FToast();
//     fToast.init(context);
//     final theme = Theme.of(context);
//     fToast.showToast(
//       gravity: ToastGravity.TOP,
//       child: toastWidget(
//         message: message,
//         bgColor: theme.colorScheme.error,
//         textColor: theme.colorScheme.onError,
//         icon: Icons.close,
//         iconColor: theme.colorScheme.onError,
//       ),
//     );
//   }
//
//   static void willImplementSoon({required BuildContext context}) {
//     FToast fToast = FToast();
//     fToast.init(context);
//     final theme = Theme.of(context);
//     fToast.showToast(
//       gravity: ToastGravity.CENTER,
//       child: toastWidget(
//         message: "Will Implement Soon!",
//         bgColor: theme.colorScheme.tertiary,
//         textColor: theme.colorScheme.onTertiary,
//         iconColor: theme.colorScheme.onTertiary,
//         icon: Icons.construction,
//       ),
//     );
//   }
//
//   static Widget toastWidget({
//     String? message,
//     Color? bgColor,
//     Color? iconColor,
//     Color? textColor,
//     IconData? icon,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
//         color: bgColor,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon ?? Icons.check, color: iconColor),
//           12.horizontalSpace,
//           Text(
//             message ?? "Success",
//             style: TextStyle(color: textColor, fontSize: 16.r),
//           ),
//         ],
//       ),
//     );
//   }
// }

enum ToastType { success, error, info, warning, construction, progress }

class AppToaster {
  // Private constructor to prevent instantiation
  AppToaster._();

  // Cached FToast instance
  static FToast? _fToast;

  // Initialize once and reuse
  static void _ensureInitialized(BuildContext context) {
    _fToast ??= getIt<FToast>();
  }

  // Progress toast instance and controller
  static Timer? _progressTimer;
  static double _progressValue = 0.0;
  static StreamController<double>? _progressController;
  static String? _progressId;

  // Show a progress toast
  static String showProgress({
    required String message,
    required BuildContext context,
    double initialProgress = 0.0,
    Duration duration = const Duration(seconds: 10),
    ToastGravity gravity = ToastGravity.TOP,
    VoidCallback? onComplete,
  }) {
    _ensureInitialized(context);
    dismissProgress(); // Dismiss any existing progress toast

    final theme = Theme.of(context);
    final ToastConfig config = _getToastConfig(ToastType.progress, theme);

    // Initialize progress state
    _progressValue = initialProgress;
    _progressController = StreamController<double>.broadcast();
    _progressId = DateTime.now().millisecondsSinceEpoch.toString();

    // Create the progress toast widget
    Widget progressToast = StreamBuilder<double>(
      stream: _progressController?.stream,
      initialData: _progressValue,
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0.r, vertical: 12.0.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.r),
            color: config.backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24.r,
                height: 24.r,
                child: CircularProgressIndicator(
                  value:
                      progress >= 1.0
                          ? null
                          : progress, // Indeterminate when complete
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(config.iconColor),
                  backgroundColor: config.iconColor.withOpacity(0.3),
                ),
              ),
              12.horizontalSpace,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        color: config.textColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    4.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: config.iconColor.withValues(
                              alpha: 0.2,
                            ),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              config.iconColor,
                            ),
                            minHeight: 5.r,
                            borderRadius: BorderRadius.circular(2.5.r),
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          "${(progress * 100).toInt()}%",
                          style: TextStyle(
                            color: config.textColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    // Show the toast
    _fToast?.showToast(
      gravity: gravity,
      toastDuration: duration,
      child: progressToast,
    );

    return _progressId!;
  }

  // Update the progress value (0.0 to 1.0)
  static void updateProgress(double progress, {bool complete = false}) {
    if (_progressController != null && !_progressController!.isClosed) {
      _progressValue = progress.clamp(0.0, 1.0);
      _progressController!.add(_progressValue);

      if (complete || _progressValue >= 1.0) {
        // Auto-dismiss after completion with a small delay
        _progressTimer = Timer(const Duration(milliseconds: 800), () {
          dismissProgress();
        });
      }
    }
  }

  // Complete progress and show success
  static void completeProgress({
    required BuildContext context,
    String? message,
    Duration showSuccessDuration = const Duration(seconds: 2),
  }) {
    // First, update to 100%
    updateProgress(1.0);

    // Show success after a short delay to allow animation
    Future.delayed(const Duration(milliseconds: 800), () {
      dismissProgress();

      if (message != null) {
        success(
          message: message,
          context: context,
          duration: showSuccessDuration,
        );
      }
    });
  }

  // Dismiss any active progress toast
  static void dismissProgress() {
    _progressTimer?.cancel();
    _progressTimer = null;

    if (_progressController != null && !_progressController!.isClosed) {
      _progressController!.close();
      _progressController = null;
    }

    _progressId = null;
    _progressValue = 0.0;
  }

  // Main toast display method
  static void show({
    required String message,
    required BuildContext context,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    ToastGravity gravity = ToastGravity.TOP,
    VoidCallback? onDismiss,
  }) {
    _ensureInitialized(context);

    final theme = Theme.of(context);
    final ToastConfig config = _getToastConfig(type, theme);

    _fToast?.showToast(
      gravity: gravity,
      toastDuration: duration,
      // positionedToastBuilder: (context, child) {
      //   return Positioned(
      //     top: gravity == ToastGravity.TOP ? 50.0 : null,
      //     bottom: gravity == ToastGravity.BOTTOM ? 50.0 : null,
      //     left: 0,
      //     right: 0,
      //     child: child,
      //   );
      // },
      child: _buildToastWidget(message: message, config: config),
    );

    if (onDismiss != null) {
      Future.delayed(duration, onDismiss);
    }
  }

  // Convenience methods
  static void success({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.success,
      duration: duration,
    );
  }

  static void error({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.error,
      duration: duration,
    );
  }

  static void warning({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.warning,
      duration: duration,
    );
  }

  static void info({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.info,
      duration: duration,
    );
  }

  static void willImplementSoon({
    required BuildContext context,
    String message = "Will Implement Soon!",
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.construction,
      gravity: ToastGravity.CENTER,
      duration: duration,
    );
  }

  // Toast configuration based on type
  static ToastConfig _getToastConfig(ToastType type, ThemeData theme) {
    switch (type) {
      case ToastType.progress:
        return ToastConfig(
          backgroundColor: theme.colorScheme.surface,
          textColor: theme.colorScheme.onSurface,
          icon: Icons.hourglass_bottom,
          iconColor: theme.colorScheme.primary,
        );
      case ToastType.success:
        return ToastConfig(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: Icons.check_circle,
          iconColor: Colors.white,
        );
      case ToastType.error:
        return ToastConfig(
          backgroundColor: theme.colorScheme.error,
          textColor: theme.colorScheme.onError,
          icon: Icons.error,
          iconColor: theme.colorScheme.onError,
        );
      case ToastType.warning:
        return ToastConfig(
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          icon: Icons.warning,
          iconColor: Colors.white,
        );
      case ToastType.info:
        return ToastConfig(
          backgroundColor: theme.colorScheme.primary,
          textColor: theme.colorScheme.onPrimary,
          icon: Icons.info,
          iconColor: theme.colorScheme.onPrimary,
        );
      case ToastType.construction:
        return ToastConfig(
          backgroundColor: theme.colorScheme.tertiary,
          textColor: theme.colorScheme.onTertiary,
          icon: Icons.construction,
          iconColor: theme.colorScheme.onTertiary,
        );
    }
  }

  // Build the toast widget
  static Widget _buildToastWidget({
    required String message,
    required ToastConfig config,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.r, vertical: 12.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        color: config.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(config.icon, color: config.iconColor),
          12.horizontalSpace,
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: config.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }

  // Clear all toasts
  static void dismissAll() {
    dismissProgress();
    _fToast?.removeQueuedCustomToasts();
  }
}

// Configuration class for toast appearance
class ToastConfig {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Color iconColor;

  ToastConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.iconColor,
  });
}
