// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RideEntity implements DiagnosticableTreeMixin {
  RideLocation get pickupLocation;
  RideLocation get destinationLocation;
  RideType get rideType;
  DateTime get selectedDate;
  String get passengerAmount;

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RideEntityCopyWith<RideEntity> get copyWith =>
      _$RideEntityCopyWithImpl<RideEntity>(this as RideEntity, _$identity);

  /// Serializes this RideEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideEntity'))
      ..add(DiagnosticsProperty('pickupLocation', pickupLocation))
      ..add(DiagnosticsProperty('destinationLocation', destinationLocation))
      ..add(DiagnosticsProperty('rideType', rideType))
      ..add(DiagnosticsProperty('selectedDate', selectedDate))
      ..add(DiagnosticsProperty('passengerAmount', passengerAmount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RideEntity &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.rideType, rideType) ||
                other.rideType == rideType) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.passengerAmount, passengerAmount) ||
                other.passengerAmount == passengerAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pickupLocation,
      destinationLocation, rideType, selectedDate, passengerAmount);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideEntity(pickupLocation: $pickupLocation, destinationLocation: $destinationLocation, rideType: $rideType, selectedDate: $selectedDate, passengerAmount: $passengerAmount)';
  }
}

/// @nodoc
abstract mixin class $RideEntityCopyWith<$Res> {
  factory $RideEntityCopyWith(
          RideEntity value, $Res Function(RideEntity) _then) =
      _$RideEntityCopyWithImpl;
  @useResult
  $Res call(
      {RideLocation pickupLocation,
      RideLocation destinationLocation,
      RideType rideType,
      DateTime selectedDate,
      String passengerAmount});

  $RideLocationCopyWith<$Res> get pickupLocation;
  $RideLocationCopyWith<$Res> get destinationLocation;
  $RideTypeCopyWith<$Res> get rideType;
}

/// @nodoc
class _$RideEntityCopyWithImpl<$Res> implements $RideEntityCopyWith<$Res> {
  _$RideEntityCopyWithImpl(this._self, this._then);

  final RideEntity _self;
  final $Res Function(RideEntity) _then;

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupLocation = null,
    Object? destinationLocation = null,
    Object? rideType = null,
    Object? selectedDate = null,
    Object? passengerAmount = null,
  }) {
    return _then(_self.copyWith(
      pickupLocation: null == pickupLocation
          ? _self.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as RideLocation,
      destinationLocation: null == destinationLocation
          ? _self.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as RideLocation,
      rideType: null == rideType
          ? _self.rideType
          : rideType // ignore: cast_nullable_to_non_nullable
              as RideType,
      selectedDate: null == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      passengerAmount: null == passengerAmount
          ? _self.passengerAmount
          : passengerAmount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideLocationCopyWith<$Res> get pickupLocation {
    return $RideLocationCopyWith<$Res>(_self.pickupLocation, (value) {
      return _then(_self.copyWith(pickupLocation: value));
    });
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideLocationCopyWith<$Res> get destinationLocation {
    return $RideLocationCopyWith<$Res>(_self.destinationLocation, (value) {
      return _then(_self.copyWith(destinationLocation: value));
    });
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideTypeCopyWith<$Res> get rideType {
    return $RideTypeCopyWith<$Res>(_self.rideType, (value) {
      return _then(_self.copyWith(rideType: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RideEntity with DiagnosticableTreeMixin implements RideEntity {
  const _RideEntity(
      {required this.pickupLocation,
      required this.destinationLocation,
      required this.rideType,
      required this.selectedDate,
      required this.passengerAmount});
  factory _RideEntity.fromJson(Map<String, dynamic> json) =>
      _$RideEntityFromJson(json);

  @override
  final RideLocation pickupLocation;
  @override
  final RideLocation destinationLocation;
  @override
  final RideType rideType;
  @override
  final DateTime selectedDate;
  @override
  final String passengerAmount;

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RideEntityCopyWith<_RideEntity> get copyWith =>
      __$RideEntityCopyWithImpl<_RideEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RideEntityToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideEntity'))
      ..add(DiagnosticsProperty('pickupLocation', pickupLocation))
      ..add(DiagnosticsProperty('destinationLocation', destinationLocation))
      ..add(DiagnosticsProperty('rideType', rideType))
      ..add(DiagnosticsProperty('selectedDate', selectedDate))
      ..add(DiagnosticsProperty('passengerAmount', passengerAmount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RideEntity &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.rideType, rideType) ||
                other.rideType == rideType) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.passengerAmount, passengerAmount) ||
                other.passengerAmount == passengerAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pickupLocation,
      destinationLocation, rideType, selectedDate, passengerAmount);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideEntity(pickupLocation: $pickupLocation, destinationLocation: $destinationLocation, rideType: $rideType, selectedDate: $selectedDate, passengerAmount: $passengerAmount)';
  }
}

/// @nodoc
abstract mixin class _$RideEntityCopyWith<$Res>
    implements $RideEntityCopyWith<$Res> {
  factory _$RideEntityCopyWith(
          _RideEntity value, $Res Function(_RideEntity) _then) =
      __$RideEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RideLocation pickupLocation,
      RideLocation destinationLocation,
      RideType rideType,
      DateTime selectedDate,
      String passengerAmount});

  @override
  $RideLocationCopyWith<$Res> get pickupLocation;
  @override
  $RideLocationCopyWith<$Res> get destinationLocation;
  @override
  $RideTypeCopyWith<$Res> get rideType;
}

/// @nodoc
class __$RideEntityCopyWithImpl<$Res> implements _$RideEntityCopyWith<$Res> {
  __$RideEntityCopyWithImpl(this._self, this._then);

  final _RideEntity _self;
  final $Res Function(_RideEntity) _then;

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pickupLocation = null,
    Object? destinationLocation = null,
    Object? rideType = null,
    Object? selectedDate = null,
    Object? passengerAmount = null,
  }) {
    return _then(_RideEntity(
      pickupLocation: null == pickupLocation
          ? _self.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as RideLocation,
      destinationLocation: null == destinationLocation
          ? _self.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as RideLocation,
      rideType: null == rideType
          ? _self.rideType
          : rideType // ignore: cast_nullable_to_non_nullable
              as RideType,
      selectedDate: null == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      passengerAmount: null == passengerAmount
          ? _self.passengerAmount
          : passengerAmount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideLocationCopyWith<$Res> get pickupLocation {
    return $RideLocationCopyWith<$Res>(_self.pickupLocation, (value) {
      return _then(_self.copyWith(pickupLocation: value));
    });
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideLocationCopyWith<$Res> get destinationLocation {
    return $RideLocationCopyWith<$Res>(_self.destinationLocation, (value) {
      return _then(_self.copyWith(destinationLocation: value));
    });
  }

  /// Create a copy of RideEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RideTypeCopyWith<$Res> get rideType {
    return $RideTypeCopyWith<$Res>(_self.rideType, (value) {
      return _then(_self.copyWith(rideType: value));
    });
  }
}

// dart format on
