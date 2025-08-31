import 'dart:developer';
import 'dart:io';

import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/common/widget/app_overlay_loading.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';

// class DisableBatteryOptimizationScreen extends StatelessWidget {
//   const DisableBatteryOptimizationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       title: "System settings requriements",
//       body: Column(
//         children: const [
//           Text("Battery optimization"),
//         ],
//       ),
//     );
//   }
// }

class DisableBatteryOptimizationScreen extends StatefulWidget {
  const DisableBatteryOptimizationScreen({super.key});

  @override
  _DisableBatteryOptimizationScreenState createState() =>
      _DisableBatteryOptimizationScreenState();
}

class _DisableBatteryOptimizationScreenState
    extends State<DisableBatteryOptimizationScreen> {
  bool loading = false;
  bool? isAutoStartEnabled;
  bool? isBatteryOptimizationDisabled;
  bool? isManufacturerBatteryOptimizationDisabled;
  bool? isAllBatteryOptimizationDisabled;

  // Track the current step
  int currentStep = 0;
  final int totalSteps = 3;

  // Add messages for each step
  final List<String> stepMessages = [
    "Enabling Auto Start...",
    "Disabling Battery Optimization...",
    "Disabling Manufacturer Optimization...",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkAllPermissions();
    });
    super.initState();
  }

  // First check all permissions to determine which steps are needed
  Future<void> _checkAllPermissions() async {
    setState(() => loading = true);

    /// If running on iOS, we can skip the battery optimization check
    if (Platform.isIOS) _handleDone();

    try {
      isAutoStartEnabled = await DisableBatteryOptimization.isAutoStartEnabled;
      isBatteryOptimizationDisabled =
          await DisableBatteryOptimization.isBatteryOptimizationDisabled;
      isManufacturerBatteryOptimizationDisabled =
          await DisableBatteryOptimization
              .isManufacturerBatteryOptimizationDisabled;
      isAllBatteryOptimizationDisabled =
          await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;

      // Determine which step to start from
      if (isAutoStartEnabled != true) {
        currentStep = 0;
      } else if (isBatteryOptimizationDisabled != true) {
        currentStep = 1;
      } else if (isManufacturerBatteryOptimizationDisabled != true) {
        currentStep = 2;
      }

      // Only proceed if not all optimizations are disabled
      if (isAllBatteryOptimizationDisabled != true) {
        proceedToNextStep();
      } else {
        if (isAllBatteryOptimizationDisabled == true) _handleDone();
      }
    } catch (e) {
      log("Error checking permissions: ${e.toString()}");
    } finally {
      setState(() => loading = false);
    }
  }

  // Handle one step at a time
  Future<void> proceedToNextStep() async {
    setState(() => loading = true);

    try {
      switch (currentStep) {
        case 0: // Auto Start
          await _handleAutoStart();
          break;
        case 1: // Battery Optimization
          await _handleBatteryOptimization();
          break;
        case 2: // Manufacturer Optimization
          await _handleManufacturerOptimization();
          break;
      }
    } catch (e) {
      log("Error in step ${currentStep}: ${e.toString()}");
    } finally {
      setState(() => loading = false);
    }
  }

  Future<void> _handleAutoStart() async {
    isAutoStartEnabled = await DisableBatteryOptimization.isAutoStartEnabled;

    if (isAutoStartEnabled != true) {
      await DisableBatteryOptimization.showEnableAutoStartSettings(
        "Enable Auto Start",
        "Follow the steps to enable auto start for this app",
      );

      // Wait for user to come back from settings
      await Future.delayed(const Duration(seconds: 1));

      // Check status again
      isAutoStartEnabled = await DisableBatteryOptimization.isAutoStartEnabled;
      setState(() {});

      if (isAutoStartEnabled == true) {
        // Move to next step
        setState(() => currentStep = 1);
        proceedToNextStep();
      }
    } else {
      // Already enabled, move to next step
      setState(() => currentStep = 1);
      proceedToNextStep();
    }
  }

  Future<void> _handleBatteryOptimization() async {
    isBatteryOptimizationDisabled =
        await DisableBatteryOptimization.isBatteryOptimizationDisabled;

    if (isBatteryOptimizationDisabled != true) {
      await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();

      // Wait for user to come back from settings
      await Future.delayed(const Duration(seconds: 1));

      // Check status again
      isBatteryOptimizationDisabled =
          await DisableBatteryOptimization.isBatteryOptimizationDisabled;
      setState(() {});

      if (isBatteryOptimizationDisabled == true) {
        // Move to next step
        setState(() => currentStep = 2);
        proceedToNextStep();
      }
    } else {
      // Already disabled, move to next step
      setState(() => currentStep = 2);
      proceedToNextStep();
    }
  }

  Future<void> _handleManufacturerOptimization() async {
    isManufacturerBatteryOptimizationDisabled =
        await DisableBatteryOptimization
            .isManufacturerBatteryOptimizationDisabled;

    if (isManufacturerBatteryOptimizationDisabled != true) {
      await DisableBatteryOptimization.showDisableManufacturerBatteryOptimizationSettings(
        "Manufacturer Battery Optimization",
        "Follow the steps to disable manufacturer-specific restrictions",
      );

      // Wait for user to come back from settings
      await Future.delayed(const Duration(seconds: 1));

      // Check status again
      isManufacturerBatteryOptimizationDisabled =
          await DisableBatteryOptimization
              .isManufacturerBatteryOptimizationDisabled;
      setState(() {});
    }

    // Final check
    isAllBatteryOptimizationDisabled =
        await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;
    setState(() {});

    if (isAllBatteryOptimizationDisabled == true) _handleDone();
  }

  /// Navigate to the Screen after the battery optimization is done
  _handleDone() {
    log("✅ All battery optimizations are disabled.");
    context.pushNamed(AppRoutesNames.dashboardScreen);
  }

  Widget _buildStatusTile({
    required String title,
    required bool? status,
    required ThemeData theme,
  }) {
    return ListTile(
      leading: Icon(
        status == true ? Icons.check_circle : Icons.error,
        color: status == true ? Colors.green : theme.colorScheme.error,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Text(
        status == true ? "Done" : "Pending",
        style: theme.textTheme.bodySmall?.copyWith(
          color: status == true ? Colors.green : theme.colorScheme.error,
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(ThemeData theme) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: currentStep / totalSteps,
          backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.2),
          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
        ),
        10.verticalSpace,
        Text(
          "Step ${currentStep + 1} of $totalSteps: ${stepMessages[currentStep]}",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: SizedBox(
              height: height * 0.9,
              width: width,
              child: Column(
                spacing: 16.h,
                children: [
                  80.verticalSpace,
                  Icon(
                    Icons.battery_alert_outlined,
                    size: 100.r,
                    color: theme.colorScheme.primary,
                  ),
                  4.verticalSpace,
                  Text(
                    "Battery Optimization",
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    "To ensure the app works properly in background (like Live order notifications, etc.), please disable all battery optimizations.",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  4.verticalSpace,

                  /// Show progress when in-process
                  isAllBatteryOptimizationDisabled != true && loading
                      ? _buildProgressIndicator(theme)
                      : const SizedBox(),
                  4.verticalSpace,
                  _buildStatusTile(
                    title: "Auto Start Enabled",
                    status: isAutoStartEnabled,
                    theme: theme,
                  ),
                  _buildStatusTile(
                    title: "Battery Optimization Disabled",
                    status: isBatteryOptimizationDisabled,
                    theme: theme,
                  ),
                  _buildStatusTile(
                    title: "Manufacturer Optimization Disabled",
                    status: isManufacturerBatteryOptimizationDisabled,
                    theme: theme,
                  ),
                  const Divider(),
                  _buildStatusTile(
                    title: "All Optimizations Disabled",
                    status: isAllBatteryOptimizationDisabled,
                    theme: theme,
                  ),
                  4.verticalSpace,
                  isAllBatteryOptimizationDisabled == true
                      ? AppButton(
                        onPressed: () async {
                          isAllBatteryOptimizationDisabled =
                              await DisableBatteryOptimization
                                  .isAllBatteryOptimizationDisabled;
                          if (isAllBatteryOptimizationDisabled ?? false) {
                            _handleDone();
                          }
                        },
                        buttonLabel: "Continue",
                        leading: Icon(
                          Icons.check,
                          color: theme.colorScheme.onSurface,
                        ),
                      )
                      : AppButton(
                        onPressed:
                            isAllBatteryOptimizationDisabled != true
                                ? proceedToNextStep
                                : _checkAllPermissions,
                        isLoading: loading,
                        buttonLabel:
                            isAllBatteryOptimizationDisabled != true
                                ? "Continue Setup"
                                : "Recheck Status",
                        // sizeOff: true,
                        leading:
                            loading
                                ? const SizedBox.shrink()
                                : Icon(
                                  isAllBatteryOptimizationDisabled != true
                                      ? Icons.arrow_forward
                                      : Icons.refresh,
                                  color: theme.colorScheme.onPrimary,
                                ),
                      ),
                ],
              ),
            ),
          ),
          loading
              ? AppOverlayLoadingWidget(height: height, width: width)
              : const SizedBox(),
        ],
      ),
    );
  }
}
