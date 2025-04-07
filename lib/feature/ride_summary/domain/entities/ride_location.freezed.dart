// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RideLocation implements DiagnosticableTreeMixin {
  double get latitude;
  double get longitude;

  /// Create a copy of RideLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RideLocationCopyWith<RideLocation> get copyWith =>
      _$RideLocationCopyWithImpl<RideLocation>(
          this as RideLocation, _$identity);

  /// Serializes this RideLocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideLocation'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RideLocation &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideLocation(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $RideLocationCopyWith<$Res> {
  factory $RideLocationCopyWith(
          RideLocation value, $Res Function(RideLocation) _then) =
      _$RideLocationCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$RideLocationCopyWithImpl<$Res> implements $RideLocationCopyWith<$Res> {
  _$RideLocationCopyWithImpl(this._self, this._then);

  final RideLocation _self;
  final $Res Function(RideLocation) _then;

  /// Create a copy of RideLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RideLocation with DiagnosticableTreeMixin implements RideLocation {
  const _RideLocation({required this.latitude, required this.longitude});
  factory _RideLocation.fromJson(Map<String, dynamic> json) =>
      _$RideLocationFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  /// Create a copy of RideLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RideLocationCopyWith<_RideLocation> get copyWith =>
      __$RideLocationCopyWithImpl<_RideLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RideLocationToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideLocation'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RideLocation &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideLocation(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$RideLocationCopyWith<$Res>
    implements $RideLocationCopyWith<$Res> {
  factory _$RideLocationCopyWith(
          _RideLocation value, $Res Function(_RideLocation) _then) =
      __$RideLocationCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$RideLocationCopyWithImpl<$Res>
    implements _$RideLocationCopyWith<$Res> {
  __$RideLocationCopyWithImpl(this._self, this._then);

  final _RideLocation _self;
  final $Res Function(_RideLocation) _then;

  /// Create a copy of RideLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_RideLocation(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
