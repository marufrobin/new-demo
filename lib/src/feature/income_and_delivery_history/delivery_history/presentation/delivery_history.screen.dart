import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/delivery_income_tile.widget.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/bloc/delivery_history_bloc.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/presentation/widgets.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/delivery_with_pagination.model.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  State<DeliveryHistoryScreen> createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen>
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
      child: BlocBuilder<DeliveryHistoryBloc, DeliveryHistoryState>(
        builder: (context, state) {
          return AppScaffold(
            title: 'Delivery History',
            isLoading: state is DeliveryHistoryLoading,
            body: Container(
              width: width,
              color: theme.colorScheme.surface,
              child: Column(
                spacing: 16.r,
                children: [
                  4.verticalSpace,
                  _tabBarWidget(theme),
                  Expanded(
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
                  ),
                ],
              ),
            ),
          );
        },
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
