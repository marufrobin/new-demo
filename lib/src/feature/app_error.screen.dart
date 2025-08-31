import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Error",
      body: SafeArea(
        child: Column(
          children: [
            SelectableText("Error: ${state.error}"),
            SelectableText("Path: ${state.path}"),
          ],
        ),
      ),
    );
  }
}
