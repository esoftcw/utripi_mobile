import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';

@freezed
class AuthRequest with _$AuthRequest {
  factory AuthRequest({ required String email, String? password, String? name }) = _AuthRequest;
}