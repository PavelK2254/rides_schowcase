import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';

part 'location_tile_state.dart';

class LocationTileCubit extends Cubit<LocationTileState> {
  LocationTileCubit({required this.geocodingService})
      : super(LocationTileLoading());

  final GeocodingService geocodingService;

  Future<void> getLocationFromAddress(RideLocation rideLocation) async {
    try {
      emit(LocationTileLoading());
      final placemarks = await geocodingService.getAddressFromCoordinates(
        rideLocation.latitude,
        rideLocation.longitude,
      );
      if (placemarks.isNotEmpty) {
        emit(LocationTileLoaded(placemark: placemarks.first));
      } else {
        emit(const LocationTileError(error: 'Location not found'));
      }
    } catch (e) {
      emit(LocationTileError(error: e.toString()));
    }
  }
}
