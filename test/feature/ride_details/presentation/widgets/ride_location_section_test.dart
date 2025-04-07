import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/ride_location_section.dart';

void main() {
  group('RideLocationSection', () {
    testWidgets('displays the correct icons and text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RideLocationSection(),
          ),
        ),
      );

      expect(find.byIcon(Icons.my_location_outlined), findsOneWidget);
      expect(find.text('Pickup Location'), findsOneWidget);
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      expect(find.text('Destination'), findsOneWidget);
    });

    testWidgets('applies correct card elevation and shape',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RideLocationSection(),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, 2);
      expect(
        card.shape,
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      );
    });
  });
}
