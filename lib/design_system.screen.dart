import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_cached_network_image.widget.dart';
import 'package:rider/src/core/common/widget/app_drop_down_menu.widget.dart';
import 'package:rider/src/core/common/widget/app_image_picker.widget.dart';
import 'package:rider/src/core/common/widget/app_list_tile_view.widget.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/app_network_image.widget.dart';
import 'package:rider/src/core/common/widget/app_overlay_loading.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_searchable_drop_down_menu.widget.dart';
import 'package:rider/src/core/common/widget/app_text_field.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_animated_go_live_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/common/widget/change_theme_switch.widget.dart';
import 'package:rider/src/core/common/widget/income_overlay.widget.dart';
import 'package:rider/src/core/common/widget/job_details.widget.dart';
import 'package:rider/src/core/common/widget/job_listview.widget.dart';
import 'package:rider/src/core/common/widget/location_timeline.widget.dart';
import 'package:rider/src/core/common/widget/offline_bottom.widget.dart';
import 'package:rider/src/core/common/widget/payment_tag.widget.dart';
import 'package:rider/src/core/common/widget/version_view.widget.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/core/utils/distance_calculate.dart';
import 'package:rider/src/feature/auth/on_boarding/presentation/complete_onboarding.screen.dart';
import 'package:rider/src/feature/auth/on_boarding/presentation/onboarding.screen.dart';
import 'package:rider/src/feature/auth/sign_in/email/sign_in_with_email.screen.dart';
import 'package:rider/src/feature/auth/sign_up/presentation/sign_up.screen.dart';
import 'package:rider/src/feature/change_password/presentation/change_password.screen.dart';
import 'package:rider/src/feature/dashboard/presentation/dashboard.screen.dart';
import 'package:rider/src/feature/documents/presentation/documents.screen.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/presentation/delivery_history.screen.dart';
import 'package:rider/src/feature/income_and_delivery_history/income_history/income_history.screen.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/on_going_job_details.widget.dart';
import 'package:rider/src/feature/notification/presentation/notification.screen.dart';
import 'package:rider/src/feature/profile/presentation/profile_settings.screen.dart';
import 'package:rider/src/feature/vehicle_details/presentation/vehicle_details.screen.dart';

import 'src/core/constant/image_path.dart';
import 'src/feature/account/presentation/account.screen.dart';
import "src/feature/can't_find_customer/presentation/can't_find_customer.screen.dart";
import 'src/feature/jobs/presentation/jobs.screen.dart';

