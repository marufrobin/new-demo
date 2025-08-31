import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:rider/src/core/theme/cubit/theme_cubit.dart';
import 'package:rider/src/feature/account/bloc/user_bloc/user_bloc.dart';
import 'package:rider/src/feature/account/data/data_provider/user_data.provider.dart';
import 'package:rider/src/feature/account/data/repository/user.repository.dart';
import 'package:rider/src/feature/auth/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:rider/src/feature/connectivity/bloc/connectivity_bloc.dart';
import 'package:rider/src/feature/jobs/data/data_provider/my_ongoing_orders_data.provider.dart';
import 'package:rider/src/feature/jobs/data/repository/delivery_order_data.repository.dart';
import 'package:rider/src/feature/jobs/data/repository/my_ongoing_orders.repository.dart';
import 'package:rider/src/feature/payment_and_invoice/data/repository/invoice.repository.dart';
import 'package:rider/src/feature/profile/data/data_provider/profile_settings_data.provider.dart';
import 'package:rider/src/feature/profile/data/repository/profile_settings.repository.dart';

import '../../feature/account/bloc/delete_account/delete_account_bloc.dart';
import '../../feature/account/data/data_provider/delete_data.provider.dart';
import '../../feature/account/data/repository/delete.repository.dart';
import '../../feature/announcements/bloc/announcements_bloc.dart';
import '../../feature/announcements/data/data_provider/announcements_data.provider.dart';
import '../../feature/announcements/data/repository/announcements.repository.dart';
import '../../feature/auth/on_boarding/bloc/on_boarding_bloc.dart';
import '../../feature/auth/on_boarding/data/data_provider/on_boarding_data.provider.dart';
import '../../feature/auth/on_boarding/data/repository/on_boarding.repository.dart';
import '../../feature/change_password/bloc/change_password_bloc.dart';
import '../../feature/change_password/data/data_provider/change_password_data.provider.dart';
import '../../feature/change_password/data/repository/change_password.repository.dart';
import '../../feature/dashboard/bloc/income_chart/income_chart_bloc.dart';
import '../../feature/dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import '../../feature/dashboard/data/data_provider/income_chart_data.provider.dart';
import '../../feature/dashboard/data/data_provider/over_all_report_data.provider.dart';
import '../../feature/dashboard/data/repository/income_chart.repository.dart';
import '../../feature/dashboard/data/repository/over_all.repository.dart';
import '../../feature/documents/bloc/documents_bloc.dart';
import '../../feature/documents/data/data_provider/documents_data.provider.dart';
import '../../feature/documents/data/repository/documents.repository.dart';
import '../../feature/help/bloc/support_center_bloc/support_center_bloc.dart';
import '../../feature/help/bloc/support_message_bloc/support_message_bloc.dart';
import '../../feature/help/data/data_provider/support_center_data.provider.dart';
import '../../feature/help/data/data_provider/support_message_data.provider.dart';
import '../../feature/help/data/repository/support_center.repository.dart';
import '../../feature/help/data/repository/support_message.repository.dart';
import '../../feature/home/bloc/raider_status/rider_status_bloc.dart';
import '../../feature/home/data/data_provider/rider_status_data.provider.dart';
import '../../feature/home/data/repository/rider_status.repository.dart';
import '../../feature/income_and_delivery_history/delivery_history/bloc/delivery_history_bloc.dart';
import '../../feature/income_and_delivery_history/delivery_history/data/data_provider/delivery_history_data.provider.dart';
import '../../feature/income_and_delivery_history/delivery_history/data/repository/delivery_history.repository.dart';
import '../../feature/jobs/bloc/confirm_pick_up/confirm_pick_up_bloc.dart';
import '../../feature/jobs/bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import '../../feature/jobs/bloc/delivery_flow/delivery_flow_local_stage_cubit.dart';
import '../../feature/jobs/bloc/delivery_order/delivery_order_bloc.dart';
import '../../feature/jobs/bloc/distance_duration/distance_duration_bloc.dart';
import '../../feature/jobs/bloc/finalize_delivery_by_rider/finalize_delivery_by_rider_bloc.dart';
import '../../feature/jobs/bloc/jobs/jobs_bloc.dart';
import '../../feature/jobs/bloc/my_ongoing_orders/my_on_going_orders_bloc.dart';
import '../../feature/jobs/bloc/rider_response_to_delivery_order/rider_response_to_delivery_order_bloc.dart';
import '../../feature/jobs/data/data_provider/confirm_pick_up_data.provider.dart';
import '../../feature/jobs/data/data_provider/delivery_order_data.provider.dart';
import '../../feature/jobs/data/data_provider/distance_duration_data.provider.dart';
import '../../feature/jobs/data/data_provider/finalize_delivery_data.provider.dart';
import '../../feature/jobs/data/data_provider/jobs_data.provider.dart';
import '../../feature/jobs/data/data_provider/rider_response_to_delivery_order_data.provider.dart';
import '../../feature/jobs/data/repository/confirm_pick_up.repository.dart';
import '../../feature/jobs/data/repository/distance_duration.repository.dart';
import '../../feature/jobs/data/repository/finalize_delivery.repository.dart';
import '../../feature/jobs/data/repository/jobs.repository.dart';
import '../../feature/jobs/data/repository/rider_response_to_delivery_order.repository.dart';
import '../../feature/notification/bloc/notifications_bloc.dart';
import '../../feature/notification/data/data_provider/notification.provider.dart';
import '../../feature/notification/data/repository/notification.repository.dart';
import '../../feature/payment_and_invoice/bloc/invoice_bloc/invoice_bloc.dart';
import '../../feature/payment_and_invoice/bloc/invoices_bloc/invoices_bloc.dart';
import '../../feature/payment_and_invoice/bloc/sending_email_bloc/sending_invoices_bloc.dart';
import '../../feature/payment_and_invoice/data/data_provider/invoices_data.provider.dart';
import '../../feature/payment_method/bloc/payment_method_bloc.dart';
import '../../feature/payment_method/data/data_provider/data.provider.dart';
import '../../feature/payment_method/data/repository/payment_method.repository.dart';
import '../../feature/profile/bloc/profile_settings_bloc.dart';
import '../../feature/vehicle_details/bloc/vehicle_details_bloc.dart';
import '../../feature/vehicle_details/data/data_provider/vehicle_details_data.provider.dart';
import '../../feature/vehicle_details/data/repository/vehicle_details.repository.dart';
import 'app.dependency.dart';

