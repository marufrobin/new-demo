import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/utils/app_custom_transition.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/presentation/delivery_history.screen.dart';
import 'package:rider/src/feature/income_and_delivery_history/income_history/income_history.screen.dart';

import '../../core/config/app.routes.dart';

class IncomeAndDeliveryHistoryRoutes {
  static final incomeAndDeliveryHistoryRoutes = ShellRoute(
    builder:
        (context, state, child) =>
            Scaffold(body: child, backgroundColor: Colors.transparent),
    routes: [
      /// Income History screen ------------------------------------------------
      GoRoute(
        name: AppRoutesNames.incomeHistoryScreen,
        path: AppRoutesNames.incomeHistoryScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const IncomeHistoryScreen(),
            ),
      ),

      /// End of income history screen -----------------------------------------
      ///
      /// Delivery history screen -----------------------------------------------
      GoRoute(
        name: AppRoutesNames.deliveryHistoryScreen,
        path: AppRoutesNames.deliveryHistoryScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const DeliveryHistoryScreen(),
            ),
      ),

      /// End of delivery history screen ---------------------------------------
      ///
    ],
  );
}
