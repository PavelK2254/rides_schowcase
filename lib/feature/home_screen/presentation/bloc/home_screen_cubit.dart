import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/services/location_provider.dart';

part 'home_screen_state.dart';

const _mockLocation = LatLng(37.42796133580664, -122.085749655962);

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit()
      : super(const HomeScreenInitial(currentLocation: _mockLocation));

  GoogleMapController? _controller;

  //ignore: avoid_setters_without_getters
  set controller(GoogleMapController value) {
    _controller = value;
  }

  Future<void> loadInitialLocation() async {
    try {
      final result = await LocationProvider().getCurrentLocation();
      await _controller?.animateCamera(
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
      emit(
        HomeScreenError(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
