import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';

final List<RideType> rideTypes = [
  const RideType(
    name: 'Standard',
    imagePath: 'assets/images/standart.jpg',
    description: 'Affordable everyday rides',
    price: r'$9.50',
  ),
  const RideType(
    name: 'Economy',
    imagePath: 'assets/images/economy.jpg',
    description: 'Cheapest option available',
    price: r'$7.20',
  ),
  const RideType(
    name: 'Comfort',
    imagePath: 'assets/images/comfort.jpg',
    description: 'Spacious and smooth',
    price: r'$12.80',
  ),
  const RideType(
    name: 'VIP',
    imagePath: 'assets/images/vip.jpg',
    description: 'Luxury ride experience',
    price: r'$19.99',
  ),
];
