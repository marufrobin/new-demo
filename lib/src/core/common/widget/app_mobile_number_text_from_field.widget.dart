import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import '../../constant/constant_variable.dart';
import '../../constant/image_path.dart';

class AppPhoneNumberWidget extends StatelessWidget {
  const AppPhoneNumberWidget({
    super.key,
    required TextEditingController phoneNumberController,
    required this.onInputChanged,
    this.title,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.hintText = "01*********",
  }) : _phoneNumberController = phoneNumberController;

  final String? title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final TextEditingController _phoneNumberController;

  final String hintText;
  final void Function(String value)? onInputChanged;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title == null ? const SizedBox() : _titleWidget(theme: theme),
        title == null ? const SizedBox() : 2.verticalSpace,
        SizedBox(
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _countryCodeWidget(theme),
              Expanded(
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    enabledBorder: _outlineInputBorder(),
                    focusedBorder: _onFocusOutlineInputBorder(theme),
                    errorBorder: _outlineInputBorder(),
                    border: _outlineInputBorder(),
                    filled: true,
                    fillColor: theme.colorScheme.onSurface.withValues(
                      alpha: 0.1.r,
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 16.r,
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.6.r,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 14.r,
                      color: theme.colorScheme.error,
                    ),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(16.r),
                  ),
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  onChanged: onInputChanged,
                  validator: ValidationBuilder().required().phone().build(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _countryCodeWidget(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
      margin: EdgeInsets.only(right: 8.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      ),
      child: Row(
        spacing: 8.r,
        children: [
          SvgPicture.asset(
            ImagePath.kBDFlagIconLogo,
            width: 24.r,
            height: 24.r,
          ),
          const Text("+88"),
        ],
      ),
    );
  }

  Text _titleWidget({required ThemeData theme}) => Text(
    title!,
    style: TextStyle(
      color: titleColor,
      fontSize: titleFontSize ?? theme.textTheme.labelLarge?.fontSize,
      fontWeight: titleFontWeight ?? theme.textTheme.labelLarge?.fontWeight,
    ),
  );

  OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
  );

  OutlineInputBorder _onFocusOutlineInputBorder(ThemeData theme) =>
      OutlineInputBorder(
        borderSide: BorderSide(width: 2.r, color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      );
}
