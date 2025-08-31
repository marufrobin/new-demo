import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/auth/sign_up/data/data_provider/sign_up_data.provider.dart';

import '../../../../core/common/widget/app_mobile_number_text_from_field.widget.dart';
import '../../../../core/common/widget/app_scaffold.widget.dart';
import '../../../../core/common/widget/app_text_form_field.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/config/app.routes.dart';
import '../bloc/sign_up_bloc.dart';
import '../data/repository/sign_up.repository.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Become a rider",
      body: SafeArea(child: _RiderDetailsWidget()),
    );
  }
}

class _RiderDetailsWidget extends StatefulWidget {
  const _RiderDetailsWidget({super.key});

  @override
  State<_RiderDetailsWidget> createState() => _RiderDetailsWidgetState();
}

class _RiderDetailsWidgetState extends State<_RiderDetailsWidget> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.all(16.0.r),
          child: RepositoryProvider(
            create: (context) => SignUpRepository(SignUpDataProvider()),
            child: BlocProvider(
              create: (context) => SignUpBloc(context.read<SignUpRepository>()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(theme: theme, text: "Rider Details"),
                  _pageDescription(
                    theme: theme,
                    text: "Enter your personal details",
                  ),
                  12.verticalSpace,
                  AppTextFormField(
                    hintText: "Full name",
                    title: "Full name",
                    controller: _fullNameController,
                    validator:
                        ValidationBuilder()
                            .required("Please enter full name")
                            .build(),
                  ),
                  AppTextFormField(
                    hintText: "Email",
                    title: "Email",
                    controller: _emailController,
                    validator:
                        ValidationBuilder()
                            .required("Please enter email")
                            .email("Please enter email")
                            .build(),
                  ),
                  AppPhoneNumberWidget(
                    title: "Phone number",
                    phoneNumberController: _phoneNumberController,
                    onInputChanged: (value) {
                      log(name: 'Phone number changed to ', value.toString());
                    },
                  ),
                  AppTextFormField(
                    hintText: "City",
                    title: "City",
                    controller: _cityController,
                    validator:
                        ValidationBuilder()
                            .required("Please enter city")
                            .build(),
                  ),
                  AppTextFormField(
                    hintText: "Address",
                    title: "Address",
                    controller: _addressController,
                    validator:
                        ValidationBuilder()
                            .required("Please enter address")
                            .build(),
                  ),
                  AppTextFormField(
                    hintText: 'Password',
                    title: 'Password',
                    controller: _passwordController,
                    obscureText: _isPasswordVisible,
                    validator:
                        ValidationBuilder()
                            .required("Please enter password")
                            .minLength(
                              6,
                              "Password must be at least 6 characters",
                            )
                            .build(),
                    suffixIcon: _eyeIconWidget(
                      theme: theme,
                      onPressed: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                      isVisible: _isPasswordVisible,
                    ),
                  ),
                  AppTextFormField(
                    hintText: 'Confirm password',
                    title: 'Confirm password',
                    controller: _confirmPasswordController,
                    obscureText: _isConfirmPasswordVisible,
                    validator:
                        ValidationBuilder()
                            .required("Please enter confirm password")
                            .minLength(
                              6,
                              "Password must be at least 6 characters",
                            )
                            .add(
                              (value) =>
                                  _passwordController.text != value
                                      ? "Passwords don't match"
                                      : null,
                            )
                            .build(),
                    suffixIcon: _eyeIconWidget(
                      theme: theme,
                      onPressed: () {
                        setState(
                          () =>
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible,
                        );
                      },
                      isVisible: _isConfirmPasswordVisible,
                    ),
                  ),
                  40.verticalSpace,
                  BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpData) {
                        context.pushNamed(
                          AppRoutesNames.onboardingVehicleDetailsScreen,
                        );
                      } else if (state is SignUpError) {
                        AppToaster.error(
                          message: state.errorMessage,
                          context: context,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          buttonLabel: "Next",
                          isLoading: state is SignUpLoading,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              log("Sign up button pressed");
                              return;
                            }
                            if (_confirmPasswordController.text !=
                                _passwordController.text) {
                              AppToaster.error(
                                message: "Passwords don't match",
                                context: context,
                              );
                              return;
                            }
                            context.read<SignUpBloc>().add(
                              SignUpMutationSubmitEvent(
                                name: _fullNameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                phoneNumber: _phoneNumberController.text.trim(),
                                city: _cityController.text.trim(),
                                address: _addressController.text.trim(),
                              ),
                            );
                          },
                          fixedSize: Size(284.r, 60.r),
                        ),
                      );
                    },
                  ),
                  60.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell _eyeIconWidget({
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

  Text _pageDescription({required ThemeData theme, required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: theme.textTheme.bodySmall?.fontSize,
        fontWeight: theme.textTheme.bodySmall?.fontWeight,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }

  Text _pageTitle({required ThemeData theme, required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: theme.textTheme.titleLarge?.fontSize,
        fontWeight: theme.textTheme.titleLarge?.fontWeight,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
