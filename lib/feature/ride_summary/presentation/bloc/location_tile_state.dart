part of 'location_tile_cubit.dart';

sealed class LocationTileState extends Equatable {
  const LocationTileState();
}

final class LocationTileLoading extends LocationTileState {
  @override
  List<Object> get props => [];
}

final class LocationTileLoaded extends LocationTileState {
  const LocationTileLoaded({required this.placemark});

  final Placemark placemark;

  @override
  List<Object?> get props => [placemark];
}

final class LocationTileError extends LocationTileState {
  const LocationTileError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
