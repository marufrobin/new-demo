import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';

import '../../../../core/common/widget/app_assets_image.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/constant/constant_variable.dart';
import '../../../../core/constant/image_path.dart';
import '../../../../core/utils/app_date_formate.dart';
import '../../../../core/utils/distance_calculate.dart';

class NoDeliveryHistoryWidget extends StatelessWidget {
  const NoDeliveryHistoryWidget({super.key, required this.onRefresh});

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppAssetImageWidget(
            imagePath: ImagePath.noDeliveryIcon,
            height: 150.h,
            width: 200.w,
          ),
          Text("No stats available...", style: theme.textTheme.titleLarge),
          16.verticalSpace,
          AppButton(
            buttonLabel: "Refresh",
            leading: const Icon(Icons.refresh_rounded),
            onPressed: onRefresh,
            variant: ButtonVariant.FILLED,
            size: ButtonSize.MD,
            fixedSize: Size(200.r, 40.r),
          ),
        ],
      ),
    );
  }
}

class LoadingDeliveryHistoryWidget extends StatelessWidget {
  const LoadingDeliveryHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    // return _body(width, theme);

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: 10,
      itemBuilder: (context, index) => _body(width, theme),
    );
  }

  Container _body(double width, ThemeData theme) {
    return Container(
      width: width,
      decoration: _decoration(theme),
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 6.r),
      child: Column(
        spacing: 8.r,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _CustomerInformationWidget(),
              _IncomeWidget(theme: theme),
            ],
          ),
          _DateTimeDistanceWidget(theme: theme),
        ],
      ),
    );
  }

  BoxDecoration _decoration(ThemeData theme) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular((AppConstantVariable.kRadius).r),
      border: Border.all(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        width: 1.r,
      ),
    );
  }
}

class _DateTimeDistanceWidget extends StatelessWidget {
  const _DateTimeDistanceWidget({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.r,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        AppLoadingSkeletonWidget(height: 14, width: 80),
        AppLoadingSkeletonWidget(height: 14, width: 80),
        AppLoadingSkeletonWidget(height: 14, width: 80),
      ],
    );
  }
}

class _IncomeWidget extends StatelessWidget {
  const _IncomeWidget({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.r,
      children: [
        Text("Income:", style: theme.textTheme.bodySmall),
        const AppLoadingSkeletonWidget(height: 24, width: 80),
      ],
    );
  }
}

class _CustomerInformationWidget extends StatelessWidget {
  const _CustomerInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.r,
      children: const [
        AppLoadingSkeletonWidget(height: 20, width: 120),
        AppLoadingSkeletonWidget(height: 14, width: 240),
      ],
    );
  }
}