class AppBlocProviderResolver {
  /// [MultiBlocProvider] is a widget that combines multiple [BlocProvider]
  static final List<SingleChildWidget> providers = [
    /// Theme cubit
    BlocProvider(create: (context) => ThemeCubit()),

    /// Connectivity Bloc
    BlocProvider(
      create: (context) => ConnectivityBloc()..add(const ConnectivityStarted()),
    ),

    /// Raider Status Bloc
    BlocProvider(
      create:
          (context) => RiderStatusBloc(context.read<RiderStatusRepository>()),
    ),

    /// Forgot password Bloc
    BlocProvider(create: (context) => getIt<ForgotPasswordBloc>()),

    /// User Bloc
    BlocProvider(create: (context) => UserBloc(context.read<UserRepository>())),

    /// Profile Settings Bloc
    BlocProvider(
      create:
          (context) =>
              ProfileSettingsBloc(context.read<ProfileSettingsRepository>()),
    ),

    /// On Boarding Bloc
    BlocProvider(
      create: (context) => OnBoardingBloc(context.read<OnBoardingRepository>()),
    ),

    /// Announcements Bloc
    BlocProvider(
      create:
          (context) =>
              AnnouncementsBloc(context.read<AnnouncementsRepository>())
                ..add(const AnnouncementsFetchingEvent()),
    ),

    /// Invoices Bloc
    BlocProvider(
      create: (context) => InvoicesBloc(context.read<InvoiceRepository>()),
    ),

    /// Sending Email invoices Bloc
    BlocProvider(
      create: (context) => SendingEmailBloc(context.read<InvoiceRepository>()),
    ),

    /// Invoice details Bloc
    BlocProvider(
      create: (context) => InvoiceBloc(context.read<InvoiceRepository>()),
    ),

    /// Over All Report Bloc
    BlocProvider(
      create:
          (context) =>
              OverAllReportBloc(context.read<OverAllReportRepository>()),
    ),

    /// Change Password Bloc
    BlocProvider(
      create:
          (context) =>
              ChangePasswordBloc(context.read<ChangePasswordRepository>()),
    ),

    /// Documents Bloc
    BlocProvider(
      create: (context) => DocumentsBloc(context.read<DocumentsRepository>()),
    ),

    /// Vehicle Details Bloc
    BlocProvider(
      create:
          (context) =>
              VehicleDetailsBloc(context.read<VehicleDetailsRepository>()),
    ),

    /// Jobs Bloc
    BlocProvider(create: (context) => JobsBloc(context.read<JobsRepository>())),

    /// Delivery History Bloc
    BlocProvider(
      create:
          (context) =>
              DeliveryHistoryBloc(context.read<DeliveryHistoryRepository>()),
    ),

    /// Delete Account Bloc
    BlocProvider(
      create: (context) => DeleteAccountBloc(context.read<DeleteRepository>()),
    ),

    /// Payment Method Bloc
    BlocProvider(
      create:
          (context) =>
              PaymentMethodBloc(context.read<PaymentMethodRepository>()),
    ),

    /// Notification Bloc
    BlocProvider(
      create:
          (context) =>
              NotificationsBloc(context.read<NotificationRepository>()),
    ),

    /// Support Center Bloc
    BlocProvider(
      create:
          (context) =>
              SupportCenterBloc(context.read<SupportCenterRepository>()),
    ),

    /// Support Message Bloc
    BlocProvider(
      create:
          (context) =>
              SupportMessageBloc(context.read<SupportMessageRepository>()),
    ),

    /// Income Chart Repository
    BlocProvider(
      create:
          (context) => IncomeChartBloc(context.read<IncomeChartRepository>()),
    ),

    /// Delivery Order Bloc
    BlocProvider(
      create:
          (context) =>
              DeliveryOrderBloc(context.read<DeliveryOrderDataRepository>()),
    ),

    /// Distance Duration Bloc
    BlocProvider(
      create:
          (context) =>
              DistanceDurationBloc(context.read<DistanceDurationRepository>()),
    ),

    /// Rider Response To Delivery Order Bloc
    BlocProvider(
      create:
          (context) => RiderResponseToDeliveryOrderBloc(
            context.read<RiderResponseToDeliveryOrderRepository>(),
          ),
    ),

    /// My On Going Orders Bloc
    BlocProvider(
      create:
          (context) =>
              MyOnGoingOrdersBloc(context.read<MyOngoingOrdersRepository>()),
    ),

    /// Finalize Delivery Bloc
    BlocProvider(
      create:
          (context) => FinalizeDeliveryByRiderBloc(
            context.read<FinalizeDeliveryRepository>(),
          ),
    ),

    /// Confirm Pick Up Bloc
    BlocProvider(
      create:
          (context) =>
              ConfirmPickUpBloc(context.read<ConfirmPickUpRepository>()),
    ),

    /// Delivery Local Stage Cubit
    BlocProvider(
      create:
          (context) =>
              DeliveryFlowLocalStageCubit(context.read<DeliveryOrderBloc>()),
    ),

    /// Delivery Flow Coordinator Bloc
    BlocProvider(
      create:
          (context) => DeliveryFlowCoordinatorCubit(
            context.read<DeliveryFlowLocalStageCubit>(),
            context.read<DeliveryOrderBloc>(),
          ),
    ),
  ];

