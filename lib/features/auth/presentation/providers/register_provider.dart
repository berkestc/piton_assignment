import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/domain/repositories/auth_repository.dart';
import 'package:piton_assignment/features/auth/presentation/providers/auth_repository_provider.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/register_state.dart';

class _RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthRepository repository;

  _RegisterNotifier({required this.repository}) : super(RegisterState.initial());

  Future<void> registerWithEmailAndPassword() async {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());

    if (state.emailFailure.isNone() && state.passwordFailure.isNone() && state.nameFailure.isNone()) {
      state = state.copyWith(isLoading: true);

      final result = await repository.registerWithEmailAndPassword(
        name: state.name,
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(failure: some(result.map((r) => unit)), isLoading: false);
    }
  }

  void onNameChanged(String? name) {
    state = state.copyWith(
      nameFailure: validateName(name ?? ""),
      name: name ?? "",
    );
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
}

final registerProvider = StateNotifierProvider.autoDispose<_RegisterNotifier, RegisterState>((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return _RegisterNotifier(repository: repository);
});
