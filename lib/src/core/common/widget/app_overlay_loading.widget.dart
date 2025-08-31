import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOverlayLoadingWidget extends StatelessWidget {
  const AppOverlayLoadingWidget({
    super.key,
    required this.height,
    required this.width,
    this.overlayColor,
  });

  final double height;
  final double width;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: width,
      color:
          overlayColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.34),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: CircularProgressIndicator(
            backgroundColor: theme.colorScheme.surface,
            color: theme.colorScheme.primary,
            strokeWidth: 2.6,
            strokeCap: StrokeCap.round,
          ),
        ),
      ),
    );
  }
}
