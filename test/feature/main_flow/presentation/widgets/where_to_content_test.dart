import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/address_text_field.dart';
import 'package:rides_showcase/feature/main_flow/presentation/widgets/where_to_content.dart';
import 'package:rides_showcase/services/geocoding_servcice.dart';

class MockMainFlowRepository extends Mock implements MainFlowRepository {}

class MockGeocodingService extends Mock implements GeocodingService {}

void main() {
  final mockWhereToCubit =
      WhereToCubit(MockMainFlowRepository(), MockGeocodingService());

  Widget createTestWidget() {
    return MaterialApp(
      home: Scaffold(
        body: WhereToContent(
          cubit: mockWhereToCubit,
          onLocationSelected: (location) {},
          onConfirm: () {},
        ),
      ),
    );
  }

  testWidgets('WhereToContent displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Where to?'), findsOneWidget);
    expect(find.byType(AddressTextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Confirm button is disabled when addresses are not valid',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    final confirmButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(confirmButton.onPressed, isNull);
  });
}
