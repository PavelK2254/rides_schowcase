// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RideEntity _$RideEntityFromJson(Map<String, dynamic> json) => _RideEntity(
      pickupLocation:
          RideLocation.fromJson(json['pickupLocation'] as Map<String, dynamic>),
      destinationLocation: RideLocation.fromJson(
        json['destinationLocation'] as Map<String, dynamic>,
      ),
      rideType: RideType.fromJson(json['rideType'] as Map<String, dynamic>),
      selectedDate: DateTime.parse(json['selectedDate'] as String),
      passengerAmount: json['passengerAmount'] as String,
    );

Map<String, dynamic> _$RideEntityToJson(_RideEntity instance) =>
    <String, dynamic>{
      'pickupLocation': instance.pickupLocation,
      'destinationLocation': instance.destinationLocation,
      'rideType': instance.rideType,
      'selectedDate': instance.selectedDate.toIso8601String(),
      'passengerAmount': instance.passengerAmount,
    };
