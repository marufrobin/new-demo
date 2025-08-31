import 'package:go_router/go_router.dart';
import 'package:rider/src/feature/payment_and_invoice/presentation/payment_and_invoice.screen.dart';
import 'package:rider/src/feature/payment_and_invoice/presentation/payment_and_invoice_details.screen.dart';
import 'package:rider/src/feature/payment_method/presentation/payment_method.screen.dart';
import 'package:rider/src/feature/profile/presentation/profile_settings.screen.dart';
import 'package:rider/src/feature/terms_and_conditions/terms_and_conditions.screen.dart';
import 'package:rider/src/feature/vehicle_details/presentation/vehicle_details.screen.dart';

import '../core/config/app.routes.dart';
import '../core/utils/app_custom_transition.dart';
import 'announcements/presentation/announcements.screen.dart';
import 'app_setting/app_setting.screen.dart';
import 'change_password/presentation/change_password.screen.dart';
import 'documents/presentation/documents.screen.dart';
import 'help/presentation/help.screen.dart';
import 'help/presentation/support_center.screen.dart';
import 'help/presentation/support_center_chat.screen.dart';
import 'income_and_delivery_history/income_and_delivery_history.routes.dart';
import 'notification/presentation/notification.screen.dart';

class AccountsRoutes {
  static final accountsRoutes = ShellRoute(
    // builder: (context, state, child) => Scaffold(
    //   body: child,
    //   backgroundColor: Colors.transparent,
    // ),
    pageBuilder:
        (context, state, child) =>
            AppCustomTransition.slideFromRight(child: child),
    routes: [
      /// Terms and conditions screen ------------------------------------------
      GoRoute(
        name: AppRoutesNames.termsAndConditionsScreen,
        path: AppRoutesNames.termsAndConditionsScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const TermsAndConditionsScreen(),
            ),
      ),

      /// End of terms and conditions screen -----------------------------------
      ///
      /// Income and delivery history screen ------------------------------------
      IncomeAndDeliveryHistoryRoutes.incomeAndDeliveryHistoryRoutes,

      /// End of income and delivery history screen -----------------------------
      ///
      /// Profile Settings screen -----------------------------------------------
      GoRoute(
        name: AppRoutesNames.profileSettingsScreen,
        path: AppRoutesNames.profileSettingsScreen,
        // builder: (context, state) => const ProfileSettingsScreen(),
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const ProfileSettingsScreen(),
            ),
      ),

      /// End of profile Settings screen ----------------------------------------
      ///
      /// Notification screen ---------------------------------------------------
      GoRoute(
        name: AppRoutesNames.notificationScreen,
        path: AppRoutesNames.notificationScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const NotificationScreen(),
            ),
      ),

      /// End of Notification screen --------------------------------------------
      ///
      /// Annoucements screen ---------------------------------------------------
      GoRoute(
        name: AppRoutesNames.announcementsScreen,
        path: AppRoutesNames.announcementsScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const AnnouncementsScreen(),
            ),
      ),

      /// End of Announcements screen --------------------------------------------
      ///
      /// Documents screen ------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.documentsScreen,
        path: AppRoutesNames.documentsScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const DocumentsScreen(),
            ),
      ),

      /// End of Documents screen -----------------------------------------------
      ///
      /// Vehicles screen -------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.vehiclesScreen,
        path: AppRoutesNames.vehiclesScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const VehicleDetailsScreen(),
            ),
      ),

      /// End of Vehicles screen ------------------------------------------------
      ///
      /// Change password screen ------------------------------------------------
      GoRoute(
        name: AppRoutesNames.changePasswordScreen,
        path: AppRoutesNames.changePasswordScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: ChangePasswordScreen(),
            ),
      ),

      /// End of Change password screen -----------------------------------------
      ///
      /// App setting screen ---------------------------------------------------
      GoRoute(
        name: AppRoutesNames.appSettingScreen,
        path: AppRoutesNames.appSettingScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const AppSettingScreen(),
            ),
      ),

      /// End of App setting screen --------------------------------------------
      ///
      /// Help screen -----------------------------------------------------------
      GoRoute(
        name: AppRoutesNames.helpScreen,
        path: AppRoutesNames.helpScreen,
        pageBuilder:
            (context, state) =>
                AppCustomTransition.slideFromRight(child: const HelpScreen()),
      ),

      /// End of Help screen ----------------------------------------------------
      ///
      /// Support Center screen -------------------------------------------------
      GoRoute(
        name: AppRoutesNames.supportCenterScreen,
        path: AppRoutesNames.supportCenterScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const SupportCenterScreen(),
            ),
      ),

      /// End of support Center screen ------------------------------------------
      ///
      /// Support Center chat screen --------------------------------------------
      GoRoute(
        name: AppRoutesNames.supportCenterChatScreen,
        path: "${AppRoutesNames.supportCenterChatScreen}/:threadId",
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: SupportCenterChatScreen(
                threadId: state.pathParameters['threadId'] ?? "",
              ),
            ),
      ),

      /// Payment and invoice screen ---------------------------------------------
      GoRoute(
        name: AppRoutesNames.paymentAndInvoiceScreen,
        path: AppRoutesNames.paymentAndInvoiceScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const PaymentAndInvoiceScreen(),
            ),
      ),

      /// End of Payment and invoice screen --------------------------------------
      ///
      /// Payment and invoice screen ---------------------------------------------
      GoRoute(
        name: AppRoutesNames.paymentAndInvoiceDetailsScreen,
        path: '${AppRoutesNames.paymentAndInvoiceDetailsScreen}/:invoiceId',
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: PaymentAndInvoiceDetailsScreen(
                invoiceId: state.pathParameters['invoiceId'],
              ),
            ),
      ),

      /// End of Payment and invoice screen --------------------------------------
      ///
      /// Payment Method screen --------------------------------------------------
      GoRoute(
        name: AppRoutesNames.paymentMethodScreen,
        path: AppRoutesNames.paymentMethodScreen,
        pageBuilder:
            (context, state) => AppCustomTransition.slideFromRight(
              child: const PaymentMethodScreen(),
            ),
      ),

      /// End of Payment Method screen ------------------------------------------
    ],
  );
}
