import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'where_to_state.dart';

const kDebounceDurationMS = Duration(milliseconds: 500);

class WhereToCubit extends Cubit<WhereToState> {
  WhereToCubit(this._mainFlowRepo, this._geocodingService)
      : super(WhereToInitial()) {
    _setupListeners();
  }

  void _setupListeners() {
    pickupController = TextEditingController()
      ..addListener(() => _pickupBSubject.add(pickupController.text));
    destinationController = TextEditingController()
      ..addListener(() => _destinationBSubject.add(destinationController.text));

    _pickupBSubject.debounceTime(kDebounceDurationMS).listen((event) async {
      if (event.length > 3) {
        try {
          final locations =
              await _geocodingService.getLocationFromAddress(event);
          final firstLocation = locations.first;
          _mainFlowRepo.setPickupLocation(firstLocation);
          emit(
            WhereToLoaded(
              firstLocation,
              areAddressesValid: _mainFlowRepo.destinationLocation != null,
            ),
          );
        } catch (e) {
          emit(WhereToError(pickupErrorMessage: e.toString()));
        }
      }
    });

    _destinationBSubject
        .debounceTime(kDebounceDurationMS)
        .listen((event) async {
      if (event.length > 3) {
        try {
          final locations =
              await _geocodingService.getLocationFromAddress(event);
          final firstLocation = locations.first;
          _mainFlowRepo.setDestinationLocation(firstLocation);
          emit(
            WhereToLoaded(
              firstLocation,
              areAddressesValid: _mainFlowRepo.pickupLocation != null,
            ),
          );
        } catch (e) {
          emit(WhereToError(destinationErrorMessage: e.toString()));
        }
      }
    });
  }

  late final TextEditingController pickupController;
  late final TextEditingController destinationController;
  final MainFlowRepository _mainFlowRepo;
  final _pickupBSubject = BehaviorSubject<String>();
  final _destinationBSubject = BehaviorSubject<String>();
  final GeocodingService _geocodingService;

  @override
  Future<void> close() {
    pickupController.dispose();
    destinationController.dispose();
    _pickupBSubject.close();
    _destinationBSubject.close();
    return super.close();
  }
}
