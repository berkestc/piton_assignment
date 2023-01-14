import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/domain/models/user.dart';
import 'package:piton_assignment/features/auth/presentation/providers/user_provider.dart';
import 'package:piton_assignment/features/books/domain/repositories/books_repository.dart';
import 'package:piton_assignment/features/books/presentation/providers/books_repository_provider.dart';

import '../states/books_state.dart';

class _BooksNotifier extends StateNotifier<BooksState> {
  final BooksRepository repository;
  final User user;

  _BooksNotifier({
    required this.repository,
    required this.user,
  }) : super(BooksState.initial()) {
    _getCategories();
  }

  Future<void> refresh() => _getCategories();

  Future<void> _getCategories() async {
    final result = await repository.getCategories();

    state = state.copyWith(
      categories: result.fold((l) => state.categories, (r) => r),
      failure: result.swap().toOption(),
      isLoading: false,
    );
  }

  void toggleLike(int productId) {
    if (state.likedProductIds.contains(productId)) {
      repository.unlikeProduct(productId);

      state = state.copyWith(
        likedProductIds: [
          for (final id in state.likedProductIds)
            if (id != productId) id
        ],
      );
    } else {
      repository.likeProduct(productId);

      state = state.copyWith(likedProductIds: [...state.likedProductIds, productId]);
    }
  }

  void setFilter(int? categoryId) {
    state = state.copyWith(selectedCategoryId: optionOf(categoryId));
  }

  void onSearchFilterChanged(String? value) {
    state = state.copyWith(searchFilter: value?.toLowerCase() ?? "");
  }
}

final booksProvider = StateNotifierProvider.autoDispose<_BooksNotifier, BooksState>((ref) {
  final repository = ref.watch(booksRepositoryProvider);
  final user = ref.watch(userProvider).user.toNullable()!;

  return _BooksNotifier(repository: repository, user: user);
});
