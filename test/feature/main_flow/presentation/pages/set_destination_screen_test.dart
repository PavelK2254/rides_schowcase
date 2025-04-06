import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/pages/set_destination_screen.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/where_to_content.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/where_to_field.dart';
import 'package:rides_showcase/services/geocoding_servcice.dart';
import 'package:rides_showcase/services/location_provider.dart';

class MockGeocodingService extends Mock implements GeocodingService {}

void main() {
  late MainFlowRepository mainFlowRepository;
  late MapWidgetCubit mapWidgetCubit;
  late WhereToCubit whereToCubit;

  setUp(() {
    mainFlowRepository = MainFlowRepository();
    mapWidgetCubit = MapWidgetCubit(mainFlowRepository,LocationProvider());
    whereToCubit = WhereToCubit(mainFlowRepository,MockGeocodingService());
  });

  Widget createTestWidget() {
    return RepositoryProvider.value(
      value: mainFlowRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MapWidgetCubit>(
            create: (context) => mapWidgetCubit,
          ),
          BlocProvider<WhereToCubit>(
            create: (context) => whereToCubit,
          ),
        ],
        child: const MaterialApp(
          home: SetDestinationScreen(),
        ),
      ),
    );
  }

  testWidgets('SetDestinationScreen has a title and buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Set your destination'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(WhereToField), findsOneWidget);
  });

  testWidgets('Tapping on WhereToField shows WhereToContent',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byType(WhereToField));
    await tester.pumpAndSettle();

    expect(find.byType(WhereToContent), findsOneWidget);
  });

  testWidgets(
      'Confirm destination button shows SnackBar if locations are not selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Please select a destination'), findsOneWidget);
  });
}
