import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/services/extensions.dart';

class MainFlowRepository {
  LatLng? _pickupLocation;
  LatLng? _destinationLocation;

  LatLng? get pickupLocation => _pickupLocation;
  LatLng? get destinationLocation => _destinationLocation;

  void setPickupLocation(Location location) {
    _pickupLocation = location.toLatLng();
  }

  void setDestinationLocation(Location location) {
    _destinationLocation = location.toLatLng();
  }
}
