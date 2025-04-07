// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RideType _$RideTypeFromJson(Map<String, dynamic> json) => _RideType(
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$RideTypeToJson(_RideType instance) => <String, dynamic>{
      'name': instance.name,
      'imagePath': instance.imagePath,
      'description': instance.description,
      'price': instance.price,
    };
