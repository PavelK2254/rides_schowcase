part of 'home_screen_cubit.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();
}

final class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial({
    required this.currentLocation,
  });

  final LatLng currentLocation;

  @override
  List<Object> get props => [currentLocation];
}

final class HomeScreenError extends HomeScreenState {
  const HomeScreenError({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class HomeScreenUpdateLocation extends HomeScreenInitial {
  const HomeScreenUpdateLocation({
    required super.currentLocation,
  });

  @override
  List<Object> get props => [currentLocation];
}
