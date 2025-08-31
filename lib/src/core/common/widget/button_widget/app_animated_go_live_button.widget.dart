import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/constant/constant_variable.dart';

import '../../../utils/continus_stream_animation_calculation.utills.dart';

class AppAnimatedGoLiveButton extends StatelessWidget {
  const AppAnimatedGoLiveButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: continuousAnimationValues(),
      builder: (context, snapshot) {
        return _GoLiveButton(
          onPressed: onPressed,
          isSelected: true,
          data: snapshot.data ?? 0.0,
        );
      },
    );
  }
}

class _GoLiveButton extends StatelessWidget {
  const _GoLiveButton({
    required this.onPressed,
    required this.isSelected,
    required this.data,
  });

  final VoidCallback onPressed;

  final bool isSelected;
  final double data;

  /*  final double borderWidth;
  final Color borderColor;*/

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      child: Container(
        height: 84.h,
        width: 182.w,
        decoration: BoxDecoration(color: theme.colorScheme.primary),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Go live",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    curve: Curves.bounceOut,
                    height: data.r / 1.2,
                    width: data.r * 1.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppConstantVariable.kRadius.r,
                      ),
                      border: Border.all(
                        width: calculateBorderWidth(data).r,
                        color: calculateBorderColor(value: data, theme: theme),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateBorderWidth(double value) {
    // Adjust this formula as needed based on your preferences
    return value / 30.0;
  }

  Color calculateBorderColor({
    required double value,
    required ThemeData theme,
  }) {
    double opacity = (1.0 - (value / 50.0)).abs();
    return theme.colorScheme.onPrimary.withOpacity(opacity);
  }
}
