part of 'ride_options_cubit.dart';

@freezed
abstract class RideOptionsState with _$RideOptionsState {
  const factory RideOptionsState({
    DateTime? dateTime,
    @Default(1) int passengers,
  }) = _RideOptionsState;
}
