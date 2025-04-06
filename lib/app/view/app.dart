import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/l10n/l10n.dart';
import 'package:rides_showcase/styleguide/theme/dark_theme.dart';
import 'package:rides_showcase/styleguide/theme/light_theme.dart';
import 'package:rides_showcase/styleguide/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MainFlowRepository(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: MultiBlocProvider(
              providers: [
                BlocProvider<MapWidgetCubit>(
                  create: (context) =>
                  MapWidgetCubit()
                    ..loadInitialLocation(),
                ),
                BlocProvider<WhereToCubit>(
                  create: (context) => WhereToCubit(context.read()),
                ),
              ],
              child: const SetDestinationScreen(),
            ),
          );
        },
      ),
    );
  }
}
