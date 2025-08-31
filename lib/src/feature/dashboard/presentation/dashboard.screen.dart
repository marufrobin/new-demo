import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_drop_down_menu.widget.dart';
import 'package:rider/src/core/common/widget/app_network_image.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_date_formate.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/dashboard/bloc/income_chart/income_chart_bloc.dart';
import 'package:rider/src/feature/dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import 'package:rider/src/feature/dashboard/presentation/dashboard_chart.screen.dart';
import 'package:rider/src/feature/dashboard/presentation/widgets.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/bloc/delivery_history_bloc.dart';

import '../../../core/common/widget/app_searchable_drop_down_menu.widget.dart';
import '../../../core/common/widget/delivery_income_tile.widget.dart';
import '../../../core/config/app.routes.dart';
import '../../income_and_delivery_history/delivery_history/presentation/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<IncomeChartBloc>().add(
      const IncomeChartFetchEvent(dateFilter: DateFilter.TODAY),
    );

    context.read<OverAllReportBloc>().add(
      OverAllReportFetchEvent(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
      ),
    );

    context.read<DeliveryHistoryBloc>().add(
      DeliveryHistoryAllDataFetchingEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Dashboard",
      body: SafeArea(
        child: AppRefreshIndicatorWidget(
          onRefresh: () async => _onRefresh(),
          isScrollNotificationNeeded: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _DashboardGraphWidget(theme: theme, width: width),
                BlocBuilder<OverAllReportBloc, OverAllReportState>(
                  builder: (context, state) {
                    ///
                    /// OverAllReportError
                    if (state is OverAllReportError) {
                      return NoStatsAvailableWidget(
                        onRefresh: () => _onRefresh(),
                      );
                    }
                    ///
                    /// OverAllReportData
                    else if (state is OverAllReportData) {
                      return StatsWidget(
                        theme: theme,
                        myOverAllReport: state.myOverAllReport,
                      );
                    }
                    ///
                    /// OverAllReportLoading
                    else if (state is OverAllReportLoading) {
                      return LoadingStatsWidget(theme: theme);
                    }

                    return NoStatsAvailableWidget(
                      onRefresh: () => _onRefresh(),
                    );
                  },
                ),
                _DeliveryAndIncomeHistoryWidget(
                  theme: theme,
                  onRefresh: () => _onRefresh(),
                ),
                // _DashBoardAdvertiseWidget(
                //   theme: theme,
                //   width: width,
                //   height: height,
                // ),
                120.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardGraphWidget extends StatefulWidget {
  const _DashboardGraphWidget({
    super.key,
    required this.theme,
    required this.width,
  });

  final ThemeData theme;
  final double width;

  @override
  State<_DashboardGraphWidget> createState() => _DashboardGraphWidgetState();
}

class _DashboardGraphWidgetState extends State<_DashboardGraphWidget> {
  CommonDropDownMenuItemsModel? selectedValueForDropdownMenu;

  final List<CommonDropDownMenuItemsModel> _listOfDropDownMenuItems =
      DateFilter.values
          .map(
            (e) => CommonDropDownMenuItemsModel(value: e.name, items: e.label),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return DashBoardBackGroundContainer(
      title: "Income",
      children: [
        _filterAndIncomeWidget(),
        16.verticalSpace,
        BlocBuilder<IncomeChartBloc, IncomeChartState>(
          builder: (context, state) {
            if (state is IncomeChartData) {
              return DashBoardChartWidget(
                data: state.myDeliveryIncomeChart?.myDeliveryIncomeChart,
              );
            } else if (state is IncomeChartError) {
              return DashBoardChartWidget(data: null);
            } else if (state is IncomeChartLoading) {
              return DashBoardChartWidget(data: null);
            } else {
              return DashBoardChartWidget(data: null);
            }
          },
        ),
      ],
    );
  }

  Row _filterAndIncomeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppDropDownMenuWidget(
          isExpanded: false,
          listOfDropDownMenuItems: _listOfDropDownMenuItems,
          value: selectedValueForDropdownMenu?.value,
          onChanged: (value) {
            log(name: "Value", "$value");
            final selectedDateFilter =
                DateFilter.values
                    .where((element) => element.name == value)
                    .first;
            // for (var element in DateFilter.values) {
            //   log(name: "Value", "${element.name} => ${element.name == value}");
            // }

            /// Converting string to date --------------------------------------
            DateTime today = DateTime.now();
            DateTime targetDate = AppDateTimeFormat().getDateTimeFromString(
              selectedDateFilter.intValue.toString(),
            );
            bool isMinusValue = value?.startsWith("-") ?? false;
            final startDate = isMinusValue ? targetDate : today;
            final endDate = isMinusValue ? today : targetDate;
            log(name: "Start Date", startDate.toString());
            log(name: "End Date", endDate.toString());

            ///
            /// Fetching Income Chart ------------------------------------------
            context.read<IncomeChartBloc>().add(
              IncomeChartFetchEvent(dateFilter: selectedDateFilter),
            );

            ///-----------------------------------------------------------------
            ///
            /// Fetching stats -------------------------------------------------
            final overAllReportFetchEvent = OverAllReportFetchEvent(
              endDate: endDate,
              startDate: startDate,
            );
            context.read<OverAllReportBloc>().add(overAllReportFetchEvent);

            ///-----------------------------------------------------------------
            ///
            setState(() {
              selectedValueForDropdownMenu = _listOfDropDownMenuItems
                  .firstWhere((element) => element.value == value);
            });
          },
        ),
        _incomeAmount(theme: widget.theme),
      ],
    );
  }

  Widget _incomeAmount({required ThemeData theme}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amount: ", style: theme.textTheme.bodySmall),
        Text(
          AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
            moneyAmount: 10000,
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _DashBoardAdvertiseWidget extends StatelessWidget {
  const _DashBoardAdvertiseWidget({
    super.key,
    required this.theme,
    required this.width,
    required this.height,
  });

  final ThemeData theme;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 190.h,
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: _colorBoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eid offer not available!",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    "only on selected outlets",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Order now and enjoy free delivery",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  AppButton(
                    buttonLabel: "click to order",
                    onPressed: () {
                      AppToaster.willImplementSoon(context: context);
                    },
                    backgroundColor: Colors.white,
                    labelColor: Colors.black,
                    variant: ButtonVariant.FILLED,
                    size: ButtonSize.SM,
                    fixedSize: Size(130.r, 40.r),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "T&C applied*",
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 8.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: AppNetworkImage(imageUrl: "")),
        ],
      ),
    );
  }

  BoxDecoration _colorBoxDecoration() {
    return BoxDecoration(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
    );
  }
}

