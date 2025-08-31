import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/utils/app_custom_transition.dart';
import 'package:rider/src/feature/account/presentation/account.screen.dart';
import 'package:rider/src/feature/accounts.routes.dart';
import 'package:rider/src/feature/app_error.screen.dart';
import 'package:rider/src/feature/auth/auth.routes.dart';
import 'package:rider/src/feature/battery_optimization/battery_optimization.screen.dart';
import 'package:rider/src/feature/dashboard/presentation/dashboard.screen.dart';
import 'package:rider/src/feature/home/presentation/home.screen.dart';
import 'package:rider/src/feature/income_and_delivery_history/income_history/today_income_history.screen.dart';
import 'package:rider/src/feature/jobs/presentation/jobs.screen.dart';
import 'package:rider/src/feature/splash/location_on_boarding.screen.dart';
import 'package:rider/src/feature/splash/splash.screen.dart';

import '../../../design_system.screen.dart';
import "../../feature/can't_find_customer/presentation/can't_find_customer.screen.dart";

class AppRoutesNames {
  static const String splashScreen = "/splash_screen";

  // static const String testingScreen = "/testing_screen";

  /// Location on boarding screen ---------------------------------------------
  static const String locationOnBoardingScreen = "/location_on_boarding_screen";

  /// Design system screen ----------------------------------------------------
  static const String designSystemScreen = "/design_system_screen";

  /// End of design system screen ----------------------------------------------
  ///
  /// Disable battery optimization screen -------------------------------------
  static const String disableBatteryOptimizationScreen =
      "/disable_battery_optimization_screen";

  /// End of disable battery optimization screen ------------------------------

  /// Auth screens routes ------------------------------------------------------
  static const String signUpScreen = "/sign_up_screen";
  static const String signInWithEmailScreen = "/sign_in_screen";
  static const String signInWithPhoneNumberScreen =
      "/sign_in_with_phone_number_screen";
  static const String verifyPhoneNumberScreen = "/verify_phone_number_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String forgotPasswordVerifyOtpScreen =
      "/forgot_password_verify_otp_screen";

  /// Onboarding screens routes ------------------------------------------------
  static const String completeOnBoardingScreen = "/complete_onboarding_screen";
  static const String onBoardingScreen = "/onboarding_screen";
  static const String onboardingVehicleDetailsScreen =
      "/onboarding_vehicle_details_screen";
  static const String onboardingDocumentsScreen =
      "/onboarding_documents_screen";
  static const String onboardingPaymentMethodScreen =
      "/onboarding_payment_method_screen";
  static const String onboardingStatusScreen = "/onboarding_status_screen";
  static const String onboardingProfileImageScreen =
      "/onboarding_profile_image";

  /// End of auth screens routes -----------------------------------------------

  /// Terms and conditions screen ----------------------------------------------
  static const String termsAndConditionsScreen = "/terms_and_conditions_screen";

  /// End of terms and conditions screen ----------------------------------------
  ///
  /// Dashboard screen --------------------------------------------------------
  static const String dashboardScreen = "/dashboard_screen";

  /// End of dashboard screen --------------------------------------------------
  ///
  /// HomeScreen screen --------------------------------------------------------
  static const String homeScreen = "/home_screen";
  static const String jobsScreen = "/jobs_screen";
  static const String accountScreen = "/account_screen";

  /// End of homeScreen screen ------------------------------------------------
  ///
  /// Income and delivery history screen ----------------------------------------
  static const String incomeHistoryScreen = "/income_history_screen";
  static const String todayIncomeHistoryScreen = "/today_income_history_screen";
  static const String deliveryHistoryScreen = "/delivery_history_screen";

  /// End of income and delivery history screen ---------------------------------
  /// Profile Settings screen ----------------------------------------------------
  static const String profileSettingsScreen = "/profile_settings_screen";

  /// Notification screen -------------------------------------------------------
  static const String notificationScreen = "/notification_screen";

  /// Announcements screen ----------------------------------------------------
  static const String announcementsScreen = "/announcements_screen";

  /// Documents screen --------------------------------------------------------
  static const String documentsScreen = "/documents_screen";

  /// Vehicles screen ---------------------------------------------------------
  static const String vehiclesScreen = "/vehicles_screen";

  /// Change password screen ---------------------------------------------------
  static const String changePasswordScreen = "/change_password_screen";

  /// App setting screen -------------------------------------------------------
  static const String appSettingScreen = "/app_setting_screen";

  /// Help screen -------------------------------------------------------------
  static const String helpScreen = "/help_screen";

