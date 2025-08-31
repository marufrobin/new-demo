import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/widget/button_widget/app_icon_button.widget.dart';

class NoMoreDataWidget extends StatelessWidget {
  const NoMoreDataWidget({
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
