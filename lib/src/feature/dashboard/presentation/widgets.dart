import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';

import '../../../core/common/widget/app_assets_image.widget.dart';
import '../../../core/common/widget/button_widget/app_icon_button.widget.dart';
import '../../../core/constant/constant_variable.dart';
import '../../../core/constant/image_path.dart';
import '../../../core/utils/app_currency_symbol_on_price.dart';
import '../../../model/my_over_all_report.model.dart';
import 'dashboard.screen.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key, required this.theme, this.myOverAllReport});

  final ThemeData theme;

  final MyOverAllReportModel? myOverAllReport;

  @override
  Widget build(BuildContext context) {
    List<StatItem> stats = [
      StatItem(
        icon: ImagePath.myEarningsIcon,
        title: "My earnings",
        value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
          moneyAmount: myOverAllReport?.totalIncome ?? 0,
        ),
      ),
      StatItem(
        icon: ImagePath.deliveryIcon,
        title: "Total deliveries",
        value: myOverAllReport?.totalSuccessfulDeliveriesCount.toString() ?? "",
      ),
      StatItem(
        icon: ImagePath.cancelIcon,
        title: "Cancelled",
        value: myOverAllReport?.totalCancelledDeliveriesCount.toString() ?? "",
      ),
      StatItem(
        icon: ImagePath.cashCollectedIcon,
        title: "Cash collected from customers",
        value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
          moneyAmount: myOverAllReport?.totalCashCollectedFromCustomer,
        ),
      ),
      const StatItem(icon: ImagePath.ratingIcon, title: "Ratings", value: "0"),
      StatItem(
        icon: ImagePath.tipsIcon,
        title: "Tips",
        value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
          moneyAmount: 0,
        ),
      ),
    ];

    return DashBoardBackGroundContainer(
      title: "Stats",
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.2.r,
          physics: const NeverScrollableScrollPhysics(),
          children: stats.map((stat) => _buildStatWidget(stat)).toList(),
        ),
      ],
    );
  }

  Widget _buildStatWidget(StatItem stat) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
          width: 1.r,
        ),
      ),
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.r,
          children: [
            AppAssetImageWidget(
              imagePath: stat.icon,
              height: 40.r,
              width: 40.r,
            ),
            Text(
              stat.value,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Text(
              stat.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingStatsWidget extends StatelessWidget {
  const LoadingStatsWidget({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return DashBoardBackGroundContainer(
      title: "Stats",
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.4.r,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(6, (index) => _buildStatWidget()),
        ),
      ],
    );
  }

  Widget _buildStatWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
          width: 1.r,
        ),
      ),
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.r,
          children: [
            AppLoadingSkeletonWidget(height: 40.r, width: 40.r),
            AppLoadingSkeletonWidget(height: 20.r, width: 200.r),
            AppLoadingSkeletonWidget(height: 12.r, width: 200.r),
          ],
        ),
      ),
    );
  }
}

class DashBoardBackGroundContainer extends StatelessWidget {
  const DashBoardBackGroundContainer({
    super.key,
    this.title,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection,
    this.textBaseline,
    this.spacing = 0.0,
    this.spaceBetweenTitleAndChildren = 16.0,
  });

  final String? title;

  final List<Widget>? children;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double spacing;
  final double spaceBetweenTitleAndChildren;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Container(
      width: width,
      color: theme.colorScheme.surface,
      margin: EdgeInsets.symmetric(vertical: 16.0.r),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        spacing: spacing.r,
        children: [
          if (title != null)
            Text(title ?? "", style: theme.textTheme.titleLarge),
          spaceBetweenTitleAndChildren.verticalSpace,
          ...(children ?? []),
        ],
      ),
    );
  }
}

class NoStatsAvailableWidget extends StatelessWidget {
  const NoStatsAvailableWidget({
    super.key,
    this.title = "No stats available...",
    this.onRefresh,
  });

  final String? title;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DashBoardBackGroundContainer(
      children: [
        Center(
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
              AppIconButton(
                icon: const Icon(Icons.refresh),
                tooltip: "Refresh",
                onPressed: onRefresh,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
