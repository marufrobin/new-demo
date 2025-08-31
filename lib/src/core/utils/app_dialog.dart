import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';

import '../constant/constant_variable.dart';

class AppDialog {
  ///
  /// Show a dialog with two buttons
  /// The first button is for yes and the second button is for no
  /// for no button, the dialog will be dismissed when the user taps the no button
  /// The dialog will be dismissed when the user taps the no button
  static Future<void> confirmationDialog({
    String title = "Are you sure you want to go offline?",
    String? content,
    required VoidCallback yesButtonPressed,
    required VoidCallback noButtonPressed,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
          title: Text(title, textAlign: TextAlign.center),
          titleTextStyle: theme.textTheme.titleLarge,
          content:
              content == null
                  ? const SizedBox.shrink()
                  : Text(
                    content,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            Column(
              spacing: 8.r,
              children: [
                AppButton(
                  buttonLabel: 'Yes',
                  onPressed: yesButtonPressed,
                  backgroundColor: Colors.green,
                  size: ButtonSize.XL,
                  // fixedSize: Size(124.r, 40.r),
                ),
                AppButton(
                  buttonLabel: 'No',
                  onPressed: () {
                    noButtonPressed();
                    Navigator.of(context).pop();
                  },
                  backgroundColor: Colors.transparent,
                  labelColor: theme.colorScheme.onSurface,
                  variant: ButtonVariant.SUBTLE,
                  size: ButtonSize.LG,
                  // fixedSize: Size(124.r, 40.r),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  /// Success dialog
  /// this dialog for showing the user the amount of money they have earned
  static Future<void> successDialog({
    String title = "Well done!",
    String content = "You have earned",
    required double amount,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    late ConfettiController confettiController;
    confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // Start confetti when dialog opens
        Future.delayed(Duration.zero, () {
          confettiController.play();
        });
        Future.delayed(const Duration(seconds: 5), () {
          context.mounted ? Navigator.of(context).pop() : null;
        });

        /// A custom Path to paint stars.
        Path drawStar(Size size) {
          // Method to convert degrees to radians
          double degToRad(double deg) => deg * (pi / 180.0);

          const numberOfPoints = 5;
          final halfWidth = size.width / 2;
          final externalRadius = halfWidth;
          final internalRadius = halfWidth / 2.5;
          final degreesPerStep = degToRad(360 / numberOfPoints);
          final halfDegreesPerStep = degreesPerStep / 2;
          final path = Path();
          final fullAngle = degToRad(360);
          path.moveTo(size.width, halfWidth);

          for (double step = 0; step < fullAngle; step += degreesPerStep) {
            path.lineTo(
              halfWidth + externalRadius * cos(step),
              halfWidth + externalRadius * sin(step),
            );
            path.lineTo(
              halfWidth + internalRadius * cos(step + halfDegreesPerStep),
              halfWidth + internalRadius * sin(step + halfDegreesPerStep),
            );
          }
          path.close();
          return path;
        }

        return Stack(
          children: [
            SimpleDialog(
              children: [
                Container(
                  height: 156.h,
                  width: 280.w,
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6.r,
                    children: [
                      2.verticalSpace,
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.green,
                          fontSize: 20.sp,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        content,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
                          moneyAmount: amount,
                        ),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Confetti positioned over the dialog
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.5,
              // child: CompleteDeliveryWidget(),
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirection: 1.57,
                particleDrag: 0.05,
                emissionFrequency: 0.1,
                numberOfParticles: 10,
                blastDirectionality: BlastDirectionality.explosive,
                gravity: 0.1,
                shouldLoop: false,
                displayTarget: true,
                colors: const [
                  Colors.green,
                  Colors.lightGreen,
                  Colors.teal,
                  Colors.cyan,
                ],
                createParticlePath: drawStar,
              ),
            ),
          ],
        );
      },
    ).whenComplete(() {
      // Clean up controller when dialog is dismissed
      confettiController.dispose();
    });
  }
}

//
// class CompleteDeliveryWidget extends StatefulWidget {
//   const CompleteDeliveryWidget({super.key});
//
//   @override
//   State<CompleteDeliveryWidget> createState() => _CompleteDeliveryWidgetState();
// }
//
// class _CompleteDeliveryWidgetState extends State<CompleteDeliveryWidget> {
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(
//       duration: const Duration(seconds: 3),
//     );
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   /// A custom Path to paint stars.
//   Path drawStar(Size size) {
//     // Method to convert degrees to radians
//     double degToRad(double deg) => deg * (pi / 180.0);
//
//     const numberOfPoints = 5;
//     final halfWidth = size.width / 2;
//     final externalRadius = halfWidth;
//     final internalRadius = halfWidth / 2.5;
//     final degreesPerStep = degToRad(360 / numberOfPoints);
//     final halfDegreesPerStep = degreesPerStep / 2;
//     final path = Path();
//     final fullAngle = degToRad(360);
//     path.moveTo(size.width, halfWidth);
//
//     for (double step = 0; step < fullAngle; step += degreesPerStep) {
//       path.lineTo(
//         halfWidth + externalRadius * cos(step),
//         halfWidth + externalRadius * sin(step),
//       );
//       path.lineTo(
//         halfWidth + internalRadius * cos(step + halfDegreesPerStep),
//         halfWidth + internalRadius * sin(step + halfDegreesPerStep),
//       );
//     }
//     path.close();
//     return path;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 260.h,
//       child: Stack(
//         children: [
//           ArriveDropOffBody(
//             child: AppButton(
//               buttonLabel: "Complete delivery",
//               onPressed: () {
//                 // Handle submit
//                 print('Complete delivery');
//                 _showSuccessDialogWithConfetti(context);
//               },
//             ),
//           ),
//           // Confetti widget positioned at the top center
//           Align(
//             alignment: Alignment.topCenter,
//             child: ConfettiWidget(
//               confettiController: _confettiController,
//               blastDirection: 1.57,
//               // radians (90 degrees downward)
//               particleDrag: 0.05,
//               emissionFrequency: 0.05,
//               numberOfParticles: 50,
//               gravity: 0.05,
//               shouldLoop: false,
//               colors: const [
//                 Colors.green,
//                 Colors.blue,
//                 Colors.pink,
//                 Colors.orange,
//                 Colors.purple,
//               ],
//               createParticlePath: drawStar,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showSuccessDialogWithConfetti(BuildContext context) {
//     // Start confetti animation
//     _confettiController.play();
//
//     // Show the success dialog
//     AppDialog.successDialog(amount: 100, context: context);
//   }
// }
