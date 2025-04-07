import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';
import 'package:rides_showcase/feature/ride_summary/domain/repositories/ride_summary_repository.dart';

class MockRideSummaryRepository extends Mock implements RideSummaryRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      RideEntity(
        pickupLocation: const RideLocation(latitude: 0, longitude: 0),
        destinationLocation: const RideLocation(latitude: 0, longitude: 0),
        rideType: const RideType(
          name: 'Standard',
          imagePath: '',
          description: '',
          price: '',
        ),
        selectedDate: DateTime(2023),
        passengerAmount: '1',
      ),
    );
  });

  group('RideSummaryRepository', () {
    final mockRepository = MockRideSummaryRepository();
    final ride = RideEntity(
      pickupLocation:
          const RideLocation(latitude: 40.7128, longitude: -74.0060),
      destinationLocation:
          const RideLocation(latitude: 34.0522, longitude: -118.2437),
      rideType: const RideType(
        name: 'Standard',
        imagePath: '',
        description: '',
        price: '',
      ),
      selectedDate: DateTime(2023, 10),
      passengerAmount: '4',
    );

    test('bookRide returns Right(null) on success', () async {
      when(() => mockRepository.bookRide(any()))
          .thenAnswer((_) async => const Right(null));

      final result = await mockRepository.bookRide(ride);

      expect(result, const Right<String, void>(null));
    });

    test('bookRide handles network delay', () async {
      when(() => mockRepository.bookRide(any())).thenAnswer((_) async {
        await Future<void>.delayed(const Duration(seconds: 2));
        return const Right(null);
      });

      final result = await mockRepository.bookRide(ride);

      expect(result, const Right<String, void>(null));
    });
  });
}
