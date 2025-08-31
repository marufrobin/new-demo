import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/feature/dashboard/bloc/income_chart/income_chart_bloc.dart';

import '../../../core/common/app_enum.dart';
import '../../../core/common/widget/app_assets_image.widget.dart';
import '../../../core/common/widget/app_drop_down_menu.widget.dart';
import '../../../core/common/widget/app_scaffold.widget.dart';
import '../../../core/common/widget/app_searchable_drop_down_menu.widget.dart';
import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/common/widget/delivery_income_tile.widget.dart';
import '../../../core/config/app.routes.dart';
import '../../../core/constant/constant_variable.dart';
import '../../../core/constant/image_path.dart';
import '../../../core/utils/app_currency_symbol_on_price.dart';
import '../../../model/delivery_with_pagination.model.dart';
import '../delivery_history/bloc/delivery_history_bloc.dart';
import '../delivery_history/presentation/widgets.dart';
import 'income_history_bar_cart.screen.dart';

class IncomeHistoryScreen extends StatefulWidget {
  const IncomeHistoryScreen({super.key});

  @override
  State<IncomeHistoryScreen> createState() => _IncomeHistoryScreenState();
}

class _IncomeHistoryScreenState extends State<IncomeHistoryScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () => _onTabChanged(index: _tabController.index),
    );
    _onRefresh();
    super.initState();
  }

  _onTabChanged({required int index}) {
    setState(() => selectedIndex = index);

    final currentStatus =
        index == 0 ? DeliveryStatus.DELIVERED : DeliveryStatus.CANCELLED;

    context.read<DeliveryHistoryBloc>().add(
      DeliveryHistoryStatusChangedEvent(status: currentStatus),
    );
  }

  _onRefresh() {
    context.read<IncomeChartBloc>().add(
      const IncomeChartFetchEvent(dateFilter: DateFilter.TODAY),
    );

    context.read<DeliveryHistoryBloc>().add(
      const DeliveryHistoryFetchingEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      initialIndex: selectedIndex,
      animationDuration: const Duration(milliseconds: 200),
      child: AppScaffold(
        title: 'Income history',
        actions: [
          AppIconButton(
            onPressed: () {
              context.pushNamed(AppRoutesNames.helpScreen);
            },
            icon: Icon(Icons.question_mark_outlined, size: 20.r),
            fixedSize: Size(30.r, 30.r),
          ),
        ],

        body: Container(
          width: width,
          color: theme.colorScheme.surface,
          child: Column(
            spacing: 16.r,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _IncomeWidgetGraphWidget(theme: theme, width: width),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Text(
                  "Income history",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              4.verticalSpace,
              _tabBarWidget(theme),
              BlocBuilder<DeliveryHistoryBloc, DeliveryHistoryState>(
                builder: (context, state) {
                  return Expanded(
                    child:
                        state is DeliveryHistoryError
                            ? NoDeliveryHistoryWidget(onRefresh: _onRefresh)
                            : state is DeliveryHistoryData
                            ? _tabBarViewWidget(
                              completeData: state.completeData,
                              cancelledData: state.cancelledData,
                            )
                            : state is DeliveryHistoryLoading
                            ? const LoadingDeliveryHistoryWidget()
                            : NoDeliveryHistoryWidget(onRefresh: _onRefresh),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _tabBarViewWidget({
    required DeliveryWithPaginationModel? completeData,
    required DeliveryWithPaginationModel? cancelledData,
  }) {
    return SafeArea(
      child: TabBarView(
        controller: _tabController,
        children: [
          _CompletedDeliveryHistoryWidget(data: completeData),
          _CancelledDeliveryHistoryWidget(data: cancelledData),
        ],
      ),
    );
  }

  TabBar _tabBarWidget(ThemeData theme) {
    return TabBar(
      controller: _tabController,
      onTap: (value) => _onTabChanged(index: value),
      dividerColor: Colors.transparent,
      labelColor: theme.colorScheme.surface,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: theme.colorScheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: theme.textTheme.bodyLarge,
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 8.0.r),
      tabs: [
        _tabBar(
          theme: theme,
          label: 'Completed',
          isSelected: selectedIndex == 0,
        ),
        _tabBar(
          theme: theme,
          label: 'Cancelled',
          isSelected: selectedIndex == 1,
        ),
      ],
    );
  }

  Widget _tabBar({
    required ThemeData theme,
    required String label,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 50.r, vertical: 8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        border: Border.all(
          color: isSelected ? Colors.transparent : theme.colorScheme.primary,
          width: 1.r,
        ),
        color:
            isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withValues(alpha: 0.1),
      ),
      duration: const Duration(milliseconds: 200),
      child: Text(label),
    );
  }
}

class _CancelledDeliveryHistoryWidget extends StatelessWidget {
  const _CancelledDeliveryHistoryWidget({super.key, this.data});

  final DeliveryWithPaginationModel? data;

  @override
  Widget build(BuildContext context) {
    log(
      name: "Cancelled Delivery History Widget",
      (data?.nodes?.isEmpty ?? false).toString(),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return (data?.nodes?.isEmpty ?? false)
              ? NoDeliveryHistoryWidget(
                onRefresh: () {
                  context.read<DeliveryHistoryBloc>().add(
                    const DeliveryHistoryFetchingEvent(),
                  );
                },
              )
              : DeliveryIncomeTileWidget(delivery: data?.nodes?[index]);
        },
        itemCount: (data?.nodes?.isEmpty ?? false) ? 1 : data?.nodes?.length,
      ),
    );
  }
}

class _CompletedDeliveryHistoryWidget extends StatelessWidget {
  const _CompletedDeliveryHistoryWidget({super.key, this.data});

  final DeliveryWithPaginationModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return (data?.nodes?.isEmpty ?? false)
              ? NoDeliveryHistoryWidget(
                onRefresh: () {
                  context.read<DeliveryHistoryBloc>().add(
                    const DeliveryHistoryFetchingEvent(),
                  );
                },
              )
              : DeliveryIncomeTileWidget(delivery: data?.nodes?[index]);
        },
        itemCount: (data?.nodes?.isEmpty ?? false) ? 1 : data?.nodes?.length,
      ),
    );
  }
}

