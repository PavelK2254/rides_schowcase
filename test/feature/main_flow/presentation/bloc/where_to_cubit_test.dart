import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rides_showcase/feature/main_flow/data/remote/data_sources/geocoding_service.dart';
import 'package:rides_showcase/feature/main_flow/domain/repositories/main_flow_repository.dart';
import 'package:rides_showcase/feature/main_flow/presentation/bloc/where_to_cubit.dart';

class MockMainFlowRepository extends Mock implements MainFlowRepository {}

class MockGeocodingService extends Mock implements GeocodingService {
  @override
  Future<List<Location>> getLocationFromAddress(String address) async {
    return [
      Location(
        latitude: 37.7749,
        longitude: -122.4194,
        timestamp: DateTime.now(),
      ),
    ];
  }
}

void main() {
  late WhereToCubit whereToCubit;
  late MockMainFlowRepository mockMainFlowRepository;
  late MockGeocodingService mockGeocodingService;

  setUp(() {
    mockMainFlowRepository = MockMainFlowRepository();
    mockGeocodingService = MockGeocodingService();
    whereToCubit = WhereToCubit(mockMainFlowRepository, mockGeocodingService);
  });

  test('initial state is WhereToInitial', () {
    expect(whereToCubit.state, WhereToInitial());
  });

  blocTest<WhereToCubit, WhereToState>(
    'emits [WhereToLoaded] when valid pickup location is provided',
    build: () => whereToCubit,
    act: (cubit) {
      cubit.pickupController.text = 'San Francisco';
    },
    wait: const Duration(milliseconds: 500),
    expect: () => [isA<WhereToLoaded>()],
  );
}
