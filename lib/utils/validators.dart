import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

import '../core/value_failure.dart';

Option<ValueFailure> validateName(String input) {
  if (input.isEmpty || input.length < 3) {
    return some(const ValueFailure.invalidValue());
  }
  final nameRegex = RegExp(r"^[\p{L} ]*$", caseSensitive: false, unicode: true, dotAll: true);

  if (nameRegex.hasMatch(input)) {
    return none();
  } else {
    return some(const ValueFailure.invalidValue());
  }
}

Option<ValueFailure> validateEmailAddress(String input) {
  if (input.isEmpty) return some(const ValueFailure.emptyField());

  if (EmailValidator.validate(input)) {
    return none();
  } else {
    return some(const ValueFailure.invalidValue());
  }
}

Option<ValueFailure> isEmptyValidator(String input) {
  if (input.isEmpty) {
    return some(const ValueFailure.emptyField());
  } else {
    return none();
  }
}
