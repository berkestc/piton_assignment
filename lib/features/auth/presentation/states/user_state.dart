import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required Option<User> user,
    required bool isLoading,
  }) = _UserState;

  factory UserState.initial() {
    return UserState(
      user: none(),
      isLoading: true,
    );
  }
}