class _IncomeWidgetGraphWidget extends StatefulWidget {
  const _IncomeWidgetGraphWidget({
    super.key,
    required this.theme,
    required this.width,
  });

  final ThemeData theme;
  final double width;

  @override
  State<_IncomeWidgetGraphWidget> createState() =>
      __IncomeWidgetGraphWidgetState();
}

class __IncomeWidgetGraphWidgetState extends State<_IncomeWidgetGraphWidget> {
  CommonDropDownMenuItemsModel? selectedValueForDropdownMenu;

  final List<CommonDropDownMenuItemsModel> _listOfDropDownMenuItems =
      DateFilter.values
          .map(
            (e) => CommonDropDownMenuItemsModel(value: e.name, items: e.label),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: Column(
        children: [
          _filterAndIncomeWidget(),
          16.verticalSpace,
          BlocBuilder<IncomeChartBloc, IncomeChartState>(
            builder: (context, state) {
              if (state is IncomeChartData) {
                return IncomeHistoryBarChartWidget(
                  data: state.myDeliveryIncomeChart?.myDeliveryIncomeChart,
                );
              } else if (state is IncomeChartError) {
                return IncomeHistoryBarChartWidget(data: null);
              } else if (state is IncomeChartLoading) {
                return IncomeHistoryBarChartWidget(data: null);
              } else {
                return IncomeHistoryBarChartWidget(data: null);
              }
            },
          ),
        ],
      ),
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
            log(name: "Value", "${value}");
            final selectedDateFilter =
                DateFilter.values
                    .where((element) => element.name == value)
                    .first;
            context.read<IncomeChartBloc>().add(
              IncomeChartFetchEvent(dateFilter: selectedDateFilter),
            );
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

class _NoStatsAvailableWidget extends StatelessWidget {
  const _NoStatsAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppAssetImageWidget(
            imagePath: ImagePath.noStatsIcon,
            height: 150.h,
            width: 200.w,
          ),
          Text("No stats available...", style: theme.textTheme.titleLarge),
          16.verticalSpace,
          AppButton(
            buttonLabel: "Get Started",
            onPressed: () {},
            variant: ButtonVariant.FILLED,
            size: ButtonSize.MD,
            fixedSize: Size(200.r, 40.r),
          ),
        ],
      ),
    );
  }
}
