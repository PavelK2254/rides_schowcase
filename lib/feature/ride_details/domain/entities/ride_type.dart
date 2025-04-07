import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_type.freezed.dart';
part 'ride_type.g.dart';

@freezed
abstract class RideType with _$RideType {
  const factory RideType({
    required String name,
    required String imagePath,
    required String description,
    required String price,
    required String eta,
  }) = _RideType;

  factory RideType.fromJson(Map<String, dynamic> json) =>
      _$RideTypeFromJson(json);
}
