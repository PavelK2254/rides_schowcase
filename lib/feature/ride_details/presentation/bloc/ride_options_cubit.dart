import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_options_state.dart';
part 'ride_options_cubit.freezed.dart';

class RideOptionsCubit extends Cubit<RideOptionsState> {
  RideOptionsCubit() : super(const RideOptionsState());

  void setDateTime(DateTime dateTime) =>
      emit(state.copyWith(dateTime: dateTime));

  void setPassengers(int passengers) =>
      emit(state.copyWith(passengers: passengers));
}
