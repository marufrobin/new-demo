import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/feature/auth/on_boarding/bloc/on_boarding_bloc.dart';

import '../../../../core/common/widget/app_mobile_number_text_from_field.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/config/app.routes.dart';
import '../../../../core/utils/app_toaster.dart';

class OnboardingPaymentMethodScreen extends StatefulWidget {
  const OnboardingPaymentMethodScreen({super.key});

  @override
  State<OnboardingPaymentMethodScreen> createState() =>
      _OnboardingPaymentMethodScreenState();
}

class _OnboardingPaymentMethodScreenState
    extends State<OnboardingPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _bKashNumberController = TextEditingController();

  final _bankNameController = TextEditingController();

  final _bankBranchNameController = TextEditingController();

  final _bankAccountNumberController = TextEditingController();

  final _confirmBankAccountNumberController = TextEditingController();

  final _routingNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: AppScaffold(
        title: "Become a Rider",
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _verificationText(theme),
                  16.verticalSpace,
                  AppTextFormField(
                    title: "Name",
                    hintText: "Please write your full name",
                    controller: _nameController,
                    validator:
                        ValidationBuilder()
                            .required("Please write your full name")
                            .build(),
                  ),
                  AppPhoneNumberWidget(
                    title: "bKash number",
                    // hintText: "Please enter your bKash number",
                    phoneNumberController: _bKashNumberController,
                    onInputChanged: (value) {
                      log(name: 'Phone number changed to ', value.toString());
                    },
                  ),
                  AppTextFormField(
                    title: "Bank name",
                    hintText: "Please enter your bank name",
                    controller: _bankNameController,
                    // validator:
                    //     ValidationBuilder()
                    //         .required("Please enter your bank name")
                    //         .build(),
                  ),
                  AppTextFormField(
                    title: "Bank branch name",
                    hintText: "Please enter your bank branch name",
                    controller: _bankBranchNameController,
                    // validator:
                    //     ValidationBuilder()
                    //         .required("Please enter your bank branch name")
                    //         .build(),
                  ),
                  AppTextFormField(
                    title: "Bank account number",
                    hintText: "Please enter your bank account number",
                    controller: _bankAccountNumberController,
                    // validator:
                    //     ValidationBuilder()
                    //         .required("Please enter your bank account number")
                    //         .build(),
                  ),
                  AppTextFormField(
                    title: "Confirm bank account number",
                    hintText: "Please confirm your bank account number",
                    controller: _confirmBankAccountNumberController,
                    validator:
                        ValidationBuilder()
                            .add(
                              (value) =>
                                  _bankAccountNumberController.text == value
                                      ? null
                                      : "Bank account number does not match",
                            )
                            .build(),
                  ),
                  AppTextFormField(
                    title: "Routing number",
                    hintText: "Please enter your routing number",
                    controller: _routingNumberController,
                    // validator:
                    //     ValidationBuilder()
                    //         .required("Please enter your routing number")
                    //         .build(),
                  ),
                  _warningText(theme),
                  20.verticalSpace,
                  BlocConsumer<OnBoardingBloc, OnBoardingState>(
                    listener: (context, state) {
                      if (state is OnBoardingPaymentMethodData) {
                        if (state.isSuccessful == true) {
                          AppToaster.success(
                            message: "Successfully updated your payment method",
                            context: context,
                          );
                          // context.pushNamed(
                          //   AppRoutesNames.completeOnBoardingScreen,
                          // );

                          context.pushNamed(
                            AppRoutesNames.onboardingProfileImageScreen,
                          );
                        }
                      }
                      if (state is OnBoardingError) {
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
                          isLoading: state is OnBoardingLoading,
                          onPressed: () {
                            // context.pushNamed(
                            //   AppRoutesNames.completeOnBoardingScreen,
                            // );
                            if (!_formKey.currentState!.validate() &&
                                _confirmBankAccountNumberController.text !=
                                    _bankAccountNumberController.text) {
                              log('Sign up button pressed inside');
                              return;
                            }
                            context.read<OnBoardingBloc>().add(
                              OnBoardingPaymentMethodSubmitEvent(
                                accountHolderName: _nameController.text,
                                bkashNumber: _bKashNumberController.text,
                                bankName: _bankNameController.text,
                                bankBranchName: _bankBranchNameController.text,
                                bankAccountNumber:
                                    _bankAccountNumberController.text,
                                bankRoutingNumber:
                                    _routingNumberController.text,
                              ),
                            );

                            // context.pushNamed(
                            //   AppRoutesNames.completeOnBoardingScreen,
                            // );
                            log('Sign up button pressed');
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

  Column _verificationText(ThemeData theme) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Payment method", style: theme.textTheme.titleLarge),
      Text(
        "Enter your preferred payment details.",
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    ],
  );

  Text _warningText(ThemeData theme) => Text(
    "Please double check the payment information, as we may not be able to refund a transfer once it’s been confirmed.",
    style: theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
    ),
  );
}
