import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/clients/app_http.client.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/auth/sign_in/email/bloc/email_login_bloc.dart';

import '../../../../core/common/widget/app_scaffold.widget.dart';
import '../../../../core/common/widget/app_text_form_field.widget.dart';
import '../../../../core/config/app.dependency.dart';
import '../../../../core/config/app.routes.dart';
import '../../../../core/utils/close_keyboard.dart';
import '../../../../model/user.model.dart';
import '../../../account/bloc/user_bloc/user_bloc.dart';
import '../../auth_app_entry_point.dart';
import '../widgets/social_login.widgets.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  final AppHttpClient _appHttpClient = AppHttpClient();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => EmailLoginBloc(),
      child: Form(
        key: _formKey,
        child: AppScaffold(
          title: "Sign in with email",
          hideAppBar: true,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Container(
              width: width,
              height: height,
              color: theme.colorScheme.surface,
              child: BlocConsumer<EmailLoginBloc, EmailLoginState>(
                listener: _listener,
                builder: (context, state) {
                  return _body(context: context, state: state, theme: theme);
                },
              ),
            ),
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
    if (!mounted) return;

    final authEntryPoint = getIt<AuthAppEntryPoint>();
    await authEntryPoint.appEntryPoint(context: context, userModel: userModel);
  }

  Column _body({
    required BuildContext context,
    required EmailLoginState state,
    required ThemeData theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        120.verticalSpace,
        Text('Sign in your account', style: theme.textTheme.headlineMedium),
        Text(
          'Sign into your account',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        50.verticalSpace,
        _emailTextFeild(theme),
        _passwordTextFeild(theme),
        _forgotPasswordWidget(context, theme),
        30.verticalSpace,
        BlocListener<UserBloc, UserState>(
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
          child: AppButton(
            buttonLabel: "Sign in",
            size: ButtonSize.LG,
            isLoading: state is EmailLoginLoading,
            onPressed: () async {
              closeKeyboardOnClick();
              if (!_formKey.currentState!.validate()) return;
              log('Sign in button pressed');

              context.read<EmailLoginBloc>().add(
                EmailLoginWithPasswordEvent(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                ),
              );
            },
          ),
        ),
        20.verticalSpace,
        _signUpNavButtonWidget(
          theme: theme,
          onPressed: () {
            context.pushNamed(AppRoutesNames.signUpScreen);
          },
        ),
        80.verticalSpace,
        const SocialLoginWidget(),
      ],
    );
  }

  _listener(BuildContext context, EmailLoginState state) async {
    if (state is EmailLoginSuccess) {
      log(name: 'State', state.toString());
      log(name: 'Token', "${state.tokenResponse?.toJson()}");

      AppToaster.success(message: "Sign in successfully", context: context);
      // context.goNamed(AppRoutesNames.homeScreen);
      context.read<UserBloc>().add(UserDataFetchingEvent());
    } else if (state is EmailLoginFailure) {
      AppToaster.error(
        message: state.message ?? "Something went wrong!",
        context: context,
      );
    }
  }

  AppTextFormField _passwordTextFeild(ThemeData theme) {
    return AppTextFormField(
      hintText: 'Password',
      title: "Password",
      titleColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      titleFontWeight: FontWeight.w500,
      controller: _passwordController,
      obscureText: _isPasswordVisible,
      validator:
          ValidationBuilder()
              .required("Please enter password")
              .minLength(6, "Password must be at least 6 characters")
              .build(),
      suffixIcon: _eyeWidget(
        theme: theme,
        onPressed: () {
          setState(() => _isPasswordVisible = !_isPasswordVisible);
        },
        isVisible: _isPasswordVisible,
      ),
    );
  }

  AppTextFormField _emailTextFeild(ThemeData theme) {
    return AppTextFormField(
      hintText: "Email",
      title: "Email",
      titleColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      titleFontWeight: FontWeight.w500,
      controller: _emailController,
      validator:
          ValidationBuilder()
              .required("Please enter email")
              .email("Please enter email")
              .build(),
    );
  }

  InkWell _forgotPasswordWidget(BuildContext context, ThemeData theme) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutesNames.forgotPasswordScreen);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          "Forgot password?",
          style: TextStyle(color: theme.colorScheme.primary),
        ),
      ),
    );
  }

  InkWell _eyeWidget({
    required ThemeData theme,
    required VoidCallback onPressed,
    required bool isVisible,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
