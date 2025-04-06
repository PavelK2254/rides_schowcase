import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/app/app.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/styleguide/theme/theme_cubit.dart';

void main() {
  group('App', () {
    testWidgets('renders SetDestinationScreen', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => ThemeCubit(),
          child: const App(),
        ),
      );

      // Verify the SetDestinationScreen is rendered
      expect(find.byType(SetDestinationScreen), findsOneWidget);
    });
  });
}
