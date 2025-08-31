import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../../../../core/common/widget/app_scaffold.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/constant/constant_variable.dart';
import '../../../../core/utils/close_keyboard.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({
    super.key,
    required this.isOtpValid,
    required this.isLoading,
    required this.onCompleteSignIn,
    required this.onResendOTP,
    required this.onVerifyOTP,
  });

  final bool isOtpValid;
  final bool isLoading;

  final Function() onCompleteSignIn;
  final Function() onResendOTP;

  final Function(String? otpNumber) onVerifyOTP;

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _otpNumber;

  Widget _switchWidget({required bool isOtpValid, required ThemeData theme}) =>
      isOtpValid ? _verifySuccessWidget(theme) : _verifyWidget(theme);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: AppScaffold(
        title: "Sign in",
        hideAppBar: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Container(
            width: width,
            height: height,
            color: theme.colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                120.verticalSpace,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _switchWidget(
                    isOtpValid: widget.isOtpValid,
                    theme: theme,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _verifySuccessWidget(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SvgPicture.asset(ImagePath.doneLogo),
          Text('Verified Successfully!', style: theme.textTheme.headlineMedium),
          Text('Your number is verified!', style: theme.textTheme.bodySmall),
          80.verticalSpace,
          AppButton(
            buttonLabel: "Continue",
            size: ButtonSize.LG,
            onPressed: widget.onCompleteSignIn,
          ),
        ],
      ),
    );
  }

  Future<void> _verifyOtp({required String otp}) async =>
      widget.onVerifyOTP.call(otp);

  Column _verifyWidget(ThemeData theme) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Verify your phone number', style: theme.textTheme.headlineMedium),
      Text(
        'Input the four digit verification code sent to your Phone number',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ),
      16.verticalSpace,
      OtpTextField(
        numberOfFields: 4,
        borderColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        fieldWidth: 56.r,
        fillColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        focusedBorderColor: theme.colorScheme.primary,
        textStyle: TextStyle(color: theme.colorScheme.primary),
        //runs when a code is typed in
        onCodeChanged: (String code) {
          log(name: 'On change', code);
        },

        onSubmit: (String verificationCode) async {
          log(name: 'On submit', verificationCode);
          setState(() => _otpNumber = verificationCode);

          log(name: 'On submit', verificationCode);

          if (!_formKey.currentState!.validate()) {
            AppToaster.error(
              message: "Please enter a valid OTP",
              context: context,
            );
            return;
          }
          if (_otpNumber == null) {
            AppToaster.error(
              message: "Please enter a valid OTP",
              context: context,
            );
            return;
          }

          _verifyOtp(otp: _otpNumber!);
        },
      ),
      80.verticalSpace,
      AppButton(
        buttonLabel: "Verify",
        size: ButtonSize.LG,
        isLoading: widget.isLoading,
        onPressed: () async {
          closeKeyboardOnClick();
          log('Verify button pressed$_otpNumber');

          if (!_formKey.currentState!.validate()) {
            return;
          }
          if (_otpNumber == null) {
            AppToaster.error(
              message: "Please enter a valid OTP",
              context: context,
            );
            return;
          }
          log('Verify button pressed$_otpNumber');
          _verifyOtp(otp: _otpNumber!);
        },
      ),
      20.verticalSpace,
      Center(
        child: _sendMeNewCodeWidget(
          theme: theme,
          onPressed: widget.onResendOTP,
        ),
      ),
    ],
  );

  Text _sendMeNewCodeWidget({
    required ThemeData theme,
    required VoidCallback onPressed,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Send me a new code "),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            text: "click here!",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
      style: TextStyle(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        fontSize: theme.textTheme.bodyMedium?.fontSize,
        fontWeight: theme.textTheme.bodyMedium?.fontWeight,
      ),
    );
  }
}
