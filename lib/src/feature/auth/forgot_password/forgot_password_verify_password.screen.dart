import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';

import '../../../core/common/widget/app_scaffold.widget.dart';
import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/utils/app_toaster.dart';
import '../../../core/utils/close_keyboard.dart';

class ForgotPasswordVerifyPhoneNumberScreen extends StatefulWidget {
  const ForgotPasswordVerifyPhoneNumberScreen({
    super.key,
    required this.email,
    required this.isOtpValid,
    required this.onResendOTP,
    required this.onVerifyOTP,
    required this.onCompleteOTP,
  });

  final String? email;

  /// [isOtpValid] is used to show [OtpTextField] widget
  /// if [isOtpValid] is true then [OtpTextField] widget will be visible
  /// else [_verifySuccessWidget] widget will be visible

  final bool isOtpValid;

  /// [onResendOTP] is used to resend otp implement it
  final VoidCallback? onResendOTP;

  /// [onVerifyOTP] is used to verify otp implement it
  final Function({
    required String otp,
    required String email,
    required String password,
  })?
  onVerifyOTP;

  final VoidCallback? onCompleteOTP;

  @override
  State<ForgotPasswordVerifyPhoneNumberScreen> createState() =>
      _ForgotPasswordVerifyPhoneNumberScreenState();
}

class _ForgotPasswordVerifyPhoneNumberScreenState
    extends State<ForgotPasswordVerifyPhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();

  // final _otpController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _otpNumber;

  int timerSecondLeft = 0;

  Future<void> _verifyOtp({
    required String otp,
    required String email,
    required String password,
  }) async =>
      widget.onVerifyOTP?.call(email: email, otp: otp, password: password);

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
        title: "Verify phone number",
        hideAppBar: true,
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(16.r),
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
            onPressed: widget.onCompleteOTP,
          ),
        ],
      ),
    );
  }

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
      AppTextFormField(
        hintText: "Enter your new password",
        title: "your new password",
        titleColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),
        titleFontWeight: FontWeight.w500,
        controller: _passwordController,
        validator:
            ValidationBuilder()
                .required("Please enter your new password")
                .minLength(6, "Password must be at least 6 characters")
                .build(),
      ),
      40.verticalSpace,
      OtpTextField(
        numberOfFields: 6,
        borderColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        borderRadius: BorderRadius.circular(10.r),
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

          if (!_formKey.currentState!.validate()) {
            AppToaster.error(
              message: "Please enter the code and new password",
              context: context,
            );
            return;
          }
          if (_otpNumber == null && _otpNumber?.length != 6) {
            AppToaster.error(message: "Please enter the otp", context: context);
            return;
          }

          await _verifyOtp(
            otp: _otpNumber!,
            email: widget.email ?? "",
            password: _passwordController.text.trim(),
          );
        },
      ),

      80.verticalSpace,
      AppButton(
        buttonLabel: "Verify",
        size: ButtonSize.LG,
        onPressed: () async {
          closeKeyboardOnClick();
          if (!_formKey.currentState!.validate()) {
            AppToaster.error(
              message: "Please enter the code and new password",
              context: context,
            );
            return;
          }
          if (_otpNumber == null && _otpNumber?.length != 6) {
            AppToaster.error(message: "Please enter the otp", context: context);
            return;
          }
          log(name: 'On submit', _otpNumber.toString());
          log(name: 'On submit', _passwordController.text.trim());
          await _verifyOtp(
            otp: _otpNumber!,
            email: widget.email ?? "",
            password: _passwordController.text.trim(),
          );
        },
      ),
      20.verticalSpace,
      Center(
        child: _TimerOfResend(
          theme: theme,
          onResendOTP: widget.onResendOTP,
          timerSecondLeft: timerSecondLeft,
        ),
      ),
    ],
  );
}

class _TimerOfResend extends StatefulWidget {
  const _TimerOfResend({
    super.key,
    required this.theme,
    required this.onResendOTP,
    required this.timerSecondLeft,
  });

  final ThemeData theme;
  final VoidCallback? onResendOTP;
  final int timerSecondLeft;

  @override
  State<_TimerOfResend> createState() => _TimerOfResendState();
}

class _TimerOfResendState extends State<_TimerOfResend> {
  bool _isLoading = false;
  late int timerSecondLeft;
  Timer? _resendTimer;

  @override
  void initState() {
    super.initState();
    timerSecondLeft = widget.timerSecondLeft;
  }

  @override
  void dispose() {
    _resendTimer?.cancel(); // ✅ Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _sendMeNewCodeWidget(
      theme: widget.theme,
      onPressed: _handleResend,
      timerSecondLeft: timerSecondLeft,
    );
  }

  Text _sendMeNewCodeWidget({
    required ThemeData theme,
    required VoidCallback onPressed,
    required int timerSecondLeft,
  }) {
    return Text.rich(
      TextSpan(
        children:
            timerSecondLeft == 0
                ? [
                  const TextSpan(text: "Haven’t got the email yet? "),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = onPressed,
                    text: "Resend email",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ]
                : [TextSpan(text: "Resend in $timerSecondLeft seconds")],
      ),
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    );
  }

  void _handleResend() {
    if (timerSecondLeft > 0 || _isLoading) return;

    setState(() => _isLoading = true);

    widget.onResendOTP?.call();

    timerSecondLeft = 120;
    setState(() => _isLoading = false);

    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return timer.cancel(); // ✅ avoid setState on unmounted widget
      }

      if (timerSecondLeft == 0) {
        timer.cancel();
      } else {
        setState(() => timerSecondLeft--);
      }
    });
  }
}
