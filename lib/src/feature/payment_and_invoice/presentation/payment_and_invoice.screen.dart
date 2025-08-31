import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/feature/account/bloc/user_bloc/user_bloc.dart';
import 'package:rider/src/feature/payment_and_invoice/bloc/invoices_bloc/invoices_bloc.dart';
import 'package:rider/src/feature/payment_and_invoice/presentation/widgets.dart';
import 'package:rider/src/model/invoices.model.dart';

import '../../../core/common/widget/app_overlay_loading.widget.dart';
import '../../../core/utils/app_date_formate.dart';
import '../../../core/utils/app_toaster.dart';
import '../bloc/sending_email_bloc/sending_invoices_bloc.dart';

class PaymentAndInvoiceScreen extends StatefulWidget {
  const PaymentAndInvoiceScreen({super.key});

  @override
  State<PaymentAndInvoiceScreen> createState() =>
      _PaymentAndInvoiceScreenState();
}

class _PaymentAndInvoiceScreenState extends State<PaymentAndInvoiceScreen> {
  final _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    context.read<UserBloc>().add(UserDataFetchingEvent());
    context.read<InvoicesBloc>().add(InvoicesFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrolledToEnd) {
      context.read<InvoicesBloc>().add(const InvoicesFetchMoreEvent());
    }
  }

  bool get _isScrolledToEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= maxScroll;
  }

  _onRefresh() {
    context.read<UserBloc>().add(UserDataFetchingEvent());
    context.read<InvoicesBloc>().add(InvoicesFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Payment & Invoice",
      isLoading: isLoading,
      actions: [
        AppIconButton(
          onPressed: () {
            context.pushNamed(AppRoutesNames.helpScreen);
          },
          icon: const Icon(Icons.question_mark_rounded),
          padding: EdgeInsets.zero,
          fixedSize: Size(36.r, 36.r),
        ),
      ],
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(16.0.r),
          child: BlocBuilder<InvoicesBloc, InvoicesState>(
            builder: (context, state) {
              if (state is InvoicesLoading) {
                return AppOverlayLoadingWidget(height: height, width: width);
              }

              if (state is InvoicesError) {
                return _errorWidget(
                  context: context,
                  width: width,
                  state: state,
                  theme: theme,
                );
              }

              if (state is InvoicesData) {
                return Column(
                  children: [
                    _body(state),

                    if (state.isMoreLoading)
                      AppOverlayLoadingWidget(
                        height: 100.r,
                        width: width,
                        overlayColor: Colors.transparent,
                      ),

                    if (state.isNoMoreData)
                      NoMoreDataWidget(
                        theme: theme,
                        width: width,
                        message: "No more data",
                      ),
                  ],
                );
              } else {
                return NoMoreDataWidget(
                  theme: theme,
                  width: width,
                  onRefreshPressed: () {
                    context.read<InvoicesBloc>().add(InvoicesFetchEvent());
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _body(InvoicesData state) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (userContext, userState) {
        return BlocConsumer<SendingEmailBloc, SendingEmailState>(
          listener: (sendingContext, sendingState) {
            if (sendingState is InvoicesSendEmailSuccess) {
              AppToaster.success(
                context: sendingContext,
                message: "Email sent successfully!",
              );
            }
            if (sendingState is InvoicesSendingEmailError) {
              AppToaster.error(
                context: sendingContext,
                message: sendingState.errorMessage,
              );
            }
          },
          builder: (sendingContext, sendingState) {
            return _PaymentAndInvoiceView(
              invoices: state.invoices?.nodes,
              onSendEmailOnPressed: (invoice) async {
                setState(() => isLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                try {
                  final riderId =
                      userState is UserData ? userState.userModel?.id : null;

                  log(name: 'riderId', riderId.toString());
                  log(name: 'invoiceId', "${invoice?.id}");

                  context.read<SendingEmailBloc>().add(
                    InvoicesSendEmailEvent(
                      invoiceId: invoice?.id,
                      riderId: riderId,
                    ),
                  );
                } catch (e) {
                  AppToaster.error(context: context, message: e.toString());
                } finally {
                  setState(() => isLoading = false);
                }
              },
            );
          },
        );
      },
    );
  }

  NoMoreDataWidget _errorWidget({
    required ThemeData theme,
    required double width,
    required BuildContext context,
    required InvoicesError state,
  }) {
    return NoMoreDataWidget(
      theme: theme,
      width: width,
      message: state.errorMessage,
      onRefreshPressed: () => _onRefresh(),
    );
  }
}

class _PaymentAndInvoiceView extends StatelessWidget {
  const _PaymentAndInvoiceView({
    super.key,
    this.invoices,
    required this.onSendEmailOnPressed,
  });

  final List<InvoiceModel?>? invoices;

  final Function(InvoiceModel? invoice)? onSendEmailOnPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final invoice = invoices?.elementAt(index);

        return _PaymentAndInvoiceCardWidget(
          date: invoice?.createdAt ?? DateTime.now(),
          invoiceId: invoice?.uid,
          totalDelivery: invoice?.items?.length,
          totalIncome: invoice?.incomeAmount,
          viewInvoiceOnPressed: () {
            context.pushNamed(
              AppRoutesNames.paymentAndInvoiceDetailsScreen,
              pathParameters: {"invoiceId": invoice?.id ?? ""},
            );
          },
          onSendEmailOnPressed: () => onSendEmailOnPressed?.call(invoice),
        );
      },
      itemCount: invoices?.length,
    );
  }
}

class _PaymentAndInvoiceCardWidget extends StatelessWidget {
  const _PaymentAndInvoiceCardWidget({
    super.key,
    required this.date,
    required this.invoiceId,
    required this.totalDelivery,
    required this.totalIncome,
    required this.viewInvoiceOnPressed,
    required this.onSendEmailOnPressed,
  });

  final DateTime? date;
  final String? invoiceId;
  final int? totalDelivery;
  final double? totalIncome;

  final VoidCallback? viewInvoiceOnPressed;
  final VoidCallback? onSendEmailOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppElevationContainerWidget(
      margin: EdgeInsets.symmetric(vertical: 6.r),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.r,
        children: [
          infoText(
            context: context,
            title: "Date",
            value: AppDateTimeFormat.dateFormat(date: date),
          ),
          infoText(
            context: context,
            title: "Invoice ID",
            value: invoiceId ?? "",
          ),
          infoText(
            context: context,
            title: "Total delivery",
            value: "${totalDelivery ?? 0}",
          ),
          infoText(
            context: context,
            title: "Total income",
            value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
              moneyAmount: totalIncome,
            ),
          ),
          Row(
            spacing: 16.r,
            children: [
              AppButton(
                buttonLabel: "View invoice",
                onPressed: viewInvoiceOnPressed,
                size: ButtonSize.SM,
                visualDensity: VisualDensity.compact,
              ),
              AppButton(
                buttonLabel: "Send to email",
                onPressed: onSendEmailOnPressed,
                size: ButtonSize.SM,
                visualDensity: VisualDensity.compact,
                variant: ButtonVariant.SUBTLE,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text infoText({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$title:",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: " $value",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
