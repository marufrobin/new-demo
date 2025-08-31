import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.onPressed,
      this.topLabel,
      this.bottomLabel,
      this.labelColor,
      this.fontSize,
      this.icon,
      this.iconData,
      this.iconColor,
      this.iconSize,
      this.backgroundColor,
      this.foregroundColor,
      this.border,
      this.shape,
      this.elevation,
      this.padding,
      this.fixedSize,
      this.visualDensity,
      this.tooltip});

  final VoidCallback? onPressed;

  /// The label to be displayed on the button
  final String? topLabel;
  final String? bottomLabel;
  final Color? labelColor;
  final double? fontSize;

  /// the icons to be displayed on the button
  final Widget? icon;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;

  /// Button style
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? border;
  final OutlinedBorder? shape;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Size? fixedSize;
  final VisualDensity? visualDensity;

  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: onPressed,
      visualDensity: visualDensity,
      tooltip: tooltip ?? topLabel ?? bottomLabel ?? "Icon button",
      style: _buttonStyle(
        theme: theme,
        toplabel: topLabel,
        bottomlabel: bottomLabel,
      ),
      icon: _widget(
        topLabel: topLabel,
        bottomLabel: bottomLabel,
        labelColor: labelColor,
        fontSize: fontSize,
        icon: icon,
        iconData: iconData,
        iconColor: iconColor,
        iconSize: iconSize,
      ),
    );
  }

  Widget _widget({
    required String? topLabel,
    required String? bottomLabel,
    required Color? labelColor,
    required double? fontSize,
    required Widget? icon,
    required IconData? iconData,
    required Color? iconColor,
    required double? iconSize,
  }) {
    if (topLabel != null) {
      return _LabelIcon(
        topLabel: topLabel,
        labelColor: labelColor,
        fontSize: fontSize,
        icon: icon,
        iconData: iconData,
        iconColor: iconColor,
        iconSize: iconSize,
      );
    } else if (bottomLabel != null) {
      return _LabelIcon(
        bottomLabel: bottomLabel,
        labelColor: labelColor,
        fontSize: fontSize,
        icon: icon,
        iconData: iconData,
        iconColor: iconColor,
        iconSize: iconSize,
      );
    } else {
      return icon ??
          Icon(
            iconData ?? Icons.close,
            color: iconColor,
            size: iconSize,
          );
    }
  }

  ButtonStyle? _buttonStyle({
    required ThemeData theme,
    String? toplabel,
    String? bottomlabel,
  }) {
    /// If label is null, then it is a default button
    if (toplabel != null) {
      /// If label is not null, then it is a top labeled button
      return IconButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
        shape: shape ?? const CircleBorder(),
        padding: padding ?? EdgeInsets.all(10.r),
        minimumSize: Size.zero,
        elevation: elevation,
        fixedSize: fixedSize,
      );
    } else if (bottomlabel != null) {
      /// If label is not null, then it is a bottom labeled button
      return IconButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
        shape: shape ?? const CircleBorder(),
        padding: padding ?? EdgeInsets.all(10.r),
        minimumSize: Size.zero,
        elevation: elevation,
        fixedSize: fixedSize,
      );
    } else {
      return IconButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
        shape: const CircleBorder(),
        padding: padding ?? EdgeInsets.zero,
        minimumSize: Size.zero,
        elevation: elevation,
        fixedSize: fixedSize ?? Size(42.r, 42.r),
      );
    }
  }
}

class _LabelIcon extends StatelessWidget {
  const _LabelIcon({
    this.topLabel,
    this.bottomLabel,
    this.labelColor,
    this.fontSize,
    this.icon,
    this.iconData,
    this.iconColor,
    this.iconSize,
  });

  /// The label to be displayed on the button
  final String? topLabel;
  final String? bottomLabel;
  final Color? labelColor;
  final double? fontSize;

  /// the icons to be displayed on the button
  final Widget? icon;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            12.verticalSpace,
            topLabel == null
                ? const SizedBox()
                : Text(
                    topLabel!,
                    style: TextStyle(
                      color: labelColor ?? theme.colorScheme.onPrimary,
                      fontSize: fontSize ?? theme.textTheme.bodySmall?.fontSize,
                    ),
                  ),
            icon ??
                Icon(
                  iconData ?? Icons.close,
                  color: iconColor,
                  size: iconSize,
                ),
            bottomLabel == null
                ? const SizedBox()
                : Text(
                    bottomLabel!,
                    style: TextStyle(
                      color: labelColor ?? theme.colorScheme.onPrimary,
                      fontSize: fontSize ?? theme.textTheme.bodySmall?.fontSize,
                    ),
                  ),
            12.verticalSpace,
          ],
        ),
      ),
    );
  }
}
