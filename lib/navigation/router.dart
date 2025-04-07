import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/feature/ride_details/presentation/pages/ride_details_screen.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/ride_summary_cubit.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/pages/ride_summary_screen.dart';

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
          routes: [
            GoRoute(
              path: 'ride-summary',
              builder: (context, state) => BlocProvider(
                create: (context) => RideSummaryCubit(
                  mainFlowRepo: context.read(),
                  rideDetailsRepository: context.read(),
                  rideSummaryRepository: context.read(),
                ),
                child: const RideSummaryScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
