import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/ride_summary_cubit.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/pages/ride_summary_screen.dart';

class MockRideSummaryCubit extends MockCubit<RideSummaryState>
    implements RideSummaryCubit {}

void main() {
  late MockRideSummaryCubit mockRideSummaryCubit;

  setUp(() {
    mockRideSummaryCubit = MockRideSummaryCubit();
  });

  testWidgets('displays ride summary details', (WidgetTester tester) async {
    when(() => mockRideSummaryCubit.state).thenReturn(
      RideSummaryLoaded(
        rideEntity: RideEntity(
          pickupLocation:
              const RideLocation(latitude: 40.7128, longitude: -74.0060),
          destinationLocation:
              const RideLocation(latitude: 34.0522, longitude: -118.2437),
          rideType: const RideType(
            name: 'Standard',
            imagePath: 'assets/images/standart.jpg',
            description: '',
            price: '',
          ),
          selectedDate: DateTime(2023, 10),
          passengerAmount: '4',
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RideSummaryCubit>(
          create: (_) => mockRideSummaryCubit,
          child: const RideSummaryScreen(),
        ),
      ),
    );

    expect(find.text('Ride Summary'), findsOneWidget);
    expect(find.text('Standard'), findsOneWidget);
    expect(find.text('Pickup Location'), findsOneWidget);
    expect(find.text('Drop-off Location'), findsOneWidget);
    expect(find.text('Passenger Count'), findsOneWidget);
  });

  testWidgets('shows loading indicator when booking ride',
      (WidgetTester tester) async {
    when(() => mockRideSummaryCubit.state).thenReturn(
      RideSummaryLoading(
        rideEntity: RideEntity(
          pickupLocation:
              const RideLocation(latitude: 40.7128, longitude: -74.0060),
          destinationLocation:
              const RideLocation(latitude: 34.0522, longitude: -118.2437),
          rideType: const RideType(
            name: 'Standard',
            imagePath: 'assets/images/standart.jpg',
            description: '',
            price: '',
          ),
          selectedDate: DateTime(2023, 10),
          passengerAmount: '4',
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RideSummaryCubit>(
          create: (_) => mockRideSummaryCubit,
          child: const RideSummaryScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
