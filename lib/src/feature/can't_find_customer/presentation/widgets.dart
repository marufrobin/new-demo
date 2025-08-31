import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/constant_variable.dart';
import '../../../core/constant/image_path.dart';

class StepHelperWidget extends StatelessWidget {
  final bool isStepActivated;
  final VoidCallback? onPressed;

  final Widget? child;
  final Color? backgroundColor;

  final IconData? icon;
  final String? title;
  final String? subtitle;

  final int stepNumber;
  final String? notes;
  final String? notesInBengali;

  const StepHelperWidget({
    super.key,
    this.child,
    this.backgroundColor,
    required this.isStepActivated,
    required this.onPressed,
    required this.title,
    this.subtitle,
    this.icon,
    required this.stepNumber,
    this.notes,
    this.notesInBengali,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Step: $stepNumber",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        AbsorbPointer(
          absorbing: !isStepActivated,
          child: InkWell(
            onTap: onPressed,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: isStepActivated ? 1 : 0.34,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16.r),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.r,
                      vertical: 10.r,
                    ),
                    decoration: BoxDecoration(
                      color:
                          backgroundColor ??
                          (isStepActivated ? theme.colorScheme.primary : null),
                      border: Border.all(
                        color:
                            isStepActivated
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withValues(
                                  alpha: 0.2,
                                ),
                        width: 1.r,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppConstantVariable.kRadius.r,
                      ),
                    ),
                    child:
                        child ??
                        ListTile(
                          leading:
                              icon == null
                                  ? null
                                  : Icon(
                                    icon,
                                    color:
                                        isStepActivated
                                            ? Colors.white
                                            : theme.colorScheme.onSurface
                                                .withValues(alpha: 0.5),
                                    size: 30.r,
                                  ),
                          title: Text(
                            title ?? "",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color:
                                  isStepActivated
                                      ? Colors.white
                                      : theme.colorScheme.onSurface,
                            ),
                          ),
                          subtitle:
                              subtitle == null
                                  ? null
                                  : Text(
                                    subtitle ?? "",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color:
                                          isStepActivated
                                              ? Colors.white
                                              : theme.colorScheme.onSurface,
                                    ),
                                  ),
                        ),
                  ),
                ),
                if (!isStepActivated)
                  SizedBox(
                    height: 160.r,
                    child: Center(
                      child: SvgPicture.asset(
                        ImagePath.lockIcon,
                        height: 30.r,
                        width: 30.r,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (notes != null) Text(notes ?? "", style: theme.textTheme.bodyMedium),
        12.verticalSpace,
        if (notesInBengali != null)
          Text(notesInBengali ?? "", style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

class TimerCountDownWidget extends StatefulWidget {
  final ThemeData theme;

  final VoidCallback? onFiveMinutesReached;
  final VoidCallback? onTenMinutesReached;
  final VoidCallback? countDownFinished;

  const TimerCountDownWidget({
    super.key,
    required this.theme,
    this.onFiveMinutesReached,
    this.onTenMinutesReached,
    this.countDownFinished,
  });

  @override
  State<TimerCountDownWidget> createState() => _TimerCountDownWidgetState();
}

class _TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer? _timer;

  int _remainingSeconds = 900; // 15 minutes = 900 seconds
  bool _fiveMinuteCallbackTriggered = false;
  bool _secondCallbackTriggered = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);

        /// Trigger callback when 5 minutes are reached (300 seconds)
        if (_remainingSeconds == 600 && !_fiveMinuteCallbackTriggered) {
          _fiveMinuteCallbackTriggered = true;
          widget.onFiveMinutesReached?.call();
        }

        /// Trigger callback when 10 minutes are reached (600 seconds)
        if (_remainingSeconds == 300 && !_secondCallbackTriggered) {
          _secondCallbackTriggered = true;
          widget.onTenMinutesReached?.call();
        }
      } else {
        /// Timer finished
        _timer?.cancel();
        widget.countDownFinished?.call();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(0, -6.r),
        child: Container(
          decoration: BoxDecoration(
            color:
                _secondCallbackTriggered
                    ? widget.theme.colorScheme.error
                    : widget.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(40.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 34.r, vertical: 10.r),
          child: Text(
            _formatTime(_remainingSeconds),
            style: widget.theme.textTheme.bodyLarge?.copyWith(
              color: widget.theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
