import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/utils/app_dialog.dart';

import '../../../core/common/widget/app_mobile_number_text_from_field.widget.dart';
import '../../../core/common/widget/app_scaffold.widget.dart';
import '../../../core/common/widget/app_text_form_field.widget.dart';
import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/utils/app_toaster.dart';
import '../bloc/payment_method_bloc.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _bKashNumberController = TextEditingController();

  final _bankNameController = TextEditingController();

  final _bankBranchNameController = TextEditingController();

  final _bankAccountNumberController = TextEditingController();

  final _confirmBankAccountNumberController = TextEditingController();

  final _routingNumberController = TextEditingController();

  @override
  void initState() {
    context.read<PaymentMethodBloc>().add(PaymentMethodFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bKashNumberController.dispose();
    _bankNameController.dispose();
    _bankBranchNameController.dispose();
    _bankAccountNumberController.dispose();
    _confirmBankAccountNumberController.dispose();
    _routingNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: BlocConsumer<PaymentMethodBloc, PaymentMethodState>(
        listener: (context, state) {
          if (state is PaymentMethodData) {
            final data = state.userPaymentInfoModel;

            if (data != null) {
              log(name: "Payment method", "${data.toJson()}");
              _nameController.text = data.accountHolderName ?? "";
              _bKashNumberController.text = data.bkashNumber ?? "";
              _bankNameController.text = data.bankName ?? "";
              _bankBranchNameController.text = data.bankBranchName ?? "";
              _bankAccountNumberController.text = data.bankAccountNumber ?? "";
              _routingNumberController.text = data.bankRoutingNumber ?? "";
            }
          } else if (state is UpdatePaymentMethodSuccess) {
            AppToaster.success(
              message: "Successfully updated your payment information",
              context: context,
            );
            context.read<PaymentMethodBloc>().add(PaymentMethodFetchEvent());
          } else if (state is UpdatePaymentMethodFailure) {
            AppToaster.error(message: state.errorMessage, context: context);
          } else if (state is PaymentMethodError) {
            AppToaster.error(message: state.errorMessage, context: context);
          }
        },
        builder: (context, state) {
          return AppScaffold(
            title: "Payment method",
            backgroundColor: theme.colorScheme.surface,
            isLoading: state is PaymentMethodLoading,
            body: AppRefreshIndicatorWidget(
              isScrollNotificationNeeded: false,
              onRefresh: () async {
                context.read<PaymentMethodBloc>().add(
                  PaymentMethodFetchEvent(),
                );
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    padding: EdgeInsets.all(16.0.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          phoneNumberController: _bKashNumberController,
                          onInputChanged: (value) {
                            log(
                              name: 'Phone number changed to ',
                              value.toString(),
                            );
                          },
                        ),
                        AppTextFormField(
                          title: "Bank name",
                          hintText: "Please enter your bank name",
                          controller: _bankNameController,
                        ),
                        AppTextFormField(
                          title: "Bank branch name",
                          hintText: "Please enter your bank branch name",
                          controller: _bankBranchNameController,
                        ),
                        AppTextFormField(
                          title: "Bank account number",
                          hintText: "Please enter your bank account number",
                          controller: _bankAccountNumberController,
                        ),
                        AppTextFormField(
                          title: "Confirm bank account number",
                          hintText: "Please confirm your bank account number",
                          controller: _confirmBankAccountNumberController,
                          validator:
                              ValidationBuilder()
                                  .add(
                                    (value) =>
                                        _bankAccountNumberController.text ==
                                                value
                                            ? null
                                            : "Bank account number does not match",
                                  )
                                  .build(),
                        ),
                        AppTextFormField(
                          title: "Routing number",
                          hintText: "Please enter your routing number",
                          controller: _routingNumberController,
                        ),
                        _warningText(theme),
                        20.verticalSpace,
                        Align(
                          alignment: Alignment.center,
                          child: AppButton(
                            buttonLabel: "Next",
                            isLoading: state is PaymentMethodLoading,
                            onPressed: () {
                              if (!_formKey.currentState!.validate() &&
                                  _confirmBankAccountNumberController.text !=
                                      _bankAccountNumberController.text) {
                                log('Sign up button pressed inside');
                                return;
                              }
                              AppDialog.confirmationDialog(
                                yesButtonPressed: () {
                                  final event = UpdatePaymentMethodPatchEvent(
                                    accountHolderName: _nameController.text,
                                    bkashNumber: _bKashNumberController.text,
                                    bankName: _bankNameController.text,
                                    bankBranchName:
                                        _bankBranchNameController.text,
                                    bankAccountNumber:
                                        _bankAccountNumberController.text,
                                    bankRoutingNumber:
                                        _routingNumberController.text,
                                  );

                                  context.read<PaymentMethodBloc>().add(event);
                                  context.pop();
                                },
                                noButtonPressed: () {
                                  log('Sign up button pressed');
                                },
                                context: context,
                              );
                            },
                            fixedSize: Size(284.r, 60.r),
                          ),
                        ),
                        60.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Text _warningText(ThemeData theme) => Text(
    "Please double check the payment information, as we may not be able to refund a transfer once it’s been confirmed.",
    style: theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
    ),
  );
}
