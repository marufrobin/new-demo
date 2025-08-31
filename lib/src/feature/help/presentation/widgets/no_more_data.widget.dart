import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widget/button_widget/app_icon_button.widget.dart';

class SupportCenterNoMoreDataWidget extends StatelessWidget {
  const SupportCenterNoMoreDataWidget({
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
          spacing: 10.0.r,
          children: [
            Icon(
              Icons.error_outline,
              size: 40.r,
              color: theme.colorScheme.primary,
            ),
            ExpandableText(
              message,
              style: theme.textTheme.bodyLarge,
              expandText: 'more',
            ),
            16.verticalSpace,
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
