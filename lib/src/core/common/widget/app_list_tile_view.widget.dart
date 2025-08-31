import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_elevation_container.widget.dart';

class AppListTileViewWidget extends StatelessWidget {
  const AppListTileViewWidget({
    super.key,
    required this.title,
    this.trailing,
    this.leading,
    this.onPressed,
    this.padding,
    this.margin,
  });

  final String title;
  final Widget? trailing;
  final Widget? leading;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppElevationContainerWidget(
      elevation: 0,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      margin: margin,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        title: Text(
          title,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: theme.textTheme.bodyMedium?.fontSize,
            fontWeight: theme.textTheme.bodyMedium?.fontWeight,
          ),
        ),
        leading: leading,
        trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 20.r),
        onTap: onPressed,
      ),
    );
  }
}
