import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';

void main() {
  group('RideLocation', () {
    const latitude = 40.7128;
    const longitude = -74.0060;

    RideLocation createRideLocation() {
      return const RideLocation(latitude: latitude, longitude: longitude);
    }

    RideLocation createRideLocationFromLatLng() {
      return RideLocation.fromLatLng(const LatLng(latitude, longitude));
    }

    RideLocation createRideLocationFromLocation() {
      return RideLocation.fromLocation(
        Location(
          latitude: latitude,
          longitude: longitude,
          timestamp: DateTime.timestamp(),
        ),
      );
    }

    test('can be instantiated', () {
      final rideLocation = createRideLocation();
      expect(rideLocation.latitude, latitude);
      expect(rideLocation.longitude, longitude);
    });

    test('can be serialized to JSON', () {
      final rideLocation = createRideLocation();
      final json = rideLocation.toJson();
      expect(json['latitude'], latitude);
      expect(json['longitude'], longitude);
    });

    test('can be deserialized from JSON', () {
      final json = {'latitude': latitude, 'longitude': longitude};
      final rideLocation = RideLocation.fromJson(json);
      expect(rideLocation.latitude, latitude);
      expect(rideLocation.longitude, longitude);
    });

    test('can be created from LatLng', () {
      final rideLocation = createRideLocationFromLatLng();
      expect(rideLocation.latitude, latitude);
      expect(rideLocation.longitude, longitude);
    });

    test('can be created from Location', () {
      final rideLocation = createRideLocationFromLocation();
      expect(rideLocation.latitude, latitude);
      expect(rideLocation.longitude, longitude);
    });
  });
}
