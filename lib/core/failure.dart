import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.noConnection() = _NoConncection;
  const factory Failure.unknownError() = _UnknownError;
}
