// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RideType implements DiagnosticableTreeMixin {
  String get name;
  String get imagePath;
  String get description;
  String get price;
  String get eta;

  /// Create a copy of RideType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RideTypeCopyWith<RideType> get copyWith =>
      _$RideTypeCopyWithImpl<RideType>(this as RideType, _$identity);

  /// Serializes this RideType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideType'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('eta', eta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RideType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imagePath, description, price, eta);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideType(name: $name, imagePath: $imagePath, description: $description, price: $price, eta: $eta)';
  }
}

/// @nodoc
abstract mixin class $RideTypeCopyWith<$Res> {
  factory $RideTypeCopyWith(RideType value, $Res Function(RideType) _then) =
      _$RideTypeCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String imagePath,
      String description,
      String price,
      String eta});
}

/// @nodoc
class _$RideTypeCopyWithImpl<$Res> implements $RideTypeCopyWith<$Res> {
  _$RideTypeCopyWithImpl(this._self, this._then);

  final RideType _self;
  final $Res Function(RideType) _then;

  /// Create a copy of RideType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imagePath = null,
    Object? description = null,
    Object? price = null,
    Object? eta = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      eta: null == eta
          ? _self.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RideType with DiagnosticableTreeMixin implements RideType {
  const _RideType(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.price,
      required this.eta});
  factory _RideType.fromJson(Map<String, dynamic> json) =>
      _$RideTypeFromJson(json);

  @override
  final String name;
  @override
  final String imagePath;
  @override
  final String description;
  @override
  final String price;
  @override
  final String eta;

  /// Create a copy of RideType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RideTypeCopyWith<_RideType> get copyWith =>
      __$RideTypeCopyWithImpl<_RideType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RideTypeToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'RideType'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('eta', eta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RideType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imagePath, description, price, eta);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RideType(name: $name, imagePath: $imagePath, description: $description, price: $price, eta: $eta)';
  }
}

/// @nodoc
abstract mixin class _$RideTypeCopyWith<$Res>
    implements $RideTypeCopyWith<$Res> {
  factory _$RideTypeCopyWith(_RideType value, $Res Function(_RideType) _then) =
      __$RideTypeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String imagePath,
      String description,
      String price,
      String eta});
}

/// @nodoc
class __$RideTypeCopyWithImpl<$Res> implements _$RideTypeCopyWith<$Res> {
  __$RideTypeCopyWithImpl(this._self, this._then);

  final _RideType _self;
  final $Res Function(_RideType) _then;

  /// Create a copy of RideType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? imagePath = null,
    Object? description = null,
    Object? price = null,
    Object? eta = null,
  }) {
    return _then(_RideType(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      eta: null == eta
          ? _self.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
