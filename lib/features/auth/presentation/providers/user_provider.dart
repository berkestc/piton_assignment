import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../states/user_state.dart';
import 'auth_repository_provider.dart';

class UserNotifier extends StateNotifier<UserState> {
  final AuthRepository repository;

  UserNotifier({required this.repository}) : super(UserState.initial()) {
    _getSignedInUser();
  }

  void setUser(Option<User> user) {
    state = state.copyWith(user: user);
  }

  Future<void> _getSignedInUser() async {
    final result = await repository.getSignedInUser();

    state = state.copyWith(user: result, isLoading: false);
  }
}

final userProvider = StateNotifierProvider.autoDispose<UserNotifier, UserState>((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return UserNotifier(repository: repository);
});
