import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/domain/repositories/auth_repository.dart';
import 'package:piton_assignment/features/auth/presentation/providers/auth_repository_provider.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/log_in_state.dart';

class _LogInNotifier extends StateNotifier<LogInState> {
  final AuthRepository repository;

  _LogInNotifier({required this.repository}) : super(LogInState.initial());

  Future<void> logInWithEmailAndPassword() async {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());

    if (state.emailFailure.isNone() && state.passwordFailure.isNone()) {
      state = state.copyWith(isLoading: true);

      final result = await repository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
        rememberMe: state.rememberMe,
      );

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
  final repository = ref.watch(authRepositoryProvider);

  return _LogInNotifier(repository: repository);
});
