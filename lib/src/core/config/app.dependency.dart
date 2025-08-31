import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:rider/src/core/clients/app_http.client.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/services/storage/app_secure.storage.dart';
import 'package:rider/src/feature/auth/auth_repository.dart';
import 'package:rider/src/feature/auth/forgot_password/bloc/forgot_password_bloc.dart';

import '../../feature/auth/auth_app_entry_point.dart';
import '../clients/app_graphql.client.dart';
import '../clients/socket_service.client.dart';
import '../services/app_audio_player.service.dart';

/*------------------------------------------------------------------------------
 * Setup Background Dependency Injection
 ---------------------------------------------------------------------------------*/
void setupBackgroundDependencyInjection() {
  // Check if already initialized to avoid duplicate registration
  if (getIt.isRegistered<AppSecureStorage>()) {
    return;
  }

  // Register only the dependencies needed for background tasks
  // This creates a NEW INSTANCE but reads from the SAME secure storage
  // getIt.registerLazySingleton<AppSecureStorage>(() => AppSecureStorage());
  getIt.registerLazySingleton<AppGraphqlClient>(() => AppGraphqlClient());
}
/*------------------------------------------------------------------------------ */

/*------------------------------------------------------------------------------
  Setup App Dependency Injection
-------------------------------------------------------------------------------- */
final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  /// Register the [AppSecureStorage] singleton
  getIt.registerLazySingleton<AppSecureStorage>(() => AppSecureStorage());

  /// Register the [AppHttpClient] singleton
  getIt.registerLazySingleton<AppHttpClient>(() => AppHttpClient());

  /// Register the [AuthRepositoryImpl] singleton
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
      appHttpClient: getIt<AppHttpClient>(),
      secureStorage: getIt<AppSecureStorage>(),
    ),
  );

  getIt.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(authService: getIt<AuthRepositoryImpl>()),
  );

  /// Register the [FlutterToast] singleton
  getIt.registerLazySingleton<FToast>(
    () => FToast()..init(rootNavigatorKey.currentContext!),
  );

  /// Register the [AppGraphqlClient] singleton
  getIt.registerLazySingleton<AppGraphqlClient>(() => AppGraphqlClient());

  /// Register the [AuthAppEntryPoint] singleton
  getIt.registerLazySingleton<AuthAppEntryPoint>(() => AuthAppEntryPoint());

  /// Register the [SocketService] singleton
  getIt.registerLazySingleton<SocketService>(() => SocketService());

  /// Register the [AppAudioPlayer] singleton
  getIt.registerLazySingleton<AppAudioPlayer>(() => AppAudioPlayer());
}

/*------------------------------------------------------------------------------ */
