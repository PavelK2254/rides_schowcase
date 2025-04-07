import 'package:flutter_test/flutter_test.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';

void main() {
  group('RideType', () {
    test('fromJson creates a valid RideType object', () {
      final json = {
        'name': 'Standard',
        'imagePath': 'path/to/image.png',
        'description': 'Standard ride',
        'price': '10.00',
      };

      final rideType = RideType.fromJson(json);

      expect(rideType.name, 'Standard');
      expect(rideType.imagePath, 'path/to/image.png');
      expect(rideType.description, 'Standard ride');
      expect(rideType.price, '10.00');
    });

    test('fromJson throws an error when required fields are missing', () {
      final json = {
        'name': 'Standard',
        'imagePath': 'path/to/image.png',
        'description': 'Standard ride',
      };

      expect(() => RideType.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('toJson returns a valid JSON map', () {
      const rideType = RideType(
        name: 'Standard',
        imagePath: 'path/to/image.png',
        description: 'Standard ride',
        price: '10.00',
      );

      final json = rideType.toJson();

      expect(json['name'], 'Standard');
      expect(json['imagePath'], 'path/to/image.png');
      expect(json['description'], 'Standard ride');
      expect(json['price'], '10.00');
    });
  });
}
