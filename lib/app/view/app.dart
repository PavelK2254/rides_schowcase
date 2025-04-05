import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_showcase/feature/home_screen/presentation/pages/home_screen.dart';
import 'package:rides_showcase/l10n/l10n.dart';
import 'package:rides_showcase/styleguide/theme/dark_theme.dart';
import 'package:rides_showcase/styleguide/theme/light_theme.dart';
import 'package:rides_showcase/styleguide/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeScreen(),
        );
      },
    );
  }
}
