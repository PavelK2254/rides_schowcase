import 'package:go_router/go_router.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/feature/ride_details/presentation/pages/ride_details_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SetDestinationScreen(),
      routes: [
        GoRoute(
          path: '/ride-details',
          builder: (context, state) => const RideDetailsScreen(),
        ),
      ],
    ),
  ],
);
