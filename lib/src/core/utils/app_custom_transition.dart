import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppCustomTransition {
  static const _duration = Duration(milliseconds: 300);

  static CustomTransitionPage<T> slideFromLeft<T>({required Widget child}) {
    return _buildSlideTransition<T>(
      child: child,
      beginOffset: const Offset(-1.0, 0.0),
    );
  }

  static CustomTransitionPage<T> slideFromRight<T>({required Widget child}) {
    return _buildSlideTransition<T>(
      child: child,
      beginOffset: const Offset(1.0, 0.0),
    );
  }

  static CustomTransitionPage<T> slideFromTop<T>({required Widget child}) {
    return _buildSlideTransition<T>(
      child: child,
      beginOffset: const Offset(0.0, -1.0),
    );
  }

  static CustomTransitionPage<T> slideFromBottom<T>({required Widget child}) {
    return _buildSlideTransition<T>(
      child: child,
      beginOffset: const Offset(0.0, 1.0),
    );
  }

  static CustomTransitionPage<T> _buildSlideTransition<T>({
    required Widget child,
    required Offset beginOffset,
  }) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: _duration,
      reverseTransitionDuration: _duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: beginOffset, end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
