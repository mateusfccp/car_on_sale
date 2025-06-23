import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:cars_on_sale/ui/screens/search_vehicle/search_vehicle_screen.dart';
import 'package:cars_on_sale/ui/screens/search_vehicle/search_vehicle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/authentication_service.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/login/login_view_model.dart';

/// Create the router configuration with the given dependencies.
RouterConfig<Object> createRouterConfig({
  required AuthenticationService authenticationService,
}) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        redirect: (context, state) {
          if (authenticationService.isAuthenticated) {
            return null;
          } else {
            return '/login';
          }
        },
        builder: (context, state) {
          return SearchVehicleScreen(
            viewModel: SearchVehicleViewModel(
              authenticationRepository: MockAuthenticationRepository(),
              authenticationService: authenticationService,
            ),
          );
        },
      ),
      GoRoute(
        path: '/login',
        redirect: (context, state) {
          if (authenticationService.isAuthenticated) {
            return '/home';
          } else {
            return null;
          }
        },
        builder: (context, state) {
          return LoginScreen(
            viewModel: LoginViewModel(
              authenticationRepository: MockAuthenticationRepository(),
              authenticationService: authenticationService,
            ),
          );
        },
      ),
    ],
  );
}
