import 'package:dartz/dartz.dart';
import 'package:rides_showcase/feature/ride_details/data/repositories/ride_details_client.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';

class RideDetailsRepository {
  RideDetailsRepository({required this.rideDetailsClient});

  final RideDetailsClient rideDetailsClient;

  RideType? currentRideType;
  DateTime selectedDate = DateTime.now();
  int passengerAmount = 1;

  Future<Either<String, List<RideType>>> fetchRideDetails() async {
    try {
      final result = await rideDetailsClient.getRemoteRideTypes();
      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }
}
