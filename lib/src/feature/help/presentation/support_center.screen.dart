import 'package:flutter/material.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/feature/help/presentation/widgets/chat_history_issue.widget.dart';
import 'package:rider/src/feature/help/presentation/widgets/on_going_issue.widget.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        title: "Dinebd Support Center",
        body: SizedBox(
          width: width,
          child: Column(
            children: [
              _tabBar(theme),
              const Expanded(
                child: TabBarView(children: [OnGoingIssue(), ChatHistory()]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _tabBar(ThemeData theme) {
    return Container(
      color: theme.colorScheme.surface,
      child: TabBar(
        dividerColor: theme.colorScheme.onSurface.withValues(alpha: 0.12),
        tabs: const [Tab(text: "Ongoing Issues"), Tab(text: "Chat history")],
      ),
    );
  }
}
