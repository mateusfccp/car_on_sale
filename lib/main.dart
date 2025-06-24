import 'dart:io';

import 'package:cars_on_sale/routing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final logger = Logger.root;

  if (kDebugMode) {
    Logger.root.onRecord.listen((record) {
      stdout.writeln(
        '[${record.level.name} | ${record.time}]: ${record.message}',
      );
    });
  }

  final sharedPreferences = SharedPreferencesAsync();

  final authenticationService = AuthenticationService(
    sharedPreferences: sharedPreferences,
    logger: logger,
  );
  await authenticationService.restoreTokenFromStorage();

  final router = createRouterConfig(
    authenticationService: authenticationService,
    sharedPreferences: sharedPreferences,
    logger: logger,
  );

  runApp(App(routerConfig: router));
}

/// The main widget of the app.
///
/// This widgets sets up the [MaterialApp] with the given route configuration.
final class App extends StatelessWidget {
  /// Creates a new [App] with the given [routerConfig].
  const App({super.key, required this.routerConfig});

  /// The router configuration for this app.
  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFFFCBE0E);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: brandColor),
      ),
      routerConfig: routerConfig,
    );
  }
}
