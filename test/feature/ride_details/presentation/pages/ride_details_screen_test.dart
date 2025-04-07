import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/data/repositories/ride_details_client.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_options_cubit.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_type_carousel_cubit.dart';
import 'package:rides_showcase/feature/ride_details/presentation/pages/ride_details_screen.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/ride_options_section.dart';
import 'package:rides_showcase/feature/ride_details/presentation/widgets/ride_type_carousel.dart';

class MockRideDetailsRepository extends Mock implements RideDetailsRepository {}

void main() {
  final materialApp = MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RideTypeCarouselCubit(
            rideDetailsRepository: RideDetailsRepository(
              rideDetailsClient: RideDetailsClient(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => RideOptionsCubit(
            rideDetailsRepository: MockRideDetailsRepository(),
          ),
        ),
      ],
      child: const RideDetailsScreen(),
    ),
  );

  group('RideDetailsScreen', () {
    testWidgets('displays the app bar with correct title',
        (WidgetTester tester) async {
      await tester.pumpWidget(materialApp);

      expect(find.text('Ride Details'), findsOneWidget);
      expect(find.byType(BackButton), findsOneWidget);
    });

    testWidgets('displays RideTypeCarousel', (WidgetTester tester) async {
      await tester.pumpWidget(materialApp);

      expect(find.byType(RideTypeCarousel), findsOneWidget);
    });

    testWidgets('displays RideOptionsSection', (WidgetTester tester) async {
      await tester.pumpWidget(materialApp);

      expect(find.byType(RideOptionsSection), findsOneWidget);
    });

    testWidgets('displays Book Now button', (WidgetTester tester) async {
      await tester.pumpWidget(materialApp);

      expect(find.text('Book Now'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
