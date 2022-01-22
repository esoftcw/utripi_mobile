import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_oparation.freezed.dart';

@freezed
abstract class AuthFormOperation with _$AuthFormOperation {
  const factory AuthFormOperation.login() = Login;
  const factory AuthFormOperation.register() = Register;
  const factory AuthFormOperation.reset() = Reset;
}