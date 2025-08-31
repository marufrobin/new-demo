import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/core/constant/app_storage_key.dart';
import 'package:rider/src/core/services/storage/app_secure.storage.dart';

/// Global handler for background push notifications
Future<void> handleBackgroundPushNotifications(
  RemoteMessage remoteMessage,
) async {
  log(
    'Background notification received: ${remoteMessage.messageId}',
    name: 'BackgroundNotification',
  );
}

class FirebaseNotificationClient {
  static final FirebaseNotificationClient _instance =
      FirebaseNotificationClient._internal();

  factory FirebaseNotificationClient() => _instance;

  FirebaseNotificationClient._internal();

  // Core services
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  Dio _dio = Dio();

  // Notification channel configuration
  static const AndroidNotificationChannel _notificationChannel =
      AndroidNotificationChannel(
        'dinebd_rider_app',
        'Dinebd Rider App',
        description: 'Push notifications for Dinebd Rider App',
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
      );

  /// Initialize all notification services
  Future<void> initialize() async {
    try {
      _firebaseMessaging = FirebaseMessaging.instance;
      _localNotifications = FlutterLocalNotificationsPlugin();
      _dio = Dio();
      await _requestPermissions();
      await _setupFCMToken();
      await _initializeLocalNotifications();
      await _setupPushNotificationHandlers();

      // Set up background message handler
      FirebaseMessaging.onBackgroundMessage(handleBackgroundPushNotifications);

      log(
        'Firebase notification services initialized successfully',
        name: 'FirebaseClient',
      );
    } catch (e) {
      log(
        'Failed to initialize Firebase notifications: $e',
        name: 'FirebaseClient error',
      );
      rethrow;
    }
  }

  /// Request notification permissions from the user
  Future<void> _requestPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      log('Notification permissions denied', name: 'FirebaseClient permission');
    }
  }

  /// Setup and store FCM token
  Future<void> _setupFCMToken() async {
    final fcmToken = await _getFCMTokenWithRetry();
    final secureStorage = getIt<AppSecureStorage>();

    if (fcmToken == null) {
      throw Exception('Failed to retrieve FCM token after multiple attempts');
    }

    await secureStorage.set(key: AppStorageKey.kFCMToken, value: fcmToken);

    log('FCM token stored successfully', name: 'FirebaseClient store token');

    // Listen for token refresh
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      await secureStorage.set(key: AppStorageKey.kFCMToken, value: newToken);
      log('FCM token refreshed', name: 'FirebaseClient toekn refresh');
    });
  }

  /// Get FCM token with retry logic for iOS APNS token issues
  Future<String?> _getFCMTokenWithRetry({int maxRetries = 5}) async {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        // if (Platform.isIOS) {
        //   // Wait for APNS token to be available on iOS
        //   final apnsToken = await _firebaseMessaging.getAPNSToken();
        //   if (apnsToken == null) {
        //     log(
        //       'APNS token not available, attempt $attempt/$maxRetries',
        //       name: 'FirebaseClient',
        //     );
        //     if (attempt < maxRetries) {
        //       await Future.delayed(
        //         Duration(seconds: attempt * 2),
        //       ); // Exponential backoff
        //       continue;
        //     } else {
        //       log(
        //         'APNS token not available after $maxRetries attempts',
        //         name: 'FirebaseClient',
        //       );
        //       return null;
        //     }
        //   }
        //   log('APNS token retrieved successfully', name: 'FirebaseClient');
        // }

        final fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          log(
            'FCM token retrieved successfully on attempt $attempt',
            name: 'FirebaseClient',
          );
          return fcmToken;
        }
      } catch (e) {
        log('Attempt $attempt failed: $e', name: 'FirebaseClient');
        if (attempt < maxRetries) {
          await Future.delayed(Duration(seconds: attempt * 2));
        } else {
          log(
            'Failed to get FCM token after $maxRetries attempts: $e',
            name: 'FirebaseClient',
          );
        }
      }
    }
    return null;
  }

  /// Initialize local notification settings
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );

    // Create notification channel for Android
    if (Platform.isAndroid) {
      final androidPlugin =
          _localNotifications
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      await androidPlugin?.createNotificationChannel(_notificationChannel);
    }
  }

  /// Setup push notification message handlers
  Future<void> _setupPushNotificationHandlers() async {
    // Configure foreground notification presentation
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle notification when app is opened from terminated state
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationOpen(initialMessage);
    }

    // Handle notification when app is opened from background state
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationOpen);

    // Handle notifications when app is in foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
  }

  /// Handle foreground notifications
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    log(
      'Foreground notification received: ${message.messageId}',
      name: 'FirebaseClient',
    );

    final notification = message.notification;
    if (notification == null) return;

    try {
      final bigPictureStyle = await _createBigPictureStyle(message);

      await _localNotifications.show(
        message.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _notificationChannel.id,
            _notificationChannel.name,
            channelDescription: _notificationChannel.description,
            importance: Importance.max,
            priority: Priority.high,
            fullScreenIntent: true,
            styleInformation: bigPictureStyle,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    } catch (e) {
      log('Error showing local notification: $e', name: 'FirebaseClient');
    }
  }

  /// Create big picture style for Android notifications with images
  Future<BigPictureStyleInformation?> _createBigPictureStyle(
    RemoteMessage message,
  ) async {
    final imageUrl = _getImageUrl(message);
    if (imageUrl == null || !Platform.isAndroid) return null;

    try {
      final response = await _dio.get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final base64Image = base64Encode(response.data);
      final bitmap = ByteArrayAndroidBitmap.fromBase64String(base64Image);

      return BigPictureStyleInformation(
        bitmap,
        largeIcon: bitmap,
        contentTitle: message.notification?.title,
        summaryText: message.notification?.body,
      );
    } catch (e) {
      log('Failed to download notification image: $e', name: 'FirebaseClient');
      return null;
    }
  }

  /// Extract image URL from notification based on platform
  String? _getImageUrl(RemoteMessage message) {
    if (Platform.isAndroid) {
      return message.notification?.android?.imageUrl;
    } else if (Platform.isIOS) {
      return message.notification?.apple?.imageUrl;
    }
    return null;
  }

  /// Handle notification tap from local notifications
  void _handleNotificationTap(NotificationResponse response) {
    log('Notification tapped: ${response.id}', name: 'FirebaseClient');

    if (response.payload != null) {
      try {
        final messageData = jsonDecode(response.payload!);
        _processNotificationData(messageData);
      } catch (e) {
        log(
          'Error processing notification payload: $e',
          name: 'FirebaseClient',
        );
      }
    }
  }

  /// Handle notification when app is opened from notification
  void _handleNotificationOpen(RemoteMessage message) {
    log(
      'App opened from notification: ${message.messageId}',
      name: 'FirebaseClient',
    );
    _processNotificationData(message.toMap());
  }

  /// Process notification data and navigate accordingly
  void _processNotificationData(Map<String, dynamic> data) {
    // Add your navigation logic here based on notification data
    // Example:
    // final screen = data['screen'];
    // final id = data['id'];
    // NavigationService.navigateTo(screen, arguments: {'id': id});

    log('Processing notification data: $data', name: 'FirebaseClient');
  }

  /// Get current FCM token
  Future<String?> getCurrentToken() async {
    try {
      // if (Platform.isIOS) {
      //   // Check if APNS token is available first
      //   final apnsToken = await _firebaseMessaging.getAPNSToken();
      //   if (apnsToken == null) {
      //     log(
      //       'APNS token not available, cannot get FCM token',
      //       name: 'FirebaseClient',
      //     );
      //     return null;
      //   }
      // }
      final token = await _firebaseMessaging.getToken();
      log(name: "FCM Token", token.toString());
      return token;
    } catch (e) {
      log('Error getting FCM token: $e', name: 'FirebaseClient');
      return null;
    }
  }

  /// Get FCM token with proper iOS handling
  Future<String?> getFCMTokenSafely() async {
    return await _getFCMTokenWithRetry();
  }

  /// Clear all notifications
  Future<void> clearAllNotifications() async {
    await _localNotifications.cancelAll();
  }

  /// Clear specific notification
  Future<void> clearNotification(int id) async {
    await _localNotifications.cancel(id);
  }
}
