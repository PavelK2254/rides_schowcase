import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_details/data/repositories/ride_details_client.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';

void main() {
  late RideDetailsClient client;

  setUp(() {
    client = RideDetailsClient();
  });

  group('RideDetailsClient', () {
    test('getLocalRideTypes returns a list of RideType', () async {
      final result = await client.getLocalRideTypes();
      expect(result, isA<List<RideType>>());
      expect(result.isNotEmpty, true);
    });

    test('getRemoteRideTypes returns a list of RideType after a delay',
        () async {
      final result = await client.getRemoteRideTypes();
      expect(result, isA<List<RideType>>());
      expect(result.isNotEmpty, true);
    });
  });
}
