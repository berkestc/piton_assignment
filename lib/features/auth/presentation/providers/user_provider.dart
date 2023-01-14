import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/domain/repositories/auth_repository.dart';
import 'package:piton_assignment/features/auth/presentation/providers/auth_repository_provider.dart';

import '../states/user_state.dart';

class _UserNotifier extends StateNotifier<UserState> {
  final AuthRepository repository;

  _UserNotifier({required this.repository}) : super(UserState.initial()) {
    _getSignedInUser();
  }

  Future<void> _getSignedInUser() async {
    final result = await repository.getSignedInUser();

    state = state.copyWith(user: result, isLoading: false);
  }
}

final userProvider = StateNotifierProvider.autoDispose<_UserNotifier, UserState>((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return _UserNotifier(repository: repository);
});
