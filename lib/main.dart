import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/clients/firebase_notification.client.dart';
import 'package:rider/src/core/config/app.bloc_provider_resolver.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/services/app_background_service.dart';
import 'package:rider/src/core/theme/cubit/theme_cubit.dart';
import 'package:rider/src/core/theme/theme.dart';
import 'package:rider/src/core/utils/app_error_handler.dart';
import 'package:rider/src/feature/connectivity/connectivity_listener.screen.dart';

import 'firebase_options.dart';
import 'src/core/config/app.dependency.dart';

/*------------------------------------------------------------------------------
 * This is the main entry point for the application.
-------------------------------------------------------------------------------- */
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    /*
* * -------------------------------------------------------------------------------
*   Hydrated bloc
* -------------------------------------------------------------------------------*/
    Firebase.initializeApp(
      name: "dinebdriderapp",
      options: DefaultFirebaseOptions.currentPlatform,
    );
    /*
* * -------------------------------------------------------------------------------
*   Hydrated bloc
* -------------------------------------------------------------------------------*/
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getApplicationDocumentsDirectory()).path,
      ),
    );
    /*
--------------------------------------------------------------------------------
  * Load the environment variables from the .env file
  * This is used to set the environment variables for the app
-------------------------------------------------------------------------------- */
    await dotenv.load(fileName: /*kDebugMode ? ".env.stage" :*/ ".env.prod");
    AppUrlsConfiguration.initialize();
    /*
* -------------------------------------------------------------------------------
*   App Error Handler
* -------------------------------------------------------------------------------*/
    AppErrorHandler().initialize();
    /*
---------------------------------------------------------------------------------
   /// Setup dependency injection
--------------------------------------------------------------------------------- */
    setupDependencyInjection();
    /*
* -------------------------------------------------------------------------------
*   Firebase notification
* ------------------------------------------------------------------------------- */
    await FirebaseNotificationClient().initialize();
    /*
-------------------------------------------------------------------------------- */

    /*
* -----------------------------------------------------------------------------
    * BACKGROUND SERVICE FOR PLAYING RINGTONE
* ------------------------------------------------------------------------------*/
    await initializeBackgroundService();
    await startBackgroundService();
    /*
------------------------------------------------------------------------------
     */
  } catch (e) {
    log(error: e, "Error on main");
  } finally {
    runApp(
      AppErrorHandler().wrapApp(
        MultiRepositoryProvider(
          providers: AppBlocProviderResolver.repositoriesProviders,
          child: MultiBlocProvider(
            providers: AppBlocProviderResolver.providers,
            child: const RootApp(),
          ),
        ),
      ),
    );
  }
}

/*------------------------------------------------------------------------------ */

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return GraphQLProvider(
          client: AppGraphqlClient.gqlClient,
          child: ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: false,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'Rider',
                theme: AppTheme().lightTheme,
                darkTheme: AppTheme().darkTheme,
                themeMode: state,
                routerConfig: AppRoutesConfiguration.appRouter,
                // builder: FToastBuilder(),
                builder: (context, child) {
                  final connect = ConnectivityListenerScreen(child: child);

                  return FToastBuilder()(context, connect);
                },
              );
            },
          ),
        );
      },
    );
  }
}
