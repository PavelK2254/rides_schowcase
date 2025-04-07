import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';

part 'ride_type_carousel_state.dart';

class RideTypeCarouselCubit extends Cubit<RideTypeCarouselState> {
  RideTypeCarouselCubit({required this.rideDetailsRepository})
      : super(RideTypeCarouselLoading());
  final RideDetailsRepository rideDetailsRepository;

  Future<void> loadRideTypes() async {
    final result = await rideDetailsRepository.fetchRideDetails();
    result.fold((error) {
      emit(RideTypeCarouselError(error));
    }, (rideTypes) {
      rideDetailsRepository.currentRideType = rideTypes.first;
      emit(RideTypeCarouselLoaded(rideTypes));
    });
  }

  //ignore: use_setters_to_change_properties
  void setCurrentRideType(RideType rideType) =>
      rideDetailsRepository.currentRideType = rideType;
}
