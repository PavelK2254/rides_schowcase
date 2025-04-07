import 'package:dartz/dartz.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';

class RideSummaryRepository {
  // This method simulated a call to the BE to book a ride
  Future<Either<Exception, void>> bookRide(RideEntity ride) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return const Right(null);
  }
}
