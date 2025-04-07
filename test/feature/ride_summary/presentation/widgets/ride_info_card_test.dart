import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/widgets/ride_info_card.dart';

void main() {
  group('RideInfoCard', () {
    testWidgets('displays image, title, and subtitle',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RideInfoCard(
              imagePath: 'assets/images/comfort.jpg',
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('applies correct styles to title and subtitle',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RideInfoCard(
              imagePath: 'assets/images/comfort.jpg',
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Title'));
      final subtitleText = tester.widget<Text>(find.text('Test Subtitle'));

      expect(
        titleText.style,
        Theme.of(tester.element(find.text('Test Title'))).textTheme.bodyLarge,
      );
      expect(subtitleText.style?.color, Colors.grey);
    });

    testWidgets('displays placeholder image when imagePath is invalid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RideInfoCard(
              imagePath: 'assets/images/comfort.jpg',
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.image, isA<AssetImage>());
    });
  });
}
