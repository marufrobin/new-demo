import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/app_enum.dart';

class PaymentTagWidget extends StatelessWidget {
  const PaymentTagWidget({super.key, this.type, this.size});

  final ParcelPaymentType? type;

  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 4.r),
        decoration: BoxDecoration(
          color: type?.color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Text(
          type?.label ?? "Unknown",
          style: TextStyle(
            color: type?.color,
            fontWeight: FontWeight.bold,
            fontSize: (size ?? 14).r,
          ),
        ),
      ),
    );
  }
}
