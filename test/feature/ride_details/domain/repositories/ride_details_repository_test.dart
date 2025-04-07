import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/ride_details/data/repositories/ride_details_client.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';

class MockRideDetailsClient extends Mock implements RideDetailsClient {}

void main() {
  late RideDetailsRepository repository;
  late MockRideDetailsClient mockClient;

  setUp(() {
    mockClient = MockRideDetailsClient();
    repository = RideDetailsRepository(rideDetailsClient: mockClient);
  });

  test('fetchRideDetails returns list of RideType on success', () async {
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
    when(() => mockClient.getRemoteRideTypes())
        .thenAnswer((_) async => rideTypes);

    final result = await repository.fetchRideDetails();

    expect(result, Right<String, List<RideType>>(rideTypes));
  });

  test('fetchRideDetails returns error message on failure', () async {
    when(() => mockClient.getRemoteRideTypes())
        .thenThrow(Exception('Failed to fetch ride types'));

    final result = await repository.fetchRideDetails();

    expect(
      result,
      const Left<String, List<RideType>>(
        'Exception: Failed to fetch ride types',
      ),
    );
  });
}
