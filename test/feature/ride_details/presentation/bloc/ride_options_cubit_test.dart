import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_details/presentation/bloc/ride_options_cubit.dart';

class MockRideDetailsRepository extends Mock implements RideDetailsRepository {}

//ignore_for_file: lines_longer_than_80_chars
void main() {
  group('RideOptionsCubit', () {
    late RideOptionsCubit cubit;

    setUp(() {
      cubit =
          RideOptionsCubit(rideDetailsRepository: MockRideDetailsRepository());
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is correct', () {
      expect(cubit.state, const RideOptionsState());
    });

    test('setDateTime updates the state with the provided dateTime', () {
      final dateTime = DateTime(2023, 10, 1, 10);
      cubit.setDateTime(dateTime);
      expect(cubit.state.dateTime, dateTime);
    });

    test(
        'setPassengers updates the state with the provided number of passengers',
        () {
      cubit.setPassengers(3);
      expect(cubit.state.passengers, 3);
    });

    test(
        'setDateTime does not update the state when the same dateTime is provided',
        () {
      final dateTime = DateTime(2023, 10, 1, 10);
      cubit
        ..setDateTime(dateTime)
        ..setDateTime(dateTime);
      expect(cubit.state.dateTime, dateTime);
    });

    test(
        'setPassengers does not update the state when the same number of passengers is provided',
        () {
      cubit
        ..setPassengers(3)
        ..setPassengers(3);
      expect(cubit.state.passengers, 3);
    });
  });
}
