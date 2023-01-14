import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../core/value_failure.dart';
import '../../domain/core/auth_failure.dart';

part 'log_in_state.freezed.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState({
    required ValidationErrorVisibility validationErrorVisibility,
    required Option<Either<AuthFailure, Unit>> failure,
    required Option<ValueFailure> emailFailure,
    required Option<ValueFailure> passwordFailure,
    required String email,
    required String password,
    required bool rememberMe,
    required bool isLoading,
  }) = _LogInState;

  factory LogInState.initial() {
    return LogInState(
      validationErrorVisibility: const ValidationErrorVisibility.hide(),
      failure: none(),
      emailFailure: none(),
      passwordFailure: none(),
      email: "",
      password: "",
      rememberMe: false,
      isLoading: false,
    );
  }
}
