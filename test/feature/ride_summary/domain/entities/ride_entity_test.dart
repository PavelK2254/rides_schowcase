import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';

void main() {
  group('RideEntity', () {
    const pickupLocation = RideLocation(latitude: 40.7128, longitude: -74.0060);
    const destinationLocation =
        RideLocation(latitude: 34.0522, longitude: -118.2437);
    const rideType =
        RideType(name: 'Standard', imagePath: '', description: '', price: '');

    test('can be instantiated', () {
      final ride = RideEntity(
        pickupLocation: pickupLocation,
        destinationLocation: destinationLocation,
        rideType: rideType,
        selectedDate: DateTime(2023, 10),
        passengerAmount: '4',
      );

      expect(ride.pickupLocation, pickupLocation);
      expect(ride.destinationLocation, destinationLocation);
      expect(ride.rideType, rideType);
      expect(ride.selectedDate, DateTime(2023, 10));
      expect(ride.passengerAmount, '4');
    });

    test('can be deserialized from JSON', () {
      final json = {
        'pickupLocation': pickupLocation.toJson(),
        'destinationLocation': destinationLocation.toJson(),
        'rideType': rideType.toJson(),
        'selectedDate': '2023-10-01T00:00:00.000',
        'passengerAmount': '4',
      };

      final ride = RideEntity.fromJson(json);
      expect(ride.pickupLocation, pickupLocation);
      expect(ride.destinationLocation, destinationLocation);
      expect(ride.rideType, rideType);
      expect(ride.selectedDate, DateTime(2023, 10));
      expect(ride.passengerAmount, '4');
    });
  });
}
