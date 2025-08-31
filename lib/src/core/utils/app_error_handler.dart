import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A global error handler for Flutter applications that captures errors,
/// displays toast notifications, and logs error information.
class AppErrorHandler {
  // Singleton instance
  static final AppErrorHandler _instance = AppErrorHandler._internal();

  factory AppErrorHandler() => _instance;

  AppErrorHandler._internal();

  // Configuration options
  bool _showErrorToasts = true;
  bool _logErrors = true;
  Function(Object error, StackTrace? stackTrace)? _onErrorCallback;

  /// Initialize the global error handler
  void initialize({
    bool showErrorToasts = true,
    bool logErrors = true,
    Function(Object error, StackTrace? stackTrace)? onError,
  }) {
    _showErrorToasts = showErrorToasts;
    _logErrors = logErrors;
    _onErrorCallback = onError;

    // Set up Flutter error handling
    FlutterError.onError = _handleFlutterError;

    // Handle errors that occur in the Dart runtime
    PlatformDispatcher.instance.onError = _handlePlatformError;

    // Capture errors from the Zone
    runZonedGuarded(() {
      // Your app will be wrapped in this zone
    }, _handleZoneError);
  }

  /// Wrap your [MaterialApp] with this method to handle errors
  /// ```dart
  /// void main() {
  ///   AppErrorHandler().initialize();
  ///   runApp(AppErrorHandler().wrapApp(MyApp()));
  /// }
  /// ```
  Widget wrapApp(Widget app) {
    return runZonedGuarded(() => app, _handleZoneError) as Widget;
  }

  /// Handle Flutter framework errors
  void _handleFlutterError(FlutterErrorDetails details) {
    _processError(details.exception, details.stack);
  }

  /// Handle platform errors
  bool _handlePlatformError(Object error, StackTrace stackTrace) {
    _processError(error, stackTrace);
    // Return true to prevent the error from being handled by the platform
    return true;
  }

  /// Handle errors caught in the Zone
  void _handleZoneError(Object error, StackTrace stackTrace) {
    _processError(error, stackTrace);
  }

  /// Process errors in a standardized way
  void _processError(Object error, StackTrace? stackTrace) {
    // 1. Show toast notification if enabled
    if (_showErrorToasts) {
      _showErrorToast(error);
    }

    // 2. Log error if enabled
    if (_logErrors) {
      _logError(error, stackTrace);
    }

    // 3. Call custom error handler if provided
    if (_onErrorCallback != null) {
      _onErrorCallback!(error, stackTrace);
    }
  }

  /// Show a toast notification for the error
  void _showErrorToast(Object error) {
    String errorMessage = _getReadableErrorMessage(error);

    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0.r,
    );
    // if (rootNavigatorKey.currentContext != null &&
    //     rootNavigatorKey.currentContext!.mounted) {
    //   AppToaster.error(
    //     message: errorMessage,
    //     context: rootNavigatorKey.currentContext!,
    //   );
    // }
  }

  /// Log the error and stack trace
  void _logError(Object error, StackTrace? stackTrace) {
    if (kDebugMode) {
      print('ERROR: $error');
      if (stackTrace != null) {
        print('STACK TRACE: $stackTrace');
      }
    }

    // You could integrate with a logging service here
    // Example: FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  /// Create a user-friendly error message
  String _getReadableErrorMessage(Object error) {
    if (error is SocketException) {
      return 'Network error. Please check your connection.';
    } else if (error is HttpException) {
      return 'Server error. Please try again later.';
    } else if (error is FormatException) {
      return 'Data format error. Please contact support.';
    } else if (error is PlatformException) {
      return 'Application error: ${error.message}';
    } else if (error is TimeoutException) {
      return 'Connection timed out. Please try again.';
    } else if (error is AssertionError) {
      return 'Application error. Please contact support.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Manual error reporting method
  void reportError(Object error, [StackTrace? stackTrace]) {
    _processError(error, stackTrace ?? StackTrace.current);
  }
}

/// Extension method for BuildContext to easily show error toasts
extension ErrorHandlingContext on BuildContext {
  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
