import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/close_keyboard.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.onTap,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.keyboardType,
    this.textInputHeight,
    this.title,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleColor,
    this.hintText = 'Enter your email',
    this.suffixIcon,
    this.prefixIcon,
  });

  /// Text field
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final bool? obscureText;
  final double? textInputHeight;

  /// Suffix icons and Prefix icons
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  /// The title to be displayed on top of the text field
  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? titleColor;
  final TextInputType? keyboardType;

  /// Text field style
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title == null ? const SizedBox() : _titleWidget(theme: theme),
        title == null ? const SizedBox() : 2.verticalSpace,
        SizedBox(
          height: 80.r,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            onTap: onTap,
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            onTapOutside: (event) => closeKeyboardOnClick(),
            decoration: InputDecoration(
              // constraints: BoxConstraints(maxHeight: 60.r, minHeight: 50.r),
              enabledBorder: _outlineInputBorder(),
              focusedBorder: _onFocusOutlineInputBorder(theme),
              errorBorder: _outlineInputBorder(),
              border: _outlineInputBorder(),
              filled: true,
              fillColor: theme.colorScheme.onSurface.withValues(alpha: 0.1.r),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16.r,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6.r),
              ),
              errorStyle: TextStyle(
                fontSize: 14.r,
                color: theme.colorScheme.error,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.all(16.r),
            ),
            style: TextStyle(
              fontSize: 16.r,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      );

  OutlineInputBorder _onFocusOutlineInputBorder(ThemeData theme) =>
      OutlineInputBorder(
        borderSide: BorderSide(width: 2.r, color: theme.colorScheme.primary),
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
