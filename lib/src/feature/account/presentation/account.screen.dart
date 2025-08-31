import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_list_tile_view.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/account/bloc/logout_bloc/log_out_bloc.dart';
import 'package:rider/src/feature/account/presentation/widgets/profile_card.widget.dart';
import 'package:rider/src/feature/account/presentation/widgets/profile_stats.widget.dart';

import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/common/widget/button_widget/app_icon_button.widget.dart';
import '../../../core/common/widget/version_view.widget.dart';
import '../../../core/config/app.dependency.dart';
import '../../auth/auth_app_entry_point.dart';
import '../../dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import '../bloc/delete_account/delete_account_bloc.dart';
import '../bloc/user_bloc/user_bloc.dart';

///
///  All data for Account setting Navigation are store in this class
/// ### please pass pathParameters as example shows
/// ### for individual Account Setting Data
/// ### ie:-> [vendorId]: [example_vendor_id]
///
class AccountSettingData {
  String settingTitle;
  String locationPath;

  ///
  /// # please pass pathParameters as example shows
  /// # for individual Account Setting Data
  ///
  Map pathParameters;
  bool constructor;

  AccountSettingData({
    required this.settingTitle,
    required this.locationPath,
    this.pathParameters = const {},
    this.constructor = false,
  });

  static final List<AccountSettingData> kAccountMenuItems = [
    AccountSettingData(
      settingTitle: "Dashboard",
      locationPath: AppRoutesNames.dashboardScreen,
    ),
    AccountSettingData(
      settingTitle: "Income",
      locationPath: AppRoutesNames.incomeHistoryScreen,
    ),
    AccountSettingData(
      settingTitle: "Delivery history",
      locationPath: AppRoutesNames.deliveryHistoryScreen,
    ),
    AccountSettingData(
      settingTitle: "Profile settings",
      locationPath: AppRoutesNames.profileSettingsScreen,
    ),
    AccountSettingData(
      settingTitle: "Announcements",
      locationPath: AppRoutesNames.announcementsScreen,
    ),
    AccountSettingData(
      settingTitle: "Documents",
      locationPath: AppRoutesNames.documentsScreen,
    ),
    AccountSettingData(
      settingTitle: "Vehicles",
      locationPath: AppRoutesNames.vehiclesScreen,
    ),
    AccountSettingData(
      settingTitle: "Payment settings",
      locationPath: AppRoutesNames.paymentMethodScreen,
    ),
    AccountSettingData(
      settingTitle: "Payment & Invoice",
      locationPath: AppRoutesNames.paymentAndInvoiceScreen,
    ),
    AccountSettingData(
      settingTitle: "App setting",
      locationPath: AppRoutesNames.appSettingScreen,
    ),
    AccountSettingData(
      settingTitle: "Change password",
      locationPath: AppRoutesNames.changePasswordScreen,
    ),

    /// TODO: Add help screen
    AccountSettingData(
      settingTitle: "Help",
      locationPath: AppRoutesNames.helpScreen,
    ),
    //
    // AccountSettingData(
    //   settingTitle: "FAQ",
    //   locationPath: 'faq',
    // ),

    // AccountSettingData(
    //   settingTitle: "Learning & Development",
    //   locationPath: "learning and development",
    // ),
    AccountSettingData(
      settingTitle: "Terms and condition",
      locationPath: AppRoutesNames.termsAndConditionsScreen,
    ),
    AccountSettingData(
      settingTitle: "Design & Development",
      locationPath: AppRoutesNames.designSystemScreen,
    ),
  ];
}

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<UserBloc>().add(UserDataFetchingEvent());
    context.read<OverAllReportBloc>().add(
      OverAllReportFetchEvent(
        startDate: DateTime.now().add(const Duration(days: -365)),
        endDate: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Account',
      actions: [_notificationWidget(context, theme)],
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(),
        child: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              children: [
                ProfileCard(width: width),
                ProfileStatsWidget(width: width),
                const _AccountNavViewWidget(),
                16.verticalSpace,
                _logOutWidget(theme),
                16.verticalSpace,
                _deleteAccount(theme),
                16.verticalSpace,
                const VersionBuildWidget(),
                60.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocProvider<LogOutBloc> _logOutWidget(ThemeData theme) {
    return BlocProvider(
      create: (context) => LogOutBloc(),
      child: Align(
        alignment: Alignment.center,
        child: BlocConsumer<LogOutBloc, LogOutState>(
          listener: (context, state) async {
            if (state is LogOutSuccess) {
              if (state.isLoggedOut) {
                AppToaster.success(
                  message: "Log out successfully",
                  context: context,
                );
                final authEntryPoint = getIt<AuthAppEntryPoint>();
                await authEntryPoint.appEntryPoint(
                  context: context,
                  userModel: null,
                );
              }
            } else if (state is LogOutFailure) {
              AppToaster.error(message: state.errorMassage, context: context);
            }
          },
          builder: (context, state) {
            return AppButton(
              buttonLabel: "Log out",
              backgroundColor: theme.colorScheme.error,
              onPressed: () {
                AppDialog.confirmationDialog(
                  title: "Are you sure you want to log out?",
                  yesButtonPressed: () {
                    context.read<LogOutBloc>().add(LogOutInitiateEvent());
                  },
                  noButtonPressed: () {
                    log(name: "LogOutScreen", "No button pressed");
                  },
                  context: context,
                );
              },
              // fixedSize: Size(284.r, 60.r),
            );
          },
        ),
      ),
    );
  }

  Widget _deleteAccount(ThemeData theme) {
    return BlocConsumer<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          if (state.isDeleted) {
            AppToaster.show(
              message: "Account deleted successfully",
              context: context,
            );

            /// TODO: Cancel all singing process then go to splash screen
            context.goNamed(AppRoutesNames.splashScreen);
          }
        } else if (state is DeleteAccountFailure) {
          AppToaster.show(message: state.errorMassage, context: context);
        }
      },
      builder: (context, state) {
        return AppButton(
          buttonLabel: "Delete account",
          isLoading: state is DeleteAccountLoading,
          onPressed: () {
            AppDialog.confirmationDialog(
              title: "Are you sure you want to delete your account?",
              content:
                  "This action will delete your account and all your data will be permanently deleted.",
              yesButtonPressed: () {
                context.read<DeleteAccountBloc>().add(
                  DeleteAccountInitiateEvent(),
                );
              },
              noButtonPressed: () {
                log(name: "LogOutScreen", "No button pressed");
              },
              context: context,
            );
          },
          visualDensity: VisualDensity.compact,
          textStyle: TextStyle(color: theme.colorScheme.error),
          size: ButtonSize.XL,
          variant: ButtonVariant.TRANSPARENT,
        );
      },
    );
  }

  AppIconButton _notificationWidget(BuildContext context, ThemeData theme) {
    return AppIconButton(
      onPressed: () {
        context.pushNamed(AppRoutesNames.notificationScreen);
      },
      icon: Icon(Icons.notifications, color: theme.colorScheme.primary),
      backgroundColor: Colors.transparent,
    );
  }
}

class _AccountNavViewWidget extends StatelessWidget {
  const _AccountNavViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final accountItemList = AccountSettingData.kAccountMenuItems;
        return AppListTileViewWidget(
          margin: EdgeInsets.symmetric(vertical: 6.r),
          onPressed: () {
            context.pushNamed(accountItemList.elementAt(index).locationPath);
          },
          title: accountItemList.elementAt(index).settingTitle,
        );
      },
      itemCount: AccountSettingData.kAccountMenuItems.length,
    );
  }
}
