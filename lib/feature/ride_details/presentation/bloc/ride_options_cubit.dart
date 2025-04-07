import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rides_showcase/feature/ride_details/domain/repositories/ride_details_repository.dart';

part 'ride_options_state.dart';
part 'ride_options_cubit.freezed.dart';

class RideOptionsCubit extends Cubit<RideOptionsState> {
  RideOptionsCubit({required this.rideDetailsRepository})
      : super(const RideOptionsState());

  final RideDetailsRepository rideDetailsRepository;

  void setDateTime(DateTime dateTime) {
    rideDetailsRepository.selectedDate = dateTime;
    emit(state.copyWith(dateTime: dateTime));
  }

  void setPassengers(int passengers) {
    rideDetailsRepository.passengerAmount = passengers;
    emit(state.copyWith(passengers: passengers));
  }
}