class DesignSystemScreen extends StatelessWidget {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Design System',
      body: AppRefreshIndicatorWidget(
        onRefresh:
            () async =>
                AppToaster.success(message: "Refreshed", context: context),
        isScrollNotificationNeeded: false,
        child: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Design System'),
                16.verticalSpace,
                const ChangeTheme(),
                16.verticalSpace,
                const Text("Jobs screen"),
                AppListTileViewWidget(
                  title: 'Jobs Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const JobsScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Vehicle details screen"),
                AppListTileViewWidget(
                  title: 'Vehicle details Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VehicleDetailsScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Can't find customer screen"),
                AppListTileViewWidget(
                  title: 'Can\'t find customer screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CantFindCustomerScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Documents screen"),
                AppListTileViewWidget(
                  title: 'Documents Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DocumentsScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Change password screen"),
                AppListTileViewWidget(
                  title: 'Change password Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Profile settings screen"),
                AppListTileViewWidget(
                  title: 'Profile settings Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfileSettingsScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text("Notification screen"),
                AppListTileViewWidget(
                  title: 'Notification Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text(" Income history screen"),
                AppListTileViewWidget(
                  title: 'Income history Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const IncomeHistoryScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text(" Delivery screen"),
                AppListTileViewWidget(
                  title: 'Delivery Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DeliveryHistoryScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text(" Dashboard screen"),
                AppListTileViewWidget(
                  title: 'Dashboard Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text(" profile screen"),
                AppListTileViewWidget(
                  title: 'Profile Screen',
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      ),
                ),
                16.verticalSpace,
                const Text('App Auth Screen'),
                AppListTileViewWidget(
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                  title: 'Sign-up screen',
                ),
                16.verticalSpace,
                AppListTileViewWidget(
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => const CompleteOnBoardingScreen(),
                        ),
                      ),
                  title: 'Complete Onboarding',
                ),
                16.verticalSpace,
                AppListTileViewWidget(
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingScreen(),
                        ),
                      ),
                  title: 'Onboarding screen',
                ),
                16.verticalSpace,
                AppListTileViewWidget(
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInWithEmailScreen(),
                        ),
                      ),
                  title: 'Sign in screen',
                ),
                16.verticalSpace,
                const Text('App Asset Image and logo'),
                AppAssetImageWidget(
                  imagePath: ImagePath.logo,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
                16.verticalSpace,
                const Text('App Image place holder'),
                AppCachedNetworkImage(imageURL: ""),
                16.verticalSpace,
                const VersionBuildWidget(),
                _DropdownMenu(),
                16.verticalSpace,
                const Text('Income overlay widget'),
                60.verticalSpace,
                IncomeOverLayWidget(
                  rating: "4.3",
                  todayIncome:
                      '${AppConstantVariable.defaultAppCurrencySymbol}400.00',
                  profileImageURL:
                      "https://avatars.githubusercontent.com/u/47666475",
                ),
                16.verticalSpace,
                const Text('Location Timeline'),
                8.verticalSpace,
                const LocationTimeLineWidget(),
                16.verticalSpace,
                const Text('Job Container'),
                16.verticalSpace,
                JobContainerWidget(
                  onPressed:
                      () => AppToaster.willImplementSoon(context: context),
                ),
                16.verticalSpace,
                const Text('Job Details Widget'),
                JobDetailsWidget(
                  hideButtonOnPressed: () {},
                  acceptButtonOnPressed: () {},
                  rejectButtonOnPressed: () {},
                ),
                16.verticalSpace,
                const Text("On Going Job Details Widget"),
                OnGoingJobDetailsWidget(elevation: 0, deliveryID: "123456789"),
                16.verticalSpace,
                const Text('Payment Tag'),
                const PaymentTagWidget(type: ParcelPaymentType.CASH),
                6.verticalSpace,
                const PaymentTagWidget(type: ParcelPaymentType.ONLINE),
                16.verticalSpace,
                const Text('Cached Network Image'),
                SizedBox(
                  height: 200.h,
                  width: 260.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstantVariable.kRadius.r,
                    ),
                    child: const AppCachedNetworkImage(
                      imageURL:
                          "https://avatars.githubusercontent.com/u/47666475",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                16.verticalSpace,
                const Text('Loading Skeleton'),
                AppLoadingSkeletonWidget(height: 24.h, width: width),
                16.verticalSpace,
                const Text('App Image '),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppConstantVariable.kRadius.r,
                  ),
                  child: AppNetworkImage(
                    imageUrl:
                        "https://avatars.githubusercontent.com/u/47666475",
                    fit: BoxFit.cover,
                    height: 218.h,
                    width: 380.w,
                  ),
                ),
                const Text('Image Picker'),
                6.verticalSpace,
                AppImagePickerWidget(
                  label: 'Upload your license',
                  description: 'Please upload your license',
                  existingImage:
                      "https://avatars.githubusercontent.com/u/47666475",
                  onPickImage: (pickedImagePath) {
                    log(
                      name: "Picked image path driving license",
                      "$pickedImagePath",
                    );
                  },
                ),
                16.verticalSpace,
                const Text("Alert Dialog"),
                _AlertDialogWidget(),
                const Text("Toaster Message"),
                _ToasterMessageDemo(),
                16.verticalSpace,
                SelectableText(
                  "Distance: ${calculateDistance(lat1: 23.8758547, lon1: 90.3795438, lat2: 23.8172373, lon2: 90.3704539)} km",
                ),
                16.verticalSpace,
                AppAnimatedGoLiveButton(
                  onPressed: () => log('Go live button pressed'),
                ),
                16.verticalSpace,
                OfflineBottomWidget(
                  goOfflineButtonPressed:
                      () => log('Go offline button pressed'),
                  refreshButtonPressed: () => log('Refresh button pressed'),
                  jobsButtonPressed: () => log('Jobs button pressed'),
                ),
                16.verticalSpace,
                const Text('Overlay Loading'),
                AppOverlayLoadingWidget(height: 200.h, width: 260.w),
                16.verticalSpace,
                _IconButton(),
                _IconLabelButton(),
                _LoadingButton(),
                _DefaultButtonDesign(),
                _TextField(),
                16.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenu extends StatefulWidget {
  const _DropdownMenu({super.key});

  @override
  State<_DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<_DropdownMenu> {
  String? selectedValueForDropdownMenu;
  String? selectedValueForSearchableDropdownMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        const Text('Dropdown menu'),
        AppDropDownMenuWidget(
          value: selectedValueForDropdownMenu,
          listOfDropDownMenuItems: [
            CommonDropDownMenuItemsModel(value: "1", items: "Item 1"),
            CommonDropDownMenuItemsModel(value: "2", items: "Item 2"),
            CommonDropDownMenuItemsModel(value: "3", items: "Item 3"),
            CommonDropDownMenuItemsModel(value: "4", items: "Item 4"),
          ],
          onChanged: (value) {
            log('Dropdown menu value changed to $value');
            setState(() => selectedValueForDropdownMenu = value);
          },
        ),
        16.verticalSpace,
        const Text('Dropdown Searchable menu'),
        AppSearchableDropDownWidget(
          selectedValue: selectedValueForSearchableDropdownMenu,
          listOfDropDownMenuItems: [
            CommonDropDownMenuItemsModel(value: "1", items: "Item 1"),
            CommonDropDownMenuItemsModel(value: "2", items: "Item 2"),
            CommonDropDownMenuItemsModel(value: "3", items: "Item 3"),
            CommonDropDownMenuItemsModel(value: "4", items: "Item 4"),
          ],
          onChanged: (value) {
            log('Dropdown menu value changed to $value');
            setState(() => selectedValueForSearchableDropdownMenu = value);
          },
        ),
      ],
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
          onPressed: () async {
            await AppDialog.confirmationDialog(
              context: context,
              noButtonPressed: () {
                log('No button pressed');
              },
              yesButtonPressed: () {
                log('Yes button pressed');
              },
            );
          },
          iconData: Icons.add_alert,
          topLabel: 'Confirm',
        ),
        16.horizontalSpace,
        AppIconButton(
          onPressed: () async {
            await AppDialog.confirmationDialog(
              context: context,
              title: "Are you sure you want to cancel?",
              content: 'Note: You will not be paid for rejected orders',
              noButtonPressed: () {
                log('No button pressed');
              },
              yesButtonPressed: () {
                log('Yes button pressed');
              },
            );
          },
          iconData: Icons.add_alert,
          topLabel: 'with note',
        ),
        16.horizontalSpace,
        AppIconButton(
          onPressed: () async {
            // await AppDialog.successDialog(context: context, amount: 140);
          },
          iconData: Icons.add_alert,
          topLabel: 'Success',
        ),
      ],
    );
  }
}

class _ToasterMessageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.horizontalSpace,
          AppIconButton(
            onPressed: () {
              AppToaster.success(message: "Success", context: context);
            },
            iconData: Icons.check,
            backgroundColor: Colors.green,
            bottomLabel: 'Success',
            fontSize: 12.r,
            iconSize: 26.r,
            padding: EdgeInsets.symmetric(horizontal: 16.r),
          ),
          AppIconButton(
            onPressed: () {
              AppToaster.error(message: "Error", context: context);
            },
            iconData: Icons.close,
            backgroundColor: Colors.red,
            bottomLabel: 'Error',
            fontSize: 12.r,
            iconSize: 26.r,
            padding: EdgeInsets.symmetric(horizontal: 16.r),
          ),
          AppIconButton(
            onPressed: () {
              AppToaster.willImplementSoon(context: context);
            },
            iconData: Icons.construction,
            backgroundColor: Colors.blue,
            bottomLabel: 'Soon',
            fontSize: 12.r,
            iconSize: 26.r,
            padding: EdgeInsets.symmetric(horizontal: 16.r),
          ),
          20.horizontalSpace,
        ],
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        16.verticalSpace,
        const Text("Text Field"),
        const AppTextField(title: 'Name'),
        16.verticalSpace,
        const Text("Text Form Field"),
        const AppTextFormField(title: 'Email'),
        16.verticalSpace,
        const Text("Text Form for password"),
        AppTextFormField(
          title: 'Password',
          hintText: 'Enter your password',
          obscureText: _isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          suffixIcon: InkWell(
            onTap: () {
              setState(() => _isPasswordVisible = !_isPasswordVisible);
            },
            child: Icon(
              _isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
        16.verticalSpace,
        const Text("Customer notes"),
        AppTextField(
          title: 'Customer notes',
          hintText: 'Enter your customer notes',
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          borderSide: BorderSide(
            color: theme.colorScheme.onSurface.withOpacity(0.4.r),
            width: 2.r,
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        const Text("Icon button"),
        AppIconButton(onPressed: () => log('Icon button pressed')),
        16.verticalSpace,
        const Text("Icon with label button"),
        AppIconButton(
          onPressed: () => log('Icon with top label button pressed'),
          topLabel: 'Close',
        ),
        AppIconButton(
          onPressed: () => log('Icon with bottom label button pressed'),
          bottomLabel: 'Close ',
          padding: EdgeInsets.symmetric(horizontal: 10.r),
        ),
      ],
    );
  }
}

class _IconLabelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return Column(
      children: [
        16.verticalSpace,
        const Text('Leading Icon text Button'),
        AppButton(
          onPressed: () => log('Leading Icon text Button pressed'),
          buttonLabel: 'Apple',
          leading: Icon(Icons.apple, color: theme.colorScheme.surface),
        ),
        16.verticalSpace,
        const Text('Trailing Icon text Button'),
        AppButton(
          onPressed: () => log('Trailing Icon text Button pressed'),
          buttonLabel: 'Apple',
          trailing: Icon(Icons.apple, color: theme.colorScheme.surface),
        ),
        16.verticalSpace,
        const Text('Trailing Icon text Button'),
        AppButton(
          onPressed: () => log('Trailing Icon text Button pressed'),
          buttonLabel: 'Arrow',

          /// Give space how much you want to give to the trailing icon
          spacing: width - 160.r,
          trailing: Icon(Icons.arrow_forward, color: theme.colorScheme.surface),
        ),
      ],
    );
  }
}

