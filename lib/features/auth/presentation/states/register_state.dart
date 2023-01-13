import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../core/value_failure.dart';
import '../../domain/core/auth_failure.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required ValidationErrorVisibility validationErrorVisibility,
    required Option<Either<AuthFailure, Unit>> failure,
    required Option<ValueFailure> nameFailure,
    required Option<ValueFailure> emailFailure,
    required Option<ValueFailure> passwordFailure,
    required String name,
    required String email,
    required String password,
    required bool isLoading,
  }) = _RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
      validationErrorVisibility: const ValidationErrorVisibility.hide(),
      failure: none(),
      nameFailure: none(),
      emailFailure: none(),
      passwordFailure: none(),
      name: "",
      email: "",
      password: "",
      isLoading: false,
    );
  }
}
