import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_date_formate.dart';
import 'package:rider/src/feature/payment_and_invoice/bloc/sending_email_bloc/sending_invoices_bloc.dart';
import 'package:rider/src/feature/payment_and_invoice/presentation/widgets.dart';
import 'package:rider/src/model/rider_reference.model.dart';

import '../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../core/utils/app_toaster.dart';
import '../../../model/invoices.model.dart';
import '../bloc/invoice_bloc/invoice_bloc.dart';

class PaymentAndInvoiceDetailsScreen extends StatefulWidget {
  const PaymentAndInvoiceDetailsScreen({super.key, required this.invoiceId});

  final String? invoiceId;

  @override
  State<PaymentAndInvoiceDetailsScreen> createState() =>
      _PaymentAndInvoiceDetailsScreenState();
}

class _PaymentAndInvoiceDetailsScreenState
    extends State<PaymentAndInvoiceDetailsScreen> {
  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    if (widget.invoiceId != null) {
      context.read<InvoiceBloc>().add(
        InvoiceFetchEvent(invoiceId: widget.invoiceId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return BlocBuilder<InvoiceBloc, InvoiceState>(
      builder: (context, state) {
        if (state is InvoiceError) {
          return _errorWidget(
            context: context,
            width: width,
            state: state,
            theme: theme,
          );
        }
        final data =
            state is InvoiceData ? state : const InvoiceData(invoice: null);

        return AppScaffold(
          title: "Payment & Invoice",
          backgroundColor: theme.colorScheme.surface,
          isLoading: state is InvoiceLoading,
          body: AppRefreshIndicatorWidget(
            isScrollNotificationNeeded: false,
            onRefresh: () async => _onRefresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6.r,
                  children: [
                    _screenPadding(
                      child: AppAssetImageWidget(
                        imagePath: ImagePath.logo,
                        height: 40.r,
                      ),
                    ),
                    _screenPadding(
                      child: Text(
                        "Your daily earning summary, ${data.invoice?.rider?.name}",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                    _divider(theme),
                    _screenPadding(
                      child: _RiderInfoWidget(
                        themeData: theme,
                        rider: data.invoice?.rider,
                      ),
                    ),
                    _divider(theme),
                    _screenPadding(
                      child: _InvoiceDetails(
                        themeData: theme,
                        invoice: data.invoice,
                      ),
                    ),
                    _divider(theme),
                    _EarningSummary(
                      themeData: theme,
                      items: data.invoice?.items,
                    ),
                    16.verticalSpace,
                    _screenPadding(
                      child: BlocConsumer<SendingEmailBloc, SendingEmailState>(
                        listener: (context, state) {
                          if (state is InvoicesSendEmailSuccess) {
                            AppToaster.success(
                              message: "Email sent successfully!",
                              context: context,
                            );
                          }
                          if (state is InvoicesSendingEmailError) {
                            AppToaster.error(
                              message: state.errorMessage,
                              context: context,
                            );
                          }
                        },
                        builder: (context, state) {
                          return AppButton(
                            buttonLabel: "Send to email",
                            isLoading: state is InvoiceSendingEmailLoading,
                            onPressed: () {
                              context.read<SendingEmailBloc>().add(
                                InvoicesSendEmailEvent(
                                  invoiceId: data.invoice?.id,
                                  riderId: data.invoice?.rider?.riderId,
                                ),
                              );
                            },
                            size: ButtonSize.LG,
                            variant: ButtonVariant.SUBTLE,
                          );
                        },
                      ),
                    ),
                    120.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  NoMoreDataWidget _errorWidget({
    required ThemeData theme,
    required double width,
    required BuildContext context,
    required InvoiceError state,
  }) {
    return NoMoreDataWidget(
      theme: theme,
      width: width,
      message: state.errorMessage,
      onRefreshPressed: () => _onRefresh(),
    );
  }

  Divider _divider(ThemeData theme) => Divider(
    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
    thickness: 2,
  );

  Widget _screenPadding({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: child,
    );
  }
}

class _RiderInfoWidget extends StatelessWidget {
  const _RiderInfoWidget({super.key, required this.themeData, this.rider});

  final ThemeData themeData;
  final RiderReferenceModel? rider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.r,
      children: [
        Text("Pay to", style: themeData.textTheme.bodySmall),
        Text(rider?.name ?? "", style: themeData.textTheme.titleMedium),
        4.verticalSpace,
        _infoWidget(title: "Rider ID", value: rider?.serialNumber ?? ""),
        _infoWidget(title: "Phone", value: rider?.contactNumber ?? ""),
        _infoWidget(title: "Email", value: rider?.email ?? ""),
      ],
    );
  }

  Text _infoWidget({required String title, required String value}) {
    return Text.rich(
      TextSpan(
        text: "$title:",
        children: [
          TextSpan(text: " $value", style: themeData.textTheme.titleSmall),
        ],
      ),
    );
  }
}

class _InvoiceDetails extends StatelessWidget {
  const _InvoiceDetails({super.key, required this.themeData, this.invoice});

  final ThemeData themeData;
  final InvoiceModel? invoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.r,
      children: [
        Text("Invoice details", style: themeData.textTheme.titleMedium),
        4.verticalSpace,
        _infoWidget(
          title: "Invoice date",
          value: AppDateTimeFormat.dateFormat(date: invoice?.createdAt),
        ),
        _infoWidget(title: "Invoice ID", value: invoice?.uid ?? ""),
      ],
    );
  }

  Text _infoWidget({required String title, required String value}) {
    return Text.rich(
      TextSpan(
        text: "$title:",
        children: [
          TextSpan(text: " $value", style: themeData.textTheme.titleSmall),
        ],
      ),
    );
  }
}

class _EarningSummary extends StatelessWidget {
  const _EarningSummary({super.key, required this.themeData, this.items});

  final ThemeData themeData;

  final List<InvoiceItemsModel?>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.r,
      children: [
        _screenPadding(
          child: Text(
            "Earning summary",
            style: themeData.textTheme.titleMedium,
          ),
        ),
        4.verticalSpace,
        _screenPadding(
          child: _infoWidget(
            title: "Order ID",
            firstFontWeight: FontWeight.bold,
            value: "Income",
            secondFontWeight: FontWeight.bold,
          ),
        ),
        _divider(themeData),
        _screenPadding(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 10.verticalSpace,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = items?.elementAt(index);

              return _infoWidget(
                title: item?.deliveryUID ?? "",
                value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
                  moneyAmount: item?.riderFare,
                ),
              );
            },
            itemCount: items?.length ?? 0,
          ),
        ),
        _divider(themeData),
        _screenPadding(
          child: _infoWidget(
            title: "Total income",
            value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
              moneyAmount: items?.fold(
                0,
                (previousValue, element) =>
                    (previousValue ?? 0) + (element?.riderFare ?? 0),
              ),
            ),
            secondFontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _screenPadding({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: child,
    );
  }

  Divider _divider(ThemeData theme) => Divider(
    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
    thickness: 2,
  );

  Widget _infoWidget({
    required String title,
    required String value,
    FontWeight firstFontWeight = FontWeight.normal,
    FontWeight? secondFontWeight = FontWeight.normal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: themeData.textTheme.titleSmall?.copyWith(
            fontWeight: firstFontWeight,
          ),
        ),
        16.horizontalSpace,
        Text(
          value,
          style: themeData.textTheme.titleSmall?.copyWith(
            fontWeight: secondFontWeight,
          ),
        ),
      ],
    );
    // return Text.rich(
    //   TextSpan(
    //     text: "$title:",
    //     children: [
    //       TextSpan(
    //         text: " $value",
    //         style: themeData.textTheme.titleSmall,
    //       ),
    //     ],
    //   ),
    // );
  }
}
