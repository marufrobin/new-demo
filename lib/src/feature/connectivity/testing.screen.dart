import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import 'bloc/connectivity_bloc.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Testing",
      body: Column(
        spacing: 10.r,
        children: [
          const Text("Testing internet connection listener"),
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (context, state) {
              if (state is ConnectivityConnected) {
                AppToaster.success(
                  message: "Internet connection restored",
                  context: context,
                );
              } else if (state is ConnectivityDisconnected) {
                AppToaster.error(
                  message: "No internet connection",
                  context: context,
                );
              } else {
                AppToaster.error(
                  message: "Something went wrong",
                  context: context,
                );
              }
            },
            child: Container(
              child: SelectableText(
                "Testing internet connection listener${DateTime.now()}",
              ),
            ),
          ),

          const Text("Testing internet connection"),

          BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              return Container(child: SelectableText(state.toString()));
            },
          ),

          120.verticalSpace,
          SelectableText("Is Connected :${isConnected}"),
          IconButton(
            onPressed: () async {
              final isConnect =
                  await InternetConnectionChecker.instance.hasConnection;
              log(name: "isConnected", isConnect.toString());
              setState(() {
                isConnected = isConnect;
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
