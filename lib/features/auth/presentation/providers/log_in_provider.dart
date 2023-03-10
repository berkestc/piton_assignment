import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../../domain/repositories/auth_repository.dart';
import '../states/log_in_state.dart';
import 'auth_repository_provider.dart';
import 'user_provider.dart';

class _LogInNotifier extends StateNotifier<LogInState> {
  final AuthRepository repository;
  final UserNotifier userNotifier;

  _LogInNotifier({
    required this.repository,
    required this.userNotifier,
  }) : super(LogInState.initial());

  Future<void> logInWithEmailAndPassword() async {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());

    if (state.emailFailure.isNone() && state.passwordFailure.isNone()) {
      state = state.copyWith(isLoading: true);

      final result = await repository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
        rememberMe: state.rememberMe,
      );

      userNotifier.setUser(result.toOption());

      state = state.copyWith(failure: some(result.map((r) => unit)), isLoading: false);
    }
  }

  void onEmailChanged(String? email) {
    state = state.copyWith(
      emailFailure: validateEmailAddress(email ?? ""),
      email: email ?? "",
    );
  }

  void onPasswordChanged(String? password) {
    state = state.copyWith(
      passwordFailure: isEmptyValidator(password ?? ""),
      password: password ?? "",
    );
  }

  void toggleRememberMe() {
    state = state.copyWith(rememberMe: !state.rememberMe);
  }
}

final logInProvider = StateNotifierProvider.autoDispose<_LogInNotifier, LogInState>((ref) {
  final userNotifier = ref.watch(userProvider.notifier);
  final repository = ref.watch(authRepositoryProvider);

  return _LogInNotifier(userNotifier: userNotifier, repository: repository);
});
