import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingSkeletonWidget extends StatelessWidget {
  const AppLoadingSkeletonWidget({
    super.key,
    required this.height,
    required this.width,
    this.radius,
    this.margin = EdgeInsets.zero,
  });

  final double height;
  final double width;
  final double? radius;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.onSurface.withValues(alpha: 0.1.r),
      highlightColor: theme.colorScheme.surface.withValues(alpha: 0.1.r),
      enabled: true,
      child: Container(
        width: width.w,
        height: height.h,
        margin: margin,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(
            (radius ?? AppConstantVariable.kRadius).r,
          ),
        ),
      ),
    );
  }
}
