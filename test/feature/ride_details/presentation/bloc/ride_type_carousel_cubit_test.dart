import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_type_carousel_cubit.dart';

class MockRideDetailsRepository extends Mock implements RideDetailsRepository {}

void main() {
  late RideTypeCarouselCubit cubit;
  late MockRideDetailsRepository mockRepository;

  setUp(() {
    mockRepository = MockRideDetailsRepository();
    cubit = RideTypeCarouselCubit(rideDetailsRepository: mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('RideTypeCarouselCubit', () {
    blocTest<RideTypeCarouselCubit, RideTypeCarouselState>(
      'initial state is RideTypeCarouselLoading',
      build: () => cubit,
      verify: (cubit) => expect(cubit.state, RideTypeCarouselLoading()),
    );

    blocTest<RideTypeCarouselCubit, RideTypeCarouselState>(
      'loadRideTypes emits RideTypeCarouselLoaded on success',
      build: () => cubit,
      setUp: () {
        final rideTypes = [
          const RideType(
            name: 'Type1',
            imagePath: '',
            description: '',
            price: '',
            eta: '',
          ),
          const RideType(
            name: 'Type2',
            imagePath: '',
            description: '',
            price: '',
            eta: '',
          ),
        ];
        when(() => mockRepository.fetchRideDetails())
            .thenAnswer((_) async => right(rideTypes));
      },
      act: (cubit) => cubit.loadRideTypes(),
      expect: () => [
        RideTypeCarouselLoaded(const [
          RideType(
            name: 'Type1',
            imagePath: '',
            description: '',
            price: '',
            eta: '',
          ),
          RideType(
            name: 'Type2',
            imagePath: '',
            description: '',
            price: '',
            eta: '',
          ),
        ]),
      ],
    );

    blocTest<RideTypeCarouselCubit, RideTypeCarouselState>(
      'loadRideTypes emits RideTypeCarouselError on failure',
      build: () => cubit,
      setUp: () {
        when(() => mockRepository.fetchRideDetails())
            .thenAnswer((_) async => left('Error'));
      },
      act: (cubit) => cubit.loadRideTypes(),
      expect: () => [RideTypeCarouselError('Error')],
    );

    blocTest<RideTypeCarouselCubit, RideTypeCarouselState>(
      'setCurrentRideType updates the current ride type in repository',
      build: () => cubit,
      act: (cubit) {
        const rideType = RideType(
          name: 'Type1',
          imagePath: '',
          description: '',
          price: '',
          eta: '',
        );
        cubit.setCurrentRideType(rideType);
      },
      verify: (_) {
        const rideType = RideType(
          name: 'Type1',
          imagePath: '',
          description: '',
          price: '',
          eta: '',
        );
        verify(() => mockRepository.currentRideType = rideType).called(1);
      },
    );
  });
}
