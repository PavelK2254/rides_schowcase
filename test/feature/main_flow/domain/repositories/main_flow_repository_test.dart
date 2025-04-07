// File: test/feature/main_flow/domain/repositories/main_flow_repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';

void main() {
  late MainFlowRepository repository;

  setUp(() {
    repository = MainFlowRepository();
  });

  test('Initial pickupLocation and destinationLocation should be null', () {
    expect(repository.pickupLocation, isNull);
    expect(repository.destinationLocation, isNull);
  });

  test('setPickupLocation should update pickupLocation', () {
    final location = Location(
      latitude: 37.7749,
      longitude: -122.4194,
      timestamp: DateTime.now(),
    );
    repository.setPickupLocation(location);

    expect(repository.pickupLocation, const LatLng(37.7749, -122.4194));
  });

  test('setDestinationLocation should update destinationLocation', () {
    final location = Location(
      latitude: 34.0522,
      longitude: -118.2437,
      timestamp: DateTime.now(),
    );
    repository.setDestinationLocation(location);

    expect(repository.destinationLocation, const LatLng(34.0522, -118.2437));
  });
}
