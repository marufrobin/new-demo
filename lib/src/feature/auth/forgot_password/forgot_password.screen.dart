import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/auth/forgot_password/bloc/forgot_password_bloc.dart';

import '../../../core/common/widget/app_text_form_field.widget.dart';
import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/config/app.routes.dart';
import '../../../core/utils/close_keyboard.dart';
import 'forgot_password_verify_password.screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          log(result.toString(), name: "pop result");
          context.read<ForgotPasswordBloc>().add(ResetForgotPassword());
        }
      },
      child: Form(
        key: _formKey,
        child: AppScaffold(
          title: "Forgot password",
          hideAppBar: true,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Container(
              width: width,
              height: height,
              color: theme.colorScheme.surface,
              child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordSuccess) {
                    AppToaster.success(
                      message: "OTP sent successfully",
                      context: context,
                    );
                  } else if (state is ForgotPasswordFailure) {
                    AppToaster.error(message: state.error, context: context);
                  }
                },
                builder: (context, state) {
                  if (state is ForgotPasswordInitial ||
                      state is ForgotPasswordLoading ||
                      state is ForgotPasswordFailure) {
                    return _forgotPasswordScreen(
                      theme: theme,
                      isLoading: state is ForgotPasswordLoading,
                      onPressed: () async {
                        closeKeyboardOnClick();
                        if (!_formKey.currentState!.validate()) return;
                        context.read<ForgotPasswordBloc>().add(
                          ForgotPasswordSubmit(
                            email: _emailController.text.trim(),
                          ),
                        );
                      },
                    );
                  } else
                  /*if (state is ForgotPasswordSuccess ||
                      state is ForgotPasswordOtpSuccess ||
                      state is ForgotPasswordOtpLoading ||
                      state is ForgotPasswordOtpFailure ||
                      state is ForgotPasswordOtpVerify)*/
                  {
                    log(state.toString(), error: "ForgotPasswordState");
                    return _forgotPasswordOTPScreen(state: state);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordOTPScreen({required ForgotPasswordState state}) =>
      ForgotPasswordVerifyPhoneNumberScreen(
        email: _emailController.text.trim(),
        isOtpValid: state is ForgotPasswordOtpSuccess,
        onVerifyOTP: ({required email, required otp, required password}) {
          log(state.toString(), error: "ForgotPasswordState");
          log(email, name: "email");
          log(otp, name: "otp");
          log(password, name: "password");
          context.read<ForgotPasswordBloc>().add(
            ForgotPasswordOTPSubmit(email: email, otp: otp, password: password),
          );
          log(state.toString(), error: "ForgotPasswordState");
        },
        onResendOTP: () {
          context.read<ForgotPasswordBloc>().add(
            ForgotPasswordOTPResend(email: _emailController.text.trim()),
          );
        },
        onCompleteOTP: () {
          context.read<ForgotPasswordBloc>().add(ResetForgotPassword());

          context.goNamed(AppRoutesNames.signInWithEmailScreen);
        },
      );

  Column _forgotPasswordScreen({
    required ThemeData theme,
    required VoidCallback? onPressed,
    required bool isLoading,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        120.verticalSpace,
        Text('Forgot password', style: theme.textTheme.headlineMedium),
        Text(
          'Please enter your email to reset the password',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        50.verticalSpace,
        AppTextFormField(
          hintText: "Enter your email",
          title: "your email",
          titleColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          titleFontWeight: FontWeight.w500,
          controller: _emailController,
          validator:
              ValidationBuilder()
                  .required("Please enter your email")
                  .email("Please enter your email")
                  .build(),
        ),
        30.verticalSpace,
        AppButton(
          buttonLabel: "Reset password",
          size: ButtonSize.LG,
          isLoading: isLoading,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
