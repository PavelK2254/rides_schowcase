import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location_pkg;
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/map_widget_cubit.dart';
import 'package:rides_showcase/services/location_provider.dart';

// Mock location constants
const _mockLocation = LatLng(37.42796133580664, -122.085749655962);
const _pickupLocation = LatLng(37.7749, -122.4194);
const _destinationLocation = LatLng(34.0522, -118.2437);

// Mock classes
class MockMainFlowRepository extends Mock implements MainFlowRepository {}

class MockLocationProvider extends Mock implements LocationProvider {}

class MockGoogleMapController extends Mock implements GoogleMapController {}

class MockCameraUpdate extends Mock implements CameraUpdate {}

class MockLocationData extends Mock implements location_pkg.LocationData {
  MockLocationData({this.latitude, this.longitude});
  @override
  final double? latitude;
  @override
  final double? longitude;
}

void main() {
  late MapWidgetCubit mapWidgetCubit;
  late MockMainFlowRepository mockMainFlowRepository;
  late MockLocationProvider mockLocationProvider;
  late MockGoogleMapController mockGoogleMapController;

  setUpAll(() {
    registerFallbackValue(MockCameraUpdate());
  });

  setUp(() {
    mockMainFlowRepository = MockMainFlowRepository();
    mockLocationProvider = MockLocationProvider();
    mockGoogleMapController = MockGoogleMapController();

    // Set up controller to return Future.value() for animateCamera
    when(() => mockGoogleMapController.animateCamera(any()))
        .thenAnswer((_) => Future.value());

    mapWidgetCubit =
        MapWidgetCubit(mockMainFlowRepository, mockLocationProvider)
          ..controller = mockGoogleMapController;
  });

  group('MapWidgetCubit', () {
    test('initial state should be HomeScreenInitial with default location', () {
      expect(mapWidgetCubit.state, isA<HomeScreenInitial>());
      expect(mapWidgetCubit.state.currentLocation, equals(_mockLocation));
      expect(mapWidgetCubit.state.circles, isEmpty);
    });

    group('loadInitialLocation', () {
      test(
        'should get current location and animate camera',
        () async {
          // Arrange
          final mockLocationData = MockLocationData(
            latitude: 40.7128,
            longitude: -74.0060,
          );

          when(() => mockLocationProvider.getCurrentLocation())
              .thenAnswer((_) async => mockLocationData);

          // Act
          await mapWidgetCubit.loadInitialLocation();

          // Assert
          verify(() => mockLocationProvider.getCurrentLocation()).called(1);
          verify(() => mockGoogleMapController.animateCamera(any())).called(1);
        },
      );

      test(
        'should use mock location when location data is null',
        () async {
          // Arrange
          final mockLocationData = MockLocationData();

          when(() => mockLocationProvider.getCurrentLocation())
              .thenAnswer((_) async => mockLocationData);

          // Act
          await mapWidgetCubit.loadInitialLocation();

          // Assert
          verify(() => mockLocationProvider.getCurrentLocation()).called(1);
          verify(() => mockGoogleMapController.animateCamera(any())).called(1);
        },
      );
    });

    group('setMapLocation', () {
      test(
        'should animate camera to new location',
        () async {
          // Arrange
          final testLocation = Location(
            latitude: 34.0522,
            longitude: -118.2437,
            timestamp: DateTime.now(),
          );

          // Act
          await mapWidgetCubit.setMapLocation(testLocation);

          // Assert
          verify(() => mockGoogleMapController.animateCamera(any())).called(1);
        },
      );
    });

    group('addMapMarkers', () {
      testWidgets(
        'emits HomeScreenUpdateLocation circles when addMapMarkers is called',
        (WidgetTester tester) async {
          // Setup the mock repository with locations
          when(() => mockMainFlowRepository.pickupLocation)
              .thenReturn(_pickupLocation);
          when(() => mockMainFlowRepository.destinationLocation)
              .thenReturn(_destinationLocation);

          // Build a MaterialApp to get a valid BuildContext with Theme
          await tester.pumpWidget(
            MaterialApp(
              theme: ThemeData(primaryColor: Colors.blue),
              home: const SizedBox(),
            ),
          );

          // Get the valid BuildContext from the widget tree
          final context = tester.element(find.byType(SizedBox));

          // Act - call addMapMarkers
          mapWidgetCubit.addMapMarkers(context);

          // Assert - verify state was updated correctly
          expect(
            mapWidgetCubit.state,
            isA<HomeScreenUpdateLocation>().having(
              (state) => state.circles.length,
              'circles length',
              equals(2),
            ),
          );

          // Verify circle centers match the expected locations
          final circles = mapWidgetCubit.state.circles;
          expect(circles[0].center, equals(_pickupLocation));
          expect(circles[1].center, equals(_destinationLocation));
        },
      );

      testWidgets(
        'should handle null locations',
        (WidgetTester tester) async {
          // Setup the mock repository with null locations
          when(() => mockMainFlowRepository.pickupLocation).thenReturn(null);
          when(() => mockMainFlowRepository.destinationLocation)
              .thenReturn(null);

          // Build a MaterialApp to get a valid BuildContext with Theme
          await tester.pumpWidget(
            MaterialApp(
              theme: ThemeData(primaryColor: Colors.blue),
              home: const SizedBox(),
            ),
          );

          final context = tester.element(find.byType(SizedBox));

          // We expect the operation to fail with null locations
          expect(
            () => mapWidgetCubit.addMapMarkers(context),
            throwsA(isA<TypeError>()),
          );
        },
      );
    });
  });
}
