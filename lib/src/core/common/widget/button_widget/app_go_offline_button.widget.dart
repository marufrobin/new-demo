import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/constant/constant_variable.dart';

class AppGoOfflineButton extends StatelessWidget {
  const AppGoOfflineButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      child: Container(
        height: 84.h,
        width: 182.w,
        decoration: BoxDecoration(color: theme.colorScheme.error),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                "Go offline",
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onError,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
