import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../bloc/change_password_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: AppScaffold(
        title: "Change password",
        backgroundColor: theme.colorScheme.surface,
        body: Container(
          margin: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'Old password',
                title: 'Old password',
                controller: _oldPasswordController,
                validator:
                    ValidationBuilder()
                        .required("Please enter old password")
                        .build(),
              ),
              AppTextFormField(
                hintText: 'New password',
                title: 'New password',
                controller: _newPasswordController,
                validator:
                    ValidationBuilder()
                        .required("Please enter new password")
                        .build(),
              ),
              AppTextFormField(
                hintText: 'Confirm new password',
                title: 'Confirm new password',
                controller: _confirmPasswordController,
                validator:
                    ValidationBuilder()
                        .required("Please enter confirm new password")
                        .add(
                          (value) =>
                              _newPasswordController.text != value
                                  ? "Passwords don't match"
                                  : null,
                        )
                        .build(),
              ),
              20.verticalSpace,
              BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    AppToaster.success(
                      message: "Password changed successfully",
                      context: context,
                    );
                    context.pop();
                  }
                  if (state is ChangePasswordFailure) {
                    AppToaster.error(
                      message:
                          state.errorMessage ??
                          "Something went wrong \nwhile changing password \nplease try again",
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      buttonLabel: "Change password",
                      isLoading: state is ChangePasswordLoading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final changePasswordEvent =
                              ChangeMyPasswordPatchEvent(
                                oldPassword: _oldPasswordController.text.trim(),
                                newPassword: _newPasswordController.text.trim(),
                                confirmNewPassword:
                                    _confirmPasswordController.text.trim(),
                              );
                          context.read<ChangePasswordBloc>().add(
                            changePasswordEvent,
                          );
                        }
                      },
                      // fixedSize: Size(284.r, 60.r),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
