// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthRequestTearOff {
  const _$AuthRequestTearOff();

  _AuthRequest call({required String email, String? password, String? name}) {
    return _AuthRequest(
      email: email,
      password: password,
      name: name,
    );
  }
}

/// @nodoc
const $AuthRequest = _$AuthRequestTearOff();

/// @nodoc
mixin _$AuthRequest {
  String get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthRequestCopyWith<AuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthRequestCopyWith<$Res> {
  factory $AuthRequestCopyWith(
          AuthRequest value, $Res Function(AuthRequest) then) =
      _$AuthRequestCopyWithImpl<$Res>;
  $Res call({String email, String? password, String? name});
}

/// @nodoc
class _$AuthRequestCopyWithImpl<$Res> implements $AuthRequestCopyWith<$Res> {
  _$AuthRequestCopyWithImpl(this._value, this._then);

  final AuthRequest _value;
  // ignore: unused_field
  final $Res Function(AuthRequest) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthRequestCopyWith<$Res>
    implements $AuthRequestCopyWith<$Res> {
  factory _$AuthRequestCopyWith(
          _AuthRequest value, $Res Function(_AuthRequest) then) =
      __$AuthRequestCopyWithImpl<$Res>;
  @override
  $Res call({String email, String? password, String? name});
}

/// @nodoc
class __$AuthRequestCopyWithImpl<$Res> extends _$AuthRequestCopyWithImpl<$Res>
    implements _$AuthRequestCopyWith<$Res> {
  __$AuthRequestCopyWithImpl(
      _AuthRequest _value, $Res Function(_AuthRequest) _then)
      : super(_value, (v) => _then(v as _AuthRequest));

  @override
  _AuthRequest get _value => super._value as _AuthRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_AuthRequest(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthRequest implements _AuthRequest {
  _$_AuthRequest({required this.email, this.password, this.name});

  @override
  final String email;
  @override
  final String? password;
  @override
  final String? name;

  @override
  String toString() {
    return 'AuthRequest(email: $email, password: $password, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthRequest &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$AuthRequestCopyWith<_AuthRequest> get copyWith =>
      __$AuthRequestCopyWithImpl<_AuthRequest>(this, _$identity);
}

abstract class _AuthRequest implements AuthRequest {
  factory _AuthRequest(
      {required String email, String? password, String? name}) = _$_AuthRequest;

  @override
  String get email;
  @override
  String? get password;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$AuthRequestCopyWith<_AuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
