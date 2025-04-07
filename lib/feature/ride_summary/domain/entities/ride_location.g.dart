// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RideLocation _$RideLocationFromJson(Map<String, dynamic> json) =>
    _RideLocation(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$RideLocationToJson(_RideLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
