import 'package:cars_on_sale/data/models/partial_vehicle_data.dart';
import 'package:cars_on_sale/data/models/vehicle_valuation_data.dart';
import 'package:cars_on_sale/data/repositories/auction_repository.dart';
import 'package:cars_on_sale/data/repositories/authentication_repository.dart';
import 'package:cars_on_sale/ui/screens/multiple_results_screen.dart';
import 'package:cars_on_sale/ui/screens/search_vehicle/search_vehicle_screen.dart';
import 'package:cars_on_sale/ui/screens/search_vehicle/search_vehicle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/authentication_service.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/login/login_view_model.dart';
import 'ui/screens/valuation_details_screen.dart';

/// Create the router configuration with the given dependencies.
RouterConfig<Object> createRouterConfig({
  required AuthenticationService authenticationService,
}) {
  return GoRouter(
    initialLocation: '/search',
    routes: [
      GoRoute(
        path: '/login',
        redirect: (context, state) {
          if (authenticationService.isAuthenticated) {
            return '/search';
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
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (authenticationService.isAuthenticated) {
            return null;
          } else {
            return '/login';
          }
        },
        routes: [
          GoRoute(
            path: '/search',
            builder: (context, state) {
              return SearchVehicleScreen(
                viewModel: SearchVehicleViewModel(
                  auctionRepository: MockAuctionRepository(
                    authenticationService: authenticationService,
                  ),
                  authenticationRepository: MockAuthenticationRepository(),
                  authenticationService: authenticationService,
                ),
              );
            },
          ),
          GoRoute(
            path: '/results',
            builder: (context, state) {
              final data = state.extra as List<PartialVehicleData>;
              return MultipleResultsScreen(results: data);
            },
          ),
          GoRoute(
            path: '/valuation',
            builder: (context, state) {
              final data = state.extra as VehicleValuationData;
              return ValuationDetailsScreen(valuationData: data);
            },
          ),
        ],
      ),
    ],
  );
}
