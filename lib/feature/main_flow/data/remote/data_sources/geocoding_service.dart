import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<List<Location>> getLocationFromAddress(String address) {
    return locationFromAddress(address);
  }
}
