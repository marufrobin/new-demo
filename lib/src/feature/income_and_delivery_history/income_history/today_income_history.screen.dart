import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';

import '../../../core/utils/app_date_formate.dart';
import '../../../core/utils/app_dialog.dart';
import '../../../core/utils/app_toaster.dart';
import '../../../model/delivery_with_pagination.model.dart';
import '../../account/bloc/logout_bloc/log_out_bloc.dart';
import '../../dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import '../delivery_history/bloc/delivery_history_bloc.dart';

class TodayIncomeHistoryScreen extends StatefulWidget {
  const TodayIncomeHistoryScreen({super.key});

  @override
  State<TodayIncomeHistoryScreen> createState() =>
      _TodayIncomeHistoryScreenState();
}

class _TodayIncomeHistoryScreenState extends State<TodayIncomeHistoryScreen> {
  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<OverAllReportBloc>().add(TodayOverAllReportFetchEvent());
    context.read<DeliveryHistoryBloc>().add(
      WeeklyDeliveryHistoryFetchingEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return BlocBuilder<OverAllReportBloc, OverAllReportState>(
      builder: (context, state) {
        if (state is OverAllReportError) {
          return _EmptyEarningWidget(theme: theme);
        } else {
          final data =
              state is TodayOverAllReportState
                  ? state.todayOverAllReport
                  : null;

          return AppScaffold(
            title: "Today income history",
            isLoading: state is OverAllReportLoading,
            appBar: AppBar(
              leading: const BackButton(color: Colors.white),
              actions: [_logoutButton(theme), 10.horizontalSpace],
              backgroundColor: theme.colorScheme.primary,
            ),
            body: AppRefreshIndicatorWidget(
              onRefresh: () async => _onRefresh(),
              isScrollNotificationNeeded: false,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      _topWidget(
                        width: width,
                        theme: theme,
                        todayDelivery: data?.totalSuccessfulDeliveriesCount,
                        todayCashCollected: data?.totalIncome,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        child: _MyIncomeWidget(
                          width: width,
                          theme: theme,
                          totalIncome: data?.totalIncome,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  BlocProvider<LogOutBloc> _logoutButton(ThemeData theme) {
    return BlocProvider(
      create: (context) => LogOutBloc(),
      child: BlocConsumer<LogOutBloc, LogOutState>(
        listener: (context, state) {
          if (state is LogOutSuccess) {
            if (state.isLoggedOut) {
              AppToaster.success(
                message: "Log out successfully",
                context: context,
              );
            }
          } else if (state is LogOutFailure) {
            AppToaster.error(message: state.errorMassage, context: context);
          }
        },
        builder: (context, state) {
          return AppButton(
            buttonLabel: "Log out",
            onPressed: () {
              AppDialog.confirmationDialog(
                title: "Are you sure you want to log out?",
                yesButtonPressed: () {
                  context.read<LogOutBloc>().add(LogOutInitiateEvent());
                },
                noButtonPressed: () {
                  log("No button pressed", name: "Log out");
                },
                context: context,
              );
            },
            backgroundColor: theme.colorScheme.error,
            size: ButtonSize.SM,
          );
        },
      ),
    );
  }

  Container _topWidget({
    required ThemeData theme,
    required int? todayDelivery,
    required double width,
    required double? todayCashCollected,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16.r),
      color: theme.colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Earning activities",
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          Text(
            "Today",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          Text(
            AppDateTimeFormat.dateFormat(date: DateTime.now()),
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          20.verticalSpace,
          Text(
            "Total delivery: ${todayDelivery ?? 0}",
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Cash collected from customer: "),
                TextSpan(
                  text: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
                    moneyAmount: todayCashCollected,
                  ),
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _MyIncomeWidget extends StatelessWidget {
  const _MyIncomeWidget({
    super.key,
    required this.width,
    required this.theme,
    required this.totalIncome,
  });

  final double width;
  final ThemeData theme;
  final double? totalIncome;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.r,
      children: [
        10.verticalSpace,
        _myIncomeWidget(
          context: context,
          theme: theme,
          totalIncome: totalIncome,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 90.r),
          child: Text(
            "This is the amount you have earned today.",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        10.verticalSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Past earning activities",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<DeliveryHistoryBloc, DeliveryHistoryState>(
          builder: (context, state) {
            if (state is WeeklyDeliveryHistoryData) {
              return _pastEarningHistoryWidget(theme: theme, data: state.data);
            } else if (state is WeeklyDeliveryHistoryError) {
              return _EmptyEarningWidget(theme: theme);
            } else if (state is DeliveryHistoryLoading) {
              return _pastEarningHistoryLoadingWidget(theme: theme);
            } else {
              return _EmptyEarningWidget(theme: theme);
            }
          },
        ),
        60.verticalSpace,
      ],
    );
  }

  ListView _pastEarningHistoryWidget({
    required ThemeData theme,
    required DeliveryWithPaginationModel? data,
  }) {
    return ListView.builder(
      itemCount: data?.nodes?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            AppDateTimeFormat.dayName(date: data?.nodes?[index]?.deliveredAt),
          ),
          subtitle: Text(
            AppDateTimeFormat.dateFormat(
              date: data?.nodes?[index]?.deliveredAt,
            ),
          ),
          trailing: Text(
            AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
              moneyAmount: data?.nodes?[index]?.riderFare,
            ),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  ListView _pastEarningHistoryLoadingWidget({required ThemeData theme}) {
    return ListView.builder(
      itemCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ListTile(
          contentPadding: EdgeInsets.zero,
          title: AppLoadingSkeletonWidget(height: 16, width: 60),
          subtitle: AppLoadingSkeletonWidget(height: 16, width: 60),
          trailing: AppLoadingSkeletonWidget(height: 16, width: 60),
        );
      },
    );
  }

  AppElevationContainerWidget _myIncomeWidget({
    required BuildContext context,
    required ThemeData theme,
    required double? totalIncome,
  }) {
    return AppElevationContainerWidget(
      padding: EdgeInsets.symmetric(horizontal: 46.r, vertical: 18.r),
      color: Colors.green.shade700,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: "My income: "),
            TextSpan(
              text: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
                moneyAmount: totalIncome,
              ),
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _EmptyEarningWidget extends StatelessWidget {
  const _EmptyEarningWidget({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        const AppAssetImageWidget(imagePath: ImagePath.emptyEarningIconImage),
        Text(
          "Earnings data is currently unavailable...",
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
