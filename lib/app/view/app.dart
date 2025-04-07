import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/location_provider.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/feature/ride_details/data/repositories/ride_details_client.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_options_cubit.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_type_carousel_cubit.dart';
import 'package:rides_showcase/l10n/l10n.dart';
import 'package:rides_showcase/navigation/router.dart';
import 'package:rides_showcase/styleguide/theme/dark_theme.dart';
import 'package:rides_showcase/styleguide/theme/light_theme.dart';
import 'package:rides_showcase/styleguide/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => MainFlowRepository(),
        ),
        RepositoryProvider(
          create: (_) =>
              RideDetailsRepository(rideDetailsClient: RideDetailsClient()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerConfig: router,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (_, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<MapWidgetCubit>(
                    create: (context) =>
                        MapWidgetCubit(context.read(), LocationProvider())
                          ..loadInitialLocation(),
                  ),
                  BlocProvider<WhereToCubit>(
                    create: (context) =>
                        WhereToCubit(context.read(), GeocodingService()),
                  ),
                  BlocProvider<RideTypeCarouselCubit>(
                    create: (context) => RideTypeCarouselCubit(
                      rideDetailsRepository:
                          context.read<RideDetailsRepository>(),
                    )..loadRideTypes(),
                  ),
                  BlocProvider<RideOptionsCubit>(
                    create: (context) => RideOptionsCubit(),
                  ),
                ],
                child: child ?? const SetDestinationScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
