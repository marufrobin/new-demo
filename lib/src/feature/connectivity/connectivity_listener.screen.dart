import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_toaster.dart';
import 'bloc/connectivity_bloc.dart';

class ConnectivityListenerScreen extends StatelessWidget {
  const ConnectivityListenerScreen({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        log(state.toString(), name: "ConnectivityListenerScreen");
        if (state is ConnectivityConnected) {
          AppToaster.success(message: "Internet connected", context: context);
          // _showConnectivitySnackBar(
          //   context,
          //   "Internet connected",
          //   theme.colorScheme.primary,
          // );
        } else if (state is ConnectivityInitial) {
          log(state.toString(), name: "ConnectivityListenerScreen");
        } else if (state is ConnectivityDisconnected) {
          AppToaster.error(message: "No internet connection", context: context);
          // _showConnectivitySnackBar(
          //   context,
          //   "No internet connection",
          //   theme.colorScheme.error,
          // );
        }
      },
      child: Stack(
        children: [
          child ?? const SizedBox(),
          Positioned(
            top: 60.r,
            left: 0,
            right: 0,
            child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, state) {
                return _AnimatedMessage(
                  width: width,
                  theme: theme,
                  isConnected:
                      state is ConnectivityConnected ||
                      state is ConnectivityInitial,
                );
              },
            ),
          ),

          /// todo: When user is online and using socket connection
          ///todo: when new jobs are available then show the popup
          ///todo: Also check GraphQL api myOngoingOrders and show the popup
          ///
          // BlocConsumer<MyOnGoingOrdersBloc, MyOnGoingOrdersState>(
          //   listener: (context, state) {
          //     if (state is MyOnGoingOrdersLoaded) {
          //       final deliveryID =
          //           state.myOnGoingOrders?.myOngoingOrders?.first?.id;
          //       context.read<DeliveryOrderBloc>().add(
          //         DeliveryOrderFetchEvent(deliveryID: deliveryID),
          //       );
          //     }
          //   },
          //   builder: (context, state) {
          //     log(name: "state", state.toString());
          //     log(
          //       name:
          //           "state is MyOnGoingOrdersLoaded ${state is MyOnGoingOrdersLoaded}",
          //       "${state is MyOnGoingOrdersLoaded ? state.myOnGoingOrders?.myOngoingOrders?.isNotEmpty : null}",
          //     );
          //
          //     if (state is MyOnGoingOrdersLoaded) {
          //       return JobsWidget(
          //         deliveryID: state.myOnGoingOrders?.myOngoingOrders?.first?.id,
          //         isVisible:
          //             (state.myOnGoingOrders?.myOngoingOrders?.isNotEmpty ??
          //                 false),
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}

class _AnimatedMessage extends StatelessWidget {
  const _AnimatedMessage({
    super.key,
    required this.width,
    required this.theme,
    required this.isConnected,
  });

  final double width;
  final ThemeData theme;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedCrossFade(
        firstChild: _firstWidget(),
        secondChild: const SizedBox(),
        // secondChild: _secondWidget(),
        crossFadeState:
            isConnected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  Container _firstWidget() {
    return Container(
      width: width,
      height: 40.r,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      margin: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.error,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Row(
          spacing: 10.r,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, color: theme.colorScheme.onError),
            Text(
              'No internet connection',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _secondWidget() {
    return Container(
      width: width,
      height: 40.r,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      margin: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Row(
          spacing: 10.r,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi, color: Colors.green),
            Text(
              'Internet connection restored',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
