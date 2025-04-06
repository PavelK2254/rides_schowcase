import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/services/location_provider.dart';

part 'map_widget_state.dart';

const _mockLocation = LatLng(37.42796133580664, -122.085749655962);

class MapWidgetCubit extends Cubit<MapWidgetState> {
  MapWidgetCubit(this._mainFlowRepository)
      : super(const HomeScreenInitial(currentLocation: _mockLocation));

  final MainFlowRepository _mainFlowRepository;
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

  void addMapMarkers(BuildContext context) {
    final markers = <LatLng>[
      _mainFlowRepository.pickupLocation!,
      _mainFlowRepository.destinationLocation!,
    ];
    final circles = markers
        .map(
          (marker) => Circle(
            circleId: CircleId(marker.toString()),
            center: marker,
            radius: 15,
            fillColor: Theme.of(context).primaryColor.withAlpha(127),
            strokeWidth: 2,
            strokeColor: Theme.of(context).primaryColor,
          ),
        )
        .toList();

    emit(
      HomeScreenUpdateLocation(
        currentLocation: state.currentLocation,
        circles: circles,
      ),
    );
  }
}
