import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../../core/common/app_enum.dart';
import '../../core/config/app.routes.dart';
import '../../core/utils/app_user_role_guard.dart';
import '../../model/user.model.dart';

class AuthAppEntryPoint {
  Future<void> appEntryPoint({
    required BuildContext context,
    required UserModel? userModel,
  }) async {
    // if (!context.mounted) return;

    try {
      // Check location service availability
      final locationCheck = await _checkLocationService(context);
      if (!context.mounted || !locationCheck.shouldContinue) return;

      // Check user role
      final roleCheck = await _checkUserRole(context);
      if (!context.mounted || !roleCheck.shouldContinue) return;

      // Check authentication
      final authCheck = _checkAuthentication(context, userModel);
      if (!authCheck.shouldContinue) return;

      // Check account status
      final accountCheck = _checkAccountStatus(context, userModel!);
      if (!accountCheck.shouldContinue) return;

      // Check profile completion steps
      final completionCheck = _checkProfileCompletion(context, userModel);
      if (!completionCheck.shouldContinue) return;

      // Check approval status
      final approvalCheck = _checkApprovalStatus(context, userModel);
      if (!approvalCheck.shouldContinue) return;

      // All checks passed - navigate to dashboard
      if (context.mounted) {
        context.goNamed(AppRoutesNames.homeScreen);
      }
    } catch (e) {
      // Handle any unexpected errors
      if (context.mounted) {
        AppToaster.error(
          message: "An error occurred during authentication",
          context: context,
        );
        context.goNamed(AppRoutesNames.onBoardingScreen);
      }
    }
  }

  static Future<NavigationResult> _checkLocationService(
    BuildContext context,
  ) async {
    log("START--> Checking location service ------------------------");
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      if (context.mounted) {
        log("Processed--> Checking location service ----------------------");
        context.pushNamed(AppRoutesNames.locationOnBoardingScreen);
      }
      log("END--> Checking location service ----------------------");
      return NavigationResult.stop();
    }

    return NavigationResult.proceed();
  }

  static Future<NavigationResult> _checkUserRole(BuildContext context) async {
    log("START--> Checking user role ---------------------------");

    final isRider = await AppUserRoleGuard().isRider();

    if (!isRider) {
      if (context.mounted) {
        log("Processed--> Checking user role ----------------------");
        context.goNamed(AppRoutesNames.onBoardingScreen);
      }
      return NavigationResult.stop();
    }
    log("END--> Checking user role ----------------------");
    return NavigationResult.proceed();
  }

  static NavigationResult _checkAuthentication(
    BuildContext context,
    UserModel? userModel,
  ) {
    log("START--> Checking Authentication ---------------------------");

    if (userModel == null) {
      if (context.mounted) {
        log("Processed--> Checking Authentication ----------------------");
        context.goNamed(AppRoutesNames.onBoardingScreen);
      }
      return NavigationResult.stop();
    }
    log("END--> Checking Authentication ----------------------");
    return NavigationResult.proceed();
  }

  static NavigationResult _checkAccountStatus(
    BuildContext context,
    UserModel userModel,
  ) {
    log("START--> Checking account status ---------------------------");
    final isActive = userModel.accountStatus == UserAccountStatus.ACTIVE;

    if (!isActive) {
      if (context.mounted) {
        log("Processed--> Checking account status ----------------------");
        context.goNamed(AppRoutesNames.onboardingStatusScreen);
        AppToaster.error(
          message: "Your account is not active",
          context: context,
        );
      }
      return NavigationResult.stop();
    }
    log("END--> Checking account status ----------------------");
    return NavigationResult.proceed();
  }

  static NavigationResult _checkApprovalStatus(
    BuildContext context,
    UserModel userModel,
  ) {
    log("START--> Checking approval status ---------------------------");
    final isApproved = userModel.approvalStatus == UserApprovalStatus.APPROVED;

    if (!isApproved) {
      if (context.mounted) {
        log("Processed--> Checking approval status ----------------------");

        context.goNamed(AppRoutesNames.onboardingStatusScreen);
      }
      return NavigationResult.stop();
    }
    log("END--> Checking approval status ----------------------");
    return NavigationResult.proceed();
  }

  static NavigationResult _checkProfileCompletion(
    BuildContext context,
    UserModel userModel,
  ) {
    log("START--> Checking profile completion ---------------------------");
    final completionSteps =
        userModel.profileCompletionSteps ?? <UserProfileCompletionStep>[];

    // Define required steps in order of completion
    final requiredSteps = [
      (
        UserProfileCompletionStep.DOCUMENTS,
        AppRoutesNames.onboardingDocumentsScreen,
      ),
      (
        UserProfileCompletionStep.VEHICLE,
        AppRoutesNames.onboardingVehicleDetailsScreen,
      ),
      (
        UserProfileCompletionStep.PAYMENT,
        AppRoutesNames.onboardingPaymentMethodScreen,
      ),
      (
        UserProfileCompletionStep.DETAILS,
        AppRoutesNames.onboardingProfileImageScreen,
      ),
    ];

    for (final (step, route) in requiredSteps) {
      if (!completionSteps.contains(step)) {
        if (context.mounted) {
          log(
            "Processed--> Checking profile completion ----------------------",
          );
          context.goNamed(route);
        }
        return NavigationResult.stop();
      }
    }
    log("END--> Checking profile completion ----------------------");
    return NavigationResult.proceed();
  }
}

// Helper class to make the flow control more explicit
class NavigationResult {
  final bool shouldContinue;

  const NavigationResult._(this.shouldContinue);

  factory NavigationResult.proceed() => const NavigationResult._(true);

  factory NavigationResult.stop() => const NavigationResult._(false);
}
