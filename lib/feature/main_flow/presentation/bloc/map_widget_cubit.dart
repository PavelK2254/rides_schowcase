import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/services/location_provider.dart';

part 'map_widget_state.dart';

const _mockLocation = LatLng(37.42796133580664, -122.085749655962);

class MapWidgetCubit extends Cubit<MapWidgetState> {
  MapWidgetCubit()
      : super(const HomeScreenInitial(currentLocation: _mockLocation));

  GoogleMapController? _mapController;

  //ignore: avoid_setters_without_getters
  set controller(GoogleMapController value) {
    _mapController = value;
  }

  Future<void> loadInitialLocation() async {
    try {
      final result = await LocationProvider().getCurrentLocation();
      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              result.latitude ?? _mockLocation.latitude,
              result.longitude ?? _mockLocation.longitude,
            ),
            zoom: 14.4746,
          ),
        ),
      );
    } catch (error) {
      //TODO: Handle error
    }
  }

  Future<void> setMapLocation(Location location) async {
    final latLng = LatLng(location.latitude, location.longitude);
    try {
      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 14.4746,
          ),
        ),
      );
    } catch (error) {
      //TODO: Handle error
    }
  }
}
