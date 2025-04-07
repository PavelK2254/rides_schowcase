import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';
import 'package:rides_showcase/feature/ride_summary/domain/repositories/ride_summary_repository.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/ride_summary_cubit.dart';

class MockRideSummaryRepository extends Mock implements RideSummaryRepository {}

class MockMainFlowRepository extends Mock implements MainFlowRepository {}

class MockRideDetailsRepository extends Mock implements RideDetailsRepository {}

void main() {
  late RideSummaryCubit rideSummaryCubit;
  late MockRideSummaryRepository mockRideSummaryRepository;
  late MockMainFlowRepository mockMainFlowRepository;
  late MockRideDetailsRepository mockRideDetailsRepository;

  setUp(() {
    mockRideSummaryRepository = MockRideSummaryRepository();
    mockMainFlowRepository = MockMainFlowRepository();
    mockRideDetailsRepository = MockRideDetailsRepository();

    when(() => mockMainFlowRepository.pickupLocation)
        .thenReturn(const LatLng(40.7128, -74.0060));
    when(() => mockMainFlowRepository.destinationLocation)
        .thenReturn(const LatLng(34.0522, -118.2437));
    when(() => mockRideDetailsRepository.currentRideType).thenReturn(
      const RideType(
        name: 'Standard',
        imagePath: '',
        description: '',
        price: '',
      ),
    );
    when(() => mockRideDetailsRepository.selectedDate)
        .thenReturn(DateTime(2023, 10));
    when(() => mockRideDetailsRepository.passengerAmount).thenReturn(4);

    rideSummaryCubit = RideSummaryCubit(
      rideSummaryRepository: mockRideSummaryRepository,
      mainFlowRepo: mockMainFlowRepository,
      rideDetailsRepository: mockRideDetailsRepository,
    );
  });

  tearDown(() {
    rideSummaryCubit.close();
  });

  final rideEntity = RideEntity(
    pickupLocation: const RideLocation(latitude: 40.7128, longitude: -74.0060),
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

  blocTest<RideSummaryCubit, RideSummaryState>(
    'emits [RideSummaryLoading, RideSummarySuccess] bookRide is successful',
    build: () {
      when(() => mockRideSummaryRepository.bookRide(rideEntity))
          .thenAnswer((_) async => const Right(null));
      return rideSummaryCubit;
    },
    act: (cubit) => cubit.bookRide(),
    expect: () => [
      RideSummaryLoading(rideEntity: rideEntity),
      RideSummarySuccess(rideEntity: rideEntity),
    ],
  );

  blocTest<RideSummaryCubit, RideSummaryState>(
    'emits [RideSummaryLoading, RideSummaryError] when bookRide fails',
    build: () {
      when(() => mockRideSummaryRepository.bookRide(rideEntity))
          .thenAnswer((_) async => Left(Exception('Failed to book ride')));
      return rideSummaryCubit;
    },
    act: (cubit) => cubit.bookRide(),
    expect: () => [
      RideSummaryLoading(rideEntity: rideEntity),
      RideSummaryError(
        rideEntity: rideEntity,
        error: 'Exception: Failed to book ride',
      ),
    ],
  );
}