class _DeliveryAndIncomeHistoryWidget extends StatelessWidget {
  const _DeliveryAndIncomeHistoryWidget({
    super.key,
    required this.onRefresh,
    required this.theme,
  });

  final ThemeData theme;

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return DashBoardBackGroundContainer(
      title: "Delivery & Income history",
      children: [
        BlocBuilder<DeliveryHistoryBloc, DeliveryHistoryState>(
          builder: (context, state) {
            log(name: "Delivery History Bloc state", state.toString());
            if (state is DeliveryHistoryError) {
              return NoDeliveryHistoryWidget(onRefresh: onRefresh);
            } else if (state is DeliveryHistoryAllData) {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) => DeliveryIncomeTileWidget(
                      delivery: state.data?.nodes?[index],
                    ),
                itemCount:
                    (state.data?.nodes?.length ?? 0) >= 5
                        ? 5
                        : state.data?.nodes?.length,
              );
            } else if (state is DeliveryHistoryLoading) {
              return const LoadingDeliveryHistoryWidget();
            }
            return NoDeliveryHistoryWidget(onRefresh: onRefresh);
          },
        ),
        Center(
          child: AppButton(
            buttonLabel: "View more",
            onPressed: () {
              context
                  .pushNamed(AppRoutesNames.deliveryHistoryScreen)
                  .then((value) => onRefresh?.call());
            },
            variant: ButtonVariant.SUBTLE,
            size: ButtonSize.SM,
            fixedSize: Size(160.r, 20.r),
          ),
        ),
      ],
    );
  }
}

class StatItem {
  final String icon;
  final String title;
  final String value;

  const StatItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}
