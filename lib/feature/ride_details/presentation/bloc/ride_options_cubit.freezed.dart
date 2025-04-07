// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_options_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RideOptionsState {
  DateTime? get dateTime;
  int get passengers;

  /// Create a copy of RideOptionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RideOptionsStateCopyWith<RideOptionsState> get copyWith =>
      _$RideOptionsStateCopyWithImpl<RideOptionsState>(
          this as RideOptionsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RideOptionsState &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.passengers, passengers) ||
                other.passengers == passengers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, passengers);

  @override
  String toString() {
    return 'RideOptionsState(dateTime: $dateTime, passengers: $passengers)';
  }
}

/// @nodoc
abstract mixin class $RideOptionsStateCopyWith<$Res> {
  factory $RideOptionsStateCopyWith(
          RideOptionsState value, $Res Function(RideOptionsState) _then) =
      _$RideOptionsStateCopyWithImpl;
  @useResult
  $Res call({DateTime? dateTime, int passengers});
}

/// @nodoc
class _$RideOptionsStateCopyWithImpl<$Res>
    implements $RideOptionsStateCopyWith<$Res> {
  _$RideOptionsStateCopyWithImpl(this._self, this._then);

  final RideOptionsState _self;
  final $Res Function(RideOptionsState) _then;

  /// Create a copy of RideOptionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? passengers = null,
  }) {
    return _then(_self.copyWith(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      passengers: null == passengers
          ? _self.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _RideOptionsState implements RideOptionsState {
  const _RideOptionsState({this.dateTime, this.passengers = 1});

  @override
  final DateTime? dateTime;
  @override
  @JsonKey()
  final int passengers;

  /// Create a copy of RideOptionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RideOptionsStateCopyWith<_RideOptionsState> get copyWith =>
      __$RideOptionsStateCopyWithImpl<_RideOptionsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RideOptionsState &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.passengers, passengers) ||
                other.passengers == passengers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, passengers);

  @override
  String toString() {
    return 'RideOptionsState(dateTime: $dateTime, passengers: $passengers)';
  }
}

/// @nodoc
abstract mixin class _$RideOptionsStateCopyWith<$Res>
    implements $RideOptionsStateCopyWith<$Res> {
  factory _$RideOptionsStateCopyWith(
          _RideOptionsState value, $Res Function(_RideOptionsState) _then) =
      __$RideOptionsStateCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime? dateTime, int passengers});
}

/// @nodoc
class __$RideOptionsStateCopyWithImpl<$Res>
    implements _$RideOptionsStateCopyWith<$Res> {
  __$RideOptionsStateCopyWithImpl(this._self, this._then);

  final _RideOptionsState _self;
  final $Res Function(_RideOptionsState) _then;

  /// Create a copy of RideOptionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dateTime = freezed,
    Object? passengers = null,
  }) {
    return _then(_RideOptionsState(
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      passengers: null == passengers
          ? _self.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
