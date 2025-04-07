import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/options_tile.dart';

void main() {
  group('OptionTile', () {
    testWidgets('displays the correct icon, title, and subtitle',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OptionTile(
              icon: Icons.schedule_outlined,
              title: 'When',
              subtitle: 'Today at 10:00 AM',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.schedule_outlined), findsOneWidget);
      expect(find.text('When'), findsOneWidget);
      expect(find.text('Today at 10:00 AM'), findsOneWidget);
    });

    testWidgets('calls onTap callback when tapped',
        (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OptionTile(
              icon: Icons.schedule_outlined,
              title: 'When',
              subtitle: 'Today at 10:00 AM',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(OptionTile));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not crash when onTap is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OptionTile(
              icon: Icons.schedule_outlined,
              title: 'When',
              subtitle: 'Today at 10:00 AM',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(OptionTile));
      await tester.pump();

      // No assertions needed, just ensure no crash
    });
  });
}
