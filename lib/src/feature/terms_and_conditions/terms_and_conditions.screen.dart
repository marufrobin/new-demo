import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/feature/terms_and_conditions/queries.dart';

import '../../model/page.model.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  PageModel? _termsAndConditions;
  bool _isLoading = false;

  Future<void> _fetchTermsAndConditions() async {
    try {
      setState(() => _isLoading = true);
      _termsAndConditions =
          await TermsAndConditionsQueries().getTermsAndConditions();
    } catch (e) {
      log(error: e, "Error on get terms and conditions");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    _fetchTermsAndConditions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      backgroundColor: theme.colorScheme.surface,
      title: "Terms and conditions",
      isLoading: _isLoading,
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _fetchTermsAndConditions(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(16.r),
              child: Html(data: _termsAndConditions?.body ?? ""),
            ),
          ),
        ),
      ), // TODO: Add terms and conditions
    );
  }
}
