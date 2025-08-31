import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant_variable.dart';

class AppElevationContainerWidget extends StatelessWidget {
  const AppElevationContainerWidget({
    super.key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.elevation = 1,
    this.borderRadiusGeometry,
    this.boxShadow,
  });

  final Widget child;
  final double? borderRadius;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Color? color;

  final double elevation;
  final BorderRadiusGeometry? borderRadiusGeometry;

  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.surface,
        borderRadius:
            borderRadiusGeometry ??
            BorderRadius.circular(
              (borderRadius ?? AppConstantVariable.kRadius).r,
            ),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                offset: Offset(3 * elevation, 4 * elevation),
                blurRadius: 4 * elevation,
              ),
            ],
      ),
      child: child,
    );
  }
}
