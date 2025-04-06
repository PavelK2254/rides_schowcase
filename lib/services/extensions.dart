import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LatLngExtension on Location {
  LatLng toLatLng() => LatLng(latitude, longitude);
}
