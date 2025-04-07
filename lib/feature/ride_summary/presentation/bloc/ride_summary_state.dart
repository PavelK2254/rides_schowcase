part of 'ride_summary_cubit.dart';

sealed class RideSummaryState extends Equatable {
  const RideSummaryState({required this.rideEntity});

  final RideEntity rideEntity;
}

final class RideSummaryLoaded extends RideSummaryState {
  const RideSummaryLoaded({required super.rideEntity});

  @override
  List<Object?> get props => [rideEntity];
}

final class RideSummaryLoading extends RideSummaryState {
  const RideSummaryLoading({required super.rideEntity});

  @override
  List<Object?> get props => [rideEntity];
}

final class RideSummaryError extends RideSummaryState {
  const RideSummaryError({
    required super.rideEntity,
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error, rideEntity];
}

final class RideSummarySuccess extends RideSummaryState {
  const RideSummarySuccess({required super.rideEntity});

  @override
  List<Object?> get props => [rideEntity];
}
