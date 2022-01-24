// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
class _$TripTearOff {
  const _$TripTearOff();

  _Trip call(
      {required String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      Location? startLocation,
      Location? endLocation,
      int? headCount,
      String? transportMode}) {
    return _Trip(
      uid: uid,
      name: name,
      startAt: startAt,
      endAt: endAt,
      startLocation: startLocation,
      endLocation: endLocation,
      headCount: headCount,
      transportMode: transportMode,
    );
  }

  Trip fromJson(Map<String, Object?> json) {
    return Trip.fromJson(json);
  }
}

/// @nodoc
const $Trip = _$TripTearOff();

/// @nodoc
mixin _$Trip {
  String get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get startAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;
  Location? get startLocation => throw _privateConstructorUsedError;
  Location? get endLocation => throw _privateConstructorUsedError;
  int? get headCount => throw _privateConstructorUsedError;
  String? get transportMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      Location? startLocation,
      Location? endLocation,
      int? headCount,
      String? transportMode});

  $LocationCopyWith<$Res>? get startLocation;
  $LocationCopyWith<$Res>? get endLocation;
}

/// @nodoc
class _$TripCopyWithImpl<$Res> implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  final Trip _value;
  // ignore: unused_field
  final $Res Function(Trip) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? headCount = freezed,
    Object? transportMode = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      headCount: headCount == freezed
          ? _value.headCount
          : headCount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportMode: transportMode == freezed
          ? _value.transportMode
          : transportMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $LocationCopyWith<$Res>? get startLocation {
    if (_value.startLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.startLocation!, (value) {
      return _then(_value.copyWith(startLocation: value));
    });
  }

  @override
  $LocationCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value));
    });
  }
}

/// @nodoc
abstract class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) then) =
      __$TripCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      Location? startLocation,
      Location? endLocation,
      int? headCount,
      String? transportMode});

  @override
  $LocationCopyWith<$Res>? get startLocation;
  @override
  $LocationCopyWith<$Res>? get endLocation;
}

/// @nodoc
class __$TripCopyWithImpl<$Res> extends _$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(_Trip _value, $Res Function(_Trip) _then)
      : super(_value, (v) => _then(v as _Trip));

  @override
  _Trip get _value => super._value as _Trip;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? headCount = freezed,
    Object? transportMode = freezed,
  }) {
    return _then(_Trip(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      headCount: headCount == freezed
          ? _value.headCount
          : headCount // ignore: cast_nullable_to_non_nullable
              as int?,
      transportMode: transportMode == freezed
          ? _value.transportMode
          : transportMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Trip extends _Trip {
  _$_Trip(
      {required this.uid,
      this.name,
      this.startAt,
      this.endAt,
      this.startLocation,
      this.endLocation,
      this.headCount,
      this.transportMode})
      : super._();

  factory _$_Trip.fromJson(Map<String, dynamic> json) => _$$_TripFromJson(json);

  @override
  final String uid;
  @override
  final String? name;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final Location? startLocation;
  @override
  final Location? endLocation;
  @override
  final int? headCount;
  @override
  final String? transportMode;

  @override
  String toString() {
    return 'Trip(uid: $uid, name: $name, startAt: $startAt, endAt: $endAt, startLocation: $startLocation, endLocation: $endLocation, headCount: $headCount, transportMode: $transportMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Trip &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.startAt, startAt) &&
            const DeepCollectionEquality().equals(other.endAt, endAt) &&
            const DeepCollectionEquality()
                .equals(other.startLocation, startLocation) &&
            const DeepCollectionEquality()
                .equals(other.endLocation, endLocation) &&
            const DeepCollectionEquality().equals(other.headCount, headCount) &&
            const DeepCollectionEquality()
                .equals(other.transportMode, transportMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(startAt),
      const DeepCollectionEquality().hash(endAt),
      const DeepCollectionEquality().hash(startLocation),
      const DeepCollectionEquality().hash(endLocation),
      const DeepCollectionEquality().hash(headCount),
      const DeepCollectionEquality().hash(transportMode));

  @JsonKey(ignore: true)
  @override
  _$TripCopyWith<_Trip> get copyWith =>
      __$TripCopyWithImpl<_Trip>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripToJson(this);
  }
}

abstract class _Trip extends Trip {
  factory _Trip(
      {required String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      Location? startLocation,
      Location? endLocation,
      int? headCount,
      String? transportMode}) = _$_Trip;
  _Trip._() : super._();

  factory _Trip.fromJson(Map<String, dynamic> json) = _$_Trip.fromJson;

  @override
  String get uid;
  @override
  String? get name;
  @override
  DateTime? get startAt;
  @override
  DateTime? get endAt;
  @override
  Location? get startLocation;
  @override
  Location? get endLocation;
  @override
  int? get headCount;
  @override
  String? get transportMode;
  @override
  @JsonKey(ignore: true)
  _$TripCopyWith<_Trip> get copyWith => throw _privateConstructorUsedError;
}
