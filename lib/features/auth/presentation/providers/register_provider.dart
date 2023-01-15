import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/presentation/providers/user_provider.dart';

import '../../../../core/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../../domain/repositories/auth_repository.dart';
import '../states/register_state.dart';
import 'auth_repository_provider.dart';

class _RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthRepository repository;
  final UserNotifier userNotifier;

  _RegisterNotifier({
    required this.userNotifier,
    required this.repository,
  }) : super(RegisterState.initial());

  Future<void> registerWithEmailAndPassword() async {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());

    if (state.emailFailure.isNone() && state.passwordFailure.isNone() && state.nameFailure.isNone()) {
      state = state.copyWith(isLoading: true);

      final result = await repository.registerWithEmailAndPassword(
        name: state.name,
        email: state.email,
        password: state.password,
      );

      userNotifier.setUser(result.toOption());

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
  final userNotifier = ref.watch(userProvider.notifier);
  final repository = ref.watch(authRepositoryProvider);

  return _RegisterNotifier(userNotifier: userNotifier, repository: repository);
});