  /// Support Center screen ---------------------------------------------------
  static const String supportCenterScreen = "/support_center_screen";

  /// Support Center chat screen ---------------------------------------------
  static const String supportCenterChatScreen = "/support_center_chat_screen";

  /// Payment and invoice screen -----------------------------------------------
  static const String paymentAndInvoiceScreen = "/payment_and_invoice_screen";

  static const String paymentAndInvoiceDetailsScreen =
      "/payment_and_invoice_details_screen";

  ///
  /// Payment Method screen --------------------------------------------------
  static const String paymentMethodScreen = "/payment_method_screen";

  static const String cantFindCustomerScreen = "/cant_find_customer_screen";
}

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutesConfiguration {
  static final appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutesNames.splashScreen,
    routes: [
      // GoRoute(
      //   name: AppRoutesNames.testingScreen,
      //   path: AppRoutesNames.testingScreen,
      //   builder: (context, state) => const TestingScreen(),
      // ),

      /// Splash screen --------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.splashScreen,
        path: AppRoutesNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      /// End of splash screen --------------------------------------------------
      ///
      /// Location on boarding screen -------------------------------------------
      GoRoute(
        name: AppRoutesNames.locationOnBoardingScreen,
        path: AppRoutesNames.locationOnBoardingScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const LocationOnBoardingScreen(),
            ),
      ),

      /// End of location on boarding screen -----------------------------------

      /// Auth screens ---------------------------------------------------------
      AuthRoutes.authRoutes,

      /// End of auth screens --------------------------------------------------
      ///
      /// Design system screen -------------------------------------------------
      GoRoute(
        name: AppRoutesNames.designSystemScreen,
        path: AppRoutesNames.designSystemScreen,
        builder: (context, state) => const DesignSystemScreen(),
      ),

      /// End of design system screen ------------------------------------------
      ///
      /// Disable battery optimization screen ----------------------------------
      GoRoute(
        name: AppRoutesNames.disableBatteryOptimizationScreen,
        path: AppRoutesNames.disableBatteryOptimizationScreen,
        builder: (context, state) => const DisableBatteryOptimizationScreen(),
      ),

      /// End of disable battery optimization screen ---------------------------
      ///

      /// Dashboard screen -----------------------------------------------------
      GoRoute(
        name: AppRoutesNames.dashboardScreen,
        path: AppRoutesNames.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),

      /// End of dashboard screen -----------------------------------------------
      ///
      /// HomeScreen screen -----------------------------------------------------
      GoRoute(
        name: AppRoutesNames.homeScreen,
        path: AppRoutesNames.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      ///
      /// End of homeScreen screen ----------------------------------------------
      ///
      /// Jobs screen -----------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.jobsScreen,
        path: AppRoutesNames.jobsScreen,
        // builder: (context, state) => const JobsScreen(),
        pageBuilder:
            (context, state) =>
                AppCustomTransition.slideFromBottom(child: const JobsScreen()),
      ),

      /// End of jobs screen ----------------------------------------------------
      ///
      /// Profile screen --------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.accountScreen,
        path: AppRoutesNames.accountScreen,
        pageBuilder:
            (context, state) =>
                AppCustomTransition.slideFromLeft(child: const AccountScreen()),
      ),

      /// End of profile screen -------------------------------------------------
      ///
      /// Accounts routes -------------------------------------------------------
      AccountsRoutes.accountsRoutes,

      /// End of accounts routes ------------------------------------------------
      ///
      /// Today income history screen -------------------------------------------
      GoRoute(
        name: AppRoutesNames.todayIncomeHistoryScreen,
        path: AppRoutesNames.todayIncomeHistoryScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromBottom(
              child: const TodayIncomeHistoryScreen(),
            ),
      ),

      /// End of today income history screen -----------------------------------
      ///
      ///
      /// Can't find customer screen -------------------------------------------
      GoRoute(
        name: AppRoutesNames.cantFindCustomerScreen,
        path: "${AppRoutesNames.cantFindCustomerScreen}/:deliveryID",
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromBottom(
              child: CantFindCustomerScreen(
                deliveryID: state.pathParameters['deliveryID'],
              ),
            ),
      ),
    ],
    errorBuilder: (context, state) => AppErrorScreen(state: state),
    redirect: (context, state) {
      log(state.uri.path, name: 'router path-->>');
      if (state.uri.hasQuery) {
        log(state.uri.query, name: 'router query-->>');
      }

      return null;
    },
  );
}

class AppCustomerPageRoute extends CustomTransitionPage {
  const AppCustomerPageRoute({
    required super.child,
    required super.transitionsBuilder,
  });
}
