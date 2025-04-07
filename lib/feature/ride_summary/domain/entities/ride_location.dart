import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'ride_location.freezed.dart';
part 'ride_location.g.dart';

@freezed
abstract class RideLocation with _$RideLocation {
  const factory RideLocation({
    required double latitude,
    required double longitude,
  }) = _RideLocation;

  factory RideLocation.fromJson(Map<String, dynamic> json) =>
      _$RideLocationFromJson(json);

  factory RideLocation.fromLatLng(LatLng latLng) =>
      RideLocation(latitude: latLng.latitude, longitude: latLng.longitude);

  factory RideLocation.fromLocation(Location location) =>
      RideLocation(latitude: location.latitude, longitude: location.longitude);
}
