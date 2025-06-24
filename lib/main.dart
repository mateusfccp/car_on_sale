import 'package:cars_on_sale/routing.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = SharedPreferencesAsync();

  final authenticationService = AuthenticationService(storage: storage);
  await authenticationService.restoreTokenFromStorage();

  final router = createRouterConfig(
    authenticationService: authenticationService,
  );

  runApp(App(routerConfig: router));
}

final class App extends StatelessWidget {
  const App({super.key, required this.routerConfig});

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