class _LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        const Text('Loading Button'),
        AppButton(
          onPressed: () => log('Loading Button pressed'),
          buttonLabel: 'Loading Button',
          isLoading: true,
          // enabling this button for testing purpose
          // isEnabled: false,
        ),
      ],
    );
  }
}

class _DefaultButtonDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        16.verticalSpace,
        const Text('Default Button'),
        AppButton(
          onPressed: () {
            log('default Button pressed');
          },
          buttonLabel: 'Button',
        ),
        16.verticalSpace,
        const Text('Filled Button'),
        AppButton(
          onPressed: () {
            log(' filled Button pressed');
          },
          buttonLabel: 'Button',
          variant: ButtonVariant.FILLED,
        ),
        16.verticalSpace,
        const Text('Light Button'),
        AppButton(
          onPressed: () {
            log('light Button pressed');
          },
          buttonLabel: 'Button',
          variant: ButtonVariant.LIGHT,
        ),
        16.verticalSpace,
        const Text('Outlined Button'),
        AppButton(
          onPressed: () {
            log('outlined Button pressed');
          },
          buttonLabel: 'Button',
          variant: ButtonVariant.OUTLINED,
        ),
        16.verticalSpace,
        const Text('Subtle Button'),
        AppButton(
          onPressed: () {
            log('subtle Button pressed');
          },
          buttonLabel: 'Button',
          variant: ButtonVariant.SUBTLE,
        ),
        16.verticalSpace,
        const Text('Transparent Button'),
        AppButton(
          onPressed: () {
            log('transparent Button pressed');
          },
          buttonLabel: 'Button',
          variant: ButtonVariant.TRANSPARENT,
        ),
      ],
    );
  }
}
