import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/utils/close_keyboard.dart';

import '../../constant/constant_variable.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onTap,
    this.onChanged,
    this.maxLines,
    this.title,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleColor,
    this.hintText = 'Enter your name',
    this.keyboardType,
    this.borderSide,
    this.isEnabledToEdit,
    this.fillColor,
  });

  /// Text field
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;
  final int? maxLines;

  /// The title to be displayed on top of the text field
  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? titleColor;

  /// Text field style
  final String? hintText;
  final TextInputType? keyboardType;
  final BorderSide? borderSide;

  final Color? fillColor;

  final bool? isEnabledToEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title == null ? const SizedBox() : _titleWidget(theme: theme),
        2.verticalSpace,
        TextField(
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          keyboardType: keyboardType,
          onTapOutside: (event) => closeKeyboardOnClick(),
          maxLines: maxLines,
          enabled: isEnabledToEdit,
          decoration: InputDecoration(
            constraints:
                maxLines == null
                    ? BoxConstraints(maxHeight: 60.r)
                    : BoxConstraints(maxHeight: 120.r),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.r,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6.r),
            ),
            enabledBorder: _outlineInputBorder(borderSide),
            focusedBorder: _outlineInputBorder(borderSide),
            errorBorder: _outlineInputBorder(borderSide),
            border: _outlineInputBorder(borderSide),
            filled: true,
            fillColor:
                fillColor ??
                theme.colorScheme.onSurface.withValues(alpha: 0.1.r),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.all(16.r),
          ),
          style: TextStyle(fontSize: 16.r, color: theme.colorScheme.onSurface),
        ),
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder(BorderSide? borderSide) =>
      OutlineInputBorder(
        borderSide: borderSide ?? BorderSide.none,
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      );

  Text _titleWidget({required ThemeData theme}) => Text(
    title!,
    style: TextStyle(
      color: titleColor,
      fontSize: titleFontSize ?? theme.textTheme.labelLarge?.fontSize,
      fontWeight: titleFontWeight ?? theme.textTheme.labelLarge?.fontWeight,
    ),
  );
}
