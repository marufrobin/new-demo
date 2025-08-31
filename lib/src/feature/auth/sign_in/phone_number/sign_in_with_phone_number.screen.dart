import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/feature/auth/sign_in/phone_number/bloc/phone_number_login_bloc.dart';

import '../../../../core/common/widget/app_mobile_number_text_from_field.widget.dart';
import '../../../../core/common/widget/app_scaffold.widget.dart';
import '../../../../core/config/app.dependency.dart';
import '../../../../core/config/app.routes.dart';
import '../../../../core/utils/app_toaster.dart';
import '../../../../core/utils/close_keyboard.dart';
import '../../../../model/user.model.dart';
import '../../../account/bloc/user_bloc/user_bloc.dart';
import '../../auth_app_entry_point.dart';
import '../widgets/social_login.widgets.dart';
import 'otp_verification.screen.dart';

class SignInWithPhoneNumberScreen extends StatelessWidget {
  SignInWithPhoneNumberScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();

  _navigateToHomeScreen(BuildContext context) {
    // context.goNamed(AppRoutesNames.homeScreen);
    context.read<UserBloc>().add(UserDataFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => PhoneNumberLoginBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) async {
          // Only navigate once and when we have a definitive state
          if (_hasNavigated) return;

          // Handle different user states
          if (state is UserData) {
            // User data loaded successfully
            _hasNavigated = true;
            await _navigateBasedOnUserData(context, state.userModel);
          } else if (state is UserError) {
            // User data loading failed - treat as not logged in
            _hasNavigated = true;
            await _navigateBasedOnUserData(context, null);
          }
          // Don't navigate on UserLoading or UserInitial states
        },
        child: AppScaffold(
          title: "Sign in with phone number",
          hideAppBar: true,
          body: BlocConsumer<PhoneNumberLoginBloc, PhoneNumberLoginState>(
            listener: _listener,
            builder: (context, state) {
              log(name: 'State', state.toString());
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    state is PhoneNumberSendLoginOTPSuccess ||
                            state is PhoneNumberLoginSuccess ||
                            state is PhoneNumberLoginFailure ||
                            state is PhoneNumberLoginLoading
                        ? VerifyPhoneNumberScreen(
                          isOtpValid: state is PhoneNumberLoginSuccess,
                          isLoading: state is PhoneNumberLoginLoading,
                          onResendOTP: () {
                            context.read<PhoneNumberLoginBloc>().add(
                              ResetPhoneNumberLoginEvent(),
                            );
                          },
                          onVerifyOTP: (otpNumber) {
                            log(name: 'OTP from signin', otpNumber.toString());
                            if (otpNumber == null) {
                              log(
                                name: 'OTP from signin',
                                otpNumber.toString(),
                              );

                              AppToaster.error(
                                message: "Please enter a valid OTP",
                                context: context,
                              );
                              return;
                            }
                            context.read<PhoneNumberLoginBloc>().add(
                              PhoneNumberLoginUsingOTPEvent(
                                phoneNumber: _phoneNumberController.text.trim(),
                                otp: otpNumber,
                              ),
                            );
                          },
                          onCompleteSignIn: () {
                            if (state is PhoneNumberLoginSuccess) {
                              _navigateToHomeScreen(context);
                            }
                          },
                        )
                        : _phoneNumberInput(
                          width: width,
                          height: height,
                          theme: theme,
                          context: context,
                          isLoading: state is PhoneNumberSendLoginOTPLoading,
                          onSignInPressed: () {
                            context.read<PhoneNumberLoginBloc>().add(
                              PhoneNumberSendLoginOTPEvent(
                                phoneNumber: _phoneNumberController.text.trim(),
                              ),
                            );
                          },
                        ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool _hasNavigated = false; // Prevent multiple navigations
  Future<void> _navigateBasedOnUserData(
    BuildContext context,
    UserModel? userModel,
  ) async {
    if (!context.mounted) return;

    final authEntryPoint = getIt<AuthAppEntryPoint>();
    await authEntryPoint.appEntryPoint(context: context, userModel: userModel);
  }

  _listener(BuildContext context, PhoneNumberLoginState state) {
    if (state is PhoneNumberSendLoginOTPSuccess) {
      log(name: 'State', state.toString());
      log(name: 'is Otp', "${state.isOTPSent}");
      AppToaster.success(message: "OTP sent successfully", context: context);
    } else if (state is PhoneNumberLoginSuccess) {
      AppToaster.success(message: "Sign in successfully", context: context);
      log(name: 'State', state.toString());
      log(name: 'Token', "${state.tokenResponse?.toJson()}");
      _navigateToHomeScreen(context);
    } else if (state is PhoneNumberSendLoginOTPFailure) {
      AppToaster.error(
        message: state.message ?? "Something went wrong!",
        context: context,
      );
    } else if (state is PhoneNumberLoginFailure) {
      AppToaster.error(
        message: state.message ?? "Something went wrong!",
        context: context,
      );
    }
  }

  Form _phoneNumberInput({
    required double width,
    required double height,
    required ThemeData theme,
    required BuildContext context,
    required bool isLoading,
    required Function() onSignInPressed,
  }) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Container(
          width: width,
          height: height,
          color: theme.colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              120.verticalSpace,
              Text(
                'Sign in your account',
                style: theme.textTheme.headlineMedium,
              ),
              Text(
                'Sign into your account',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              60.verticalSpace,
              AppPhoneNumberWidget(
                title: "Phone number",
                // hintText: "1*********",
                phoneNumberController: _phoneNumberController,
                onInputChanged: (value) {
                  log(name: 'Phone number changed to ', value.toString());
                },
              ),
              // _forgotPasswordWidget(context, theme),
              80.verticalSpace,
              AppButton(
                buttonLabel: "Sign in",
                size: ButtonSize.XL,
                isLoading: isLoading,
                onPressed: () async {
                  closeKeyboardOnClick();
                  if (!_formKey.currentState!.validate()) return;

                  log('Sign in button pressed');

                  /// TODO: Add sign in logic
                  onSignInPressed();
                },
              ),
              20.verticalSpace,
              _signUpNavButtonWidget(
                theme: theme,
                onPressed: () {
                  context.pushNamed(AppRoutesNames.signUpScreen);
                },
              ),
              60.verticalSpace,
              const SocialLoginWidget(isEmailSignIn: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpNavButtonWidget({
    required ThemeData theme,
    required VoidCallback onPressed,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onPressed,
              text: "Create one!",
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
      ),
    );
  }
}
