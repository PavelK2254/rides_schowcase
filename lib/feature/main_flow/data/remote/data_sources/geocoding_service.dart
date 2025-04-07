import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<List<Location>> getLocationFromAddress(String address) {
    return locationFromAddress(address);
  }

  Future<List<Placemark>> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) {
    return placemarkFromCoordinates(latitude, longitude);
  }
}
