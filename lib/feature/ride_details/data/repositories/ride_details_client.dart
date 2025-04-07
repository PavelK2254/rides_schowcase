import 'package:rides_showcase/feature/ride_details/data/local/data_sources/ride_types.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';

class RideDetailsClient {
  Future<List<RideType>> getLocalRideTypes() => Future.value(rideTypes);

  Future<List<RideType>> getRemoteRideTypes() async {
    // Simulate a network call
    await Future<void>.delayed(const Duration(seconds: 2));
    return Future.value(rideTypes);
  }
}
