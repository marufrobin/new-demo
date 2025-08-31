import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/delivery_income_chart.model.dart';

class DashBoardChartWidget extends StatelessWidget {
  DashBoardChartWidget({
    super.key,
    required this.data,
    this.barsSpace = 16,
    this.barWidth = 28,
  });

  final double barsSpace;
  final double barWidth;

  final ScrollController _scrollController = ScrollController();
  final List<DeliveryChartItem?>? data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Calculate required width for all bars
    final requiredWidth =
        (data?.length ?? 0) * (barWidth + barsSpace) + 32; // +32 for padding
    final chartWidth = math.max(width, requiredWidth);

    return SizedBox(
      height: 300.h,
      child: RawScrollbar(
        thumbVisibility: true,
        interactive: false,
        trackVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: SizedBox(
            width: chartWidth,
            child: BarChart(
              BarChartData(
                barGroups: _barChartDataBuilder(
                  data: data,
                  theme: theme,
                  barsSpace: barsSpace.r,
                  barWidth: barWidth.r,
                ),
                borderData: _borderDesign(theme),
                titlesData: _charBorderDataLabel(theme: theme, data: data),

                /// Hides the chart background grid lines.
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// [BarChartGroupData] builder for the chart
  List<BarChartGroupData> _barChartDataBuilder({
    required List<DeliveryChartItem?>? data,
    required ThemeData theme,
    required double barWidth,
    required double barsSpace,
  }) {
    return List.generate(data?.length ?? 0, (index) {
      final singleData = data?[index];
      return BarChartGroupData(
        x: index,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: singleData?.riderFare ?? 0,
            borderRadius: BorderRadius.circular(4),
            width: barWidth,
            color: theme.colorScheme.primary,
            backDrawRodData: BackgroundBarChartRodData(
              color: Colors.grey.shade300,
              show: true,
              toY: 100,
            ),
          ),
        ],
      );
    });
  }

  FlTitlesData _charBorderDataLabel({
    required ThemeData theme,
    required List<DeliveryChartItem?>? data,
  }) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 40.r,
          getTitlesWidget:
              (value, meta) => Transform.rotate(
                angle: math.pi / -4,
                // child: Text(value.toString()),
                child: Text(
                  data?.elementAt(value.toInt())?.label ?? "",
                  style: theme.textTheme.bodySmall,
                ),
              ),

          // Text(BarChartDataModel().daysName(value.toInt())),
          showTitles: true,
        ),
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  /// [Chart_Border] design for the chart
  FlBorderData _borderDesign(ThemeData theme) {
    return FlBorderData(
      border: Border(
        left: BorderSide(color: theme.dividerColor),
        bottom: BorderSide(color: theme.dividerColor),
      ),
    );
  }
}
