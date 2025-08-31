import 'package:flutter/material.dart';
import 'package:rider/src/core/common/widget/app_overlay_loading.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.hideAppBar = false,
    this.appBar,
    required this.body,
    this.onBackPressed,
    required this.title,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.actions,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.isLoading = false,
    this.bottomNavigationBar,
    this.bottomSheet,
  });

  final bool hideAppBar;

  final String title;

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? actions;

  final VoidCallback? onBackPressed;

  final bool extendBody;
  final bool extendBodyBehindAppBar;

  final bool isLoading;
  final Color? backgroundColor;

  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Scaffold(
      key: key,
      appBar:
          appBar ??
          (hideAppBar ? null : _appBar(context: context, theme: theme)),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: Stack(
        children: [
          body,
          isLoading
              ? AppOverlayLoadingWidget(height: height, width: width)
              : const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor:
          backgroundColor ?? theme.colorScheme.surface.withValues(alpha: 0.92),
    );
  }

  AppBar _appBar({required BuildContext context, required ThemeData theme}) {
    return AppBar(
      title: Text(title),
      surfaceTintColor: Colors.transparent,
      leading: Tooltip(
        message: 'Back',
        child: AppIconButton(
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          backgroundColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      actions: actions,
    );
  }
}
