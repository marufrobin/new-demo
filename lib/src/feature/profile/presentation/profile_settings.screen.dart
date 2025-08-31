import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_text_field.widget.dart';
import 'package:rider/src/model/user.model.dart';

import '../../../core/common/widget/app_image_picker.widget.dart';
import '../../../core/common/widget/app_mobile_number_text_from_field.widget.dart';
import '../../../core/common/widget/app_scaffold.widget.dart';
import '../../../core/common/widget/app_text_form_field.widget.dart';
import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/utils/app_toaster.dart';
import '../../account/bloc/user_bloc/user_bloc.dart';
import '../bloc/profile_settings_bloc.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final _fullNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _addressController = TextEditingController();

  final _cityController = TextEditingController();

  final _passwordController = TextEditingController();

  String? profileImage;
  String? existingImage;

  @override
  void initState() {
    context.read<UserBloc>().add(UserDataFetchingEvent());
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _prefillData({UserModel? user}) {
    if (user == null) return;

    _fullNameController.text = user.name ?? '';
    _emailController.text = user.email ?? '';
    _phoneNumberController.text = user.phone_number ?? '';
    _addressController.text = user.address ?? '';
    _cityController.text = user.city ?? '';
    existingImage = user.avatar?.key;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserData) {
          _prefillData(user: state.userModel);
          return _body(theme: theme, isLoading: state is UserLoading);
        } else {
          return _body(theme: theme, isLoading: state is UserLoading);
        }
      },
    );
  }

  AppScaffold _body({required ThemeData theme, bool? isLoading}) {
    return AppScaffold(
      title: 'Profile settings',
      isLoading: isLoading ?? false,
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: AppRefreshIndicatorWidget(
          isScrollNotificationNeeded: false,
          onRefresh: () async {
            profileImage = null;
            context.read<UserBloc>().add(UserDataFetchingEvent());
          },
          child: BlocConsumer<ProfileSettingsBloc, ProfileSettingsState>(
            listener: (context, state) {
              if (state is ProfileSettingsData) {
                if (state.result ?? false) {
                  AppToaster.success(
                    context: context,
                    message: "Profile updated successfully!",
                  );
                  profileImage = null;

                  context.read<UserBloc>().add(UserDataFetchingEvent());
                }
              } else if (state is ProfileSettingsError) {
                AppToaster.error(context: context, message: state.errorMessage);
              }
            },
            builder: (context, state) {
              return RiderDetailsWidget(
                fullNameController: _fullNameController,
                emailController: _emailController,
                phoneNumberController: _phoneNumberController,
                addressController: _addressController,
                cityController: _cityController,
                passwordController: _passwordController,
                existingImage: existingImage,
                onPickImage: (pickedImagePath) {
                  setState(() => profileImage = pickedImagePath);
                },
                onPressed: () {
                  context.read<ProfileSettingsBloc>().add(
                    ProfileSettingsUpdateMeMutationEvent(
                      name: _fullNameController.text,
                      phoneNumber: _phoneNumberController.text,
                      city: _cityController.text,
                      address: _addressController.text,
                      profileImage: profileImage,
                    ),
                  );
                },
                isLoading: state is ProfileSettingsLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}

class RiderDetailsWidget extends StatelessWidget {
  const RiderDetailsWidget({
    super.key,
    required this.onPressed,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.addressController,
    required this.cityController,
    required this.passwordController,
    this.isLoading = false,
    this.existingImage,
    this.onPickImage,
  });

  final TextEditingController fullNameController;

  final TextEditingController emailController;

  final TextEditingController phoneNumberController;

  final TextEditingController addressController;

  final TextEditingController cityController;

  final TextEditingController passwordController;

  final VoidCallback? onPressed;

  final String? existingImage;

  final void Function(String? pickedImagePath)? onPickImage;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        width: width,
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pageTitle(theme: theme, text: "Rider Details"),
            _pageDescription(theme: theme, text: "Enter your personal details"),
            10.verticalSpace,
            Text(
              "*To Change Name and Email Please Contract DineBD Support",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            12.verticalSpace,
            AppImagePickerWidget(
              label: "Profile image",
              description: "Upload your profile image",
              existingImage: existingImage,
              onPickImage: onPickImage,
            ),
            12.verticalSpace,
            AppTextField(
              hintText: "Full name",
              title: "Full name*",
              controller: fullNameController,
              isEnabledToEdit: false,
            ),
            12.verticalSpace,
            AppTextField(
              hintText: "Email",
              title: "Email*",
              controller: emailController,
              isEnabledToEdit: false,
            ),
            12.verticalSpace,
            AppPhoneNumberWidget(
              title: "Phone number",
              hintText: "Mobile number",
              phoneNumberController: phoneNumberController,
              onInputChanged: (value) {
                log(name: 'Phone number changed to ', value.toString());
              },
            ),
            AppTextField(
              hintText: "Enter city you will drive to",
              title: "City",
              controller: cityController,
            ),
            12.verticalSpace,
            AppTextField(
              hintText: "Where do you live?",
              title: "Address",
              controller: addressController,
            ),
            12.verticalSpace,
            AppTextFormField(
              hintText: 'Your working area',
              title: 'Where would you like to work?',
              controller: passwordController,
            ),
            20.verticalSpace,
            AppButton(
              buttonLabel: "Next",
              isLoading: isLoading,
              onPressed: onPressed,
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }

  Text _pageDescription({required ThemeData theme, required String text}) {
    return Text(
      text,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      ),
    );
  }

  Text _pageTitle({required ThemeData theme, required String text}) {
    return Text(text, style: theme.textTheme.bodyLarge);
  }
}
