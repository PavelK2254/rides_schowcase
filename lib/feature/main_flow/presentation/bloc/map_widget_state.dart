part of 'map_widget_cubit.dart';

sealed class MapWidgetState extends Equatable {
  const MapWidgetState({required this.currentLocation, required this.circles});

  final LatLng currentLocation;
  final List<Circle> circles;
}

final class HomeScreenInitial extends MapWidgetState {
  const HomeScreenInitial({
    required super.currentLocation,
    super.circles = const [],
  });

  @override
  List<Object> get props => [currentLocation, circles];
}

final class HomeScreenError extends MapWidgetState {
  const HomeScreenError({
    required this.errorMessage,
    required super.circles,
    required super.currentLocation,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage, currentLocation, circles];
}

final class HomeScreenUpdateLocation extends HomeScreenInitial {
  const HomeScreenUpdateLocation({
    required super.currentLocation,
    required super.circles,
  });

  @override
  List<Object> get props => [currentLocation, circles];
}
