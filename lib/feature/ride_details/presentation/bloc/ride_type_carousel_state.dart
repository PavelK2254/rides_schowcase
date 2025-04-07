part of 'ride_type_carousel_cubit.dart';

@immutable
sealed class RideTypeCarouselState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RideTypeCarouselLoading extends RideTypeCarouselState {}

final class RideTypeCarouselLoaded extends RideTypeCarouselState {
  RideTypeCarouselLoaded(this.rideTypes);
  final List<RideType> rideTypes;

  @override
  List<Object?> get props => [rideTypes];
}

final class RideTypeCarouselError extends RideTypeCarouselState {
  RideTypeCarouselError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