  /*
* ------------------------------------------------------------------------------
*   [MultiRepositoryProvider] is a widget that
*   combines multiple [RepositoryProvider]
* -------------------------------------------------------------------------------*/

  ///
  /// [MultiRepositoryProvider] is a widget that
  /// combines multiple [RepositoryProvider]
  static final List<SingleChildWidget> repositoriesProviders = [
    /// Raider Status Repository
    RepositoryProvider(
      create: (context) => RiderStatusRepository(RiderStatusDataProvider()),
    ),

    /// User Repository
    RepositoryProvider(create: (context) => UserRepository(UserDataProvider())),

    /// Profile Settings Repository
    RepositoryProvider(
      create:
          (context) => ProfileSettingsRepository(ProfileSettingsDataProvider()),
    ),

    /// On Boarding Repository
    RepositoryProvider(
      create: (context) => OnBoardingRepository(OnBoardingDataProvider()),
    ),

    /// Announcements Repository
    RepositoryProvider(
      create: (context) => AnnouncementsRepository(AnnouncementsDataProvider()),
    ),

    /// Invoices Repository
    RepositoryProvider(
      create: (context) => InvoiceRepository(InvoicesDataProvider()),
    ),

    /// Over All Report Repository
    RepositoryProvider(
      create: (context) => OverAllReportRepository(OverAllReportDataProvider()),
    ),

    /// Change Password Repository
    RepositoryProvider(
      create:
          (context) => ChangePasswordRepository(ChangePasswordDataProvider()),
    ),

    /// Documents Repository
    RepositoryProvider(
      create: (context) => DocumentsRepository(DocumentsDataProvider()),
    ),

    /// Vehicle Details Repository
    RepositoryProvider(
      create:
          (context) => VehicleDetailsRepository(VehicleDetailsDataProvider()),
    ),

    /// Jobs Repository
    RepositoryProvider(create: (context) => JobsRepository(JobsDataProvider())),

    /// Delivery History Repository
    RepositoryProvider(
      create:
          (context) => DeliveryHistoryRepository(DeliveryHistoryDataProvider()),
    ),

    /// Delete Account Repository
    RepositoryProvider(
      create: (context) => DeleteRepository(DeleteDataProvider()),
    ),

    /// Payment Method Repository
    RepositoryProvider(
      create: (context) => PaymentMethodRepository(PaymentMethodDataProvider()),
    ),

    /// Notification Repository
    RepositoryProvider(
      create: (context) => NotificationRepository(NotificationProvider()),
    ),

    /// Support Center Repository
    RepositoryProvider(
      create: (context) => SupportCenterRepository(SupportCenterDataProvider()),
    ),

    /// Support Message Repository
    RepositoryProvider(
      create:
          (context) => SupportMessageRepository(SupportMessageDataProvider()),
    ),

    /// Income Chart Repository
    RepositoryProvider<IncomeChartRepository>(
      create: (context) => IncomeChartRepository(IncomeChartDataProvider()),
    ),

    /// Delivery Order Repository
    RepositoryProvider<DeliveryOrderDataRepository>(
      create:
          (context) => DeliveryOrderDataRepository(DeliveryOrderDataProvider()),
    ),

    /// Distance Duration Repository
    RepositoryProvider<DistanceDurationRepository>(
      create:
          (context) =>
              DistanceDurationRepository(DistanceDurationDataProvider()),
    ),

    /// Rider Response To Delivery Order Repository
    RepositoryProvider<RiderResponseToDeliveryOrderRepository>(
      create:
          (context) => RiderResponseToDeliveryOrderRepository(
            RiderResponseToDeliveryOrderDataProvider(),
          ),
    ),

    /// My On Going Orders Repository
    RepositoryProvider<MyOngoingOrdersRepository>(
      create:
          (context) => MyOngoingOrdersRepository(MyOngoingOrdersDataProvider()),
    ),

    /// Finalize Delivery Repository
    RepositoryProvider<FinalizeDeliveryRepository>(
      create:
          (context) =>
              FinalizeDeliveryRepository(FinalizeDeliveryDataProvider()),
    ),
    RepositoryProvider<ConfirmPickUpRepository>(
      create: (context) => ConfirmPickUpRepository(ConfirmPickUpDataProvider()),
    ),
  ];
}
