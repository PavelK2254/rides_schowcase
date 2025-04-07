import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rides_showcase/feature/ride_details/domain/entities/ride_type.dart';
import 'package:rides_showcase/feature/ride_summary/domain/entities/ride_location.dart';

part 'ride_entity.freezed.dart';
part 'ride_entity.g.dart';

@freezed
abstract class RideEntity with _$RideEntity {
  const factory RideEntity({
    required RideLocation pickupLocation,
    required RideLocation destinationLocation,
    required RideType rideType,
    required DateTime selectedDate,
    required String passengerAmount,
  }) = _RideEntity;

  factory RideEntity.fromJson(Map<String, dynamic> json) =>
      _$RideEntityFromJson(json);
}
