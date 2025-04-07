import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';
import 'package:rides_showcase/feature/ride_summary/presentation/bloc/location_tile_cubit.dart';

class MockGeocodingService extends Mock implements GeocodingService {}

void main() {
  late LocationTileCubit locationTileCubit;
  late MockGeocodingService mockGeocodingService;

  setUp(() {
    mockGeocodingService = MockGeocodingService();
    locationTileCubit =
        LocationTileCubit(geocodingService: mockGeocodingService);
  });

  tearDown(() {
    locationTileCubit.close();
  });

  const rideLocation = RideLocation(latitude: 40.7128, longitude: -74.0060);
  const placemark = Placemark(name: 'Test Place');
  final locationTileLoading = LocationTileLoading();

  blocTest<LocationTileCubit, LocationTileState>(
    'emits [LocationTileLoading, LocationTileLoaded] when location is found',
    build: () {
      when(() => mockGeocodingService.getAddressFromCoordinates(any(), any()))
          .thenAnswer((_) async => [placemark]);
      return locationTileCubit;
    },
    act: (cubit) => cubit.getLocationFromAddress(rideLocation),
    expect: () {
      return [
        locationTileLoading,
        const LocationTileLoaded(placemark: placemark),
      ];
    },
  );

  blocTest<LocationTileCubit, LocationTileState>(
    'emits [LocationTileLoading, LocationTileError] when location is not found',
    build: () {
      when(() => mockGeocodingService.getAddressFromCoordinates(any(), any()))
          .thenAnswer((_) async => []);
      return locationTileCubit;
    },
    act: (cubit) => cubit.getLocationFromAddress(rideLocation),
    expect: () => [
      LocationTileLoading(),
      const LocationTileError(error: 'Location not found'),
    ],
  );

  blocTest<LocationTileCubit, LocationTileState>(
    'emits [LocationTileLoading, LocationTileError] when an exception occurs',
    build: () {
      when(() => mockGeocodingService.getAddressFromCoordinates(any(), any()))
          .thenThrow(Exception('Failed to fetch location'));
      return locationTileCubit;
    },
    act: (cubit) => cubit.getLocationFromAddress(rideLocation),
    expect: () => [
      LocationTileLoading(),
      const LocationTileError(error: 'Exception: Failed to fetch location'),
    ],
  );
}
