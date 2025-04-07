import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_entity.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';
import 'package:rides_showcase/feature/ride_summary/domain/repositories/ride_summary_repository.dart';

part 'ride_summary_state.dart';

class RideSummaryCubit extends Cubit<RideSummaryState> {
  RideSummaryCubit({
    required this.rideSummaryRepository,
    required MainFlowRepository mainFlowRepo,
    required RideDetailsRepository rideDetailsRepository,
  }) : super(
          RideSummaryLoaded(
            rideEntity: _buildRideEntity(mainFlowRepo, rideDetailsRepository),
          ),
        );

  final RideSummaryRepository rideSummaryRepository;

  static RideEntity _buildRideEntity(
    MainFlowRepository mainFlowRepo,
    RideDetailsRepository rideDetailsRepository,
  ) =>
      RideEntity(
        pickupLocation: RideLocation.fromLatLng(mainFlowRepo.pickupLocation!),
        destinationLocation:
            RideLocation.fromLatLng(mainFlowRepo.destinationLocation!),
        rideType: rideDetailsRepository.currentRideType!,
        selectedDate: rideDetailsRepository.selectedDate,
        passengerAmount: rideDetailsRepository.passengerAmount.toString(),
      );

  Future<void> bookRide() async {
    emit(RideSummaryLoading(rideEntity: state.rideEntity));
    final result = await rideSummaryRepository.bookRide(state.rideEntity);
    result.fold(
        (error) => emit(
              RideSummaryError(
                rideEntity: state.rideEntity,
                error: error.toString(),
              ),
            ), (_) {
      emit(RideSummarySuccess(rideEntity: state.rideEntity));
    });
  }
}
