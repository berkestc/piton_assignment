import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.noConnection() = _NoConncection;
  const factory AuthFailure.unknownError() = _UnknownError;
  const factory AuthFailure.invalidEmailOrPassword() = _InvalidEmailOrPassword;
}
