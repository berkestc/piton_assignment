import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/books/domain/repositories/books_repository.dart';
import 'package:piton_assignment/features/books/presentation/providers/books_repository_provider.dart';

import '../states/books_state.dart';

class _BooksNotifier extends StateNotifier<BooksState> {
  final BooksRepository repository;

  _BooksNotifier({required this.repository}) : super(BooksState.initial()) {
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

  void setFilter(int? categoryId) {
    state = state.copyWith(selectedCategoryId: optionOf(categoryId));
  }

  void onSearchFilterChanged(String? value) {
    state = state.copyWith(searchFilter: value ?? "");
  }
}

final booksProvider = StateNotifierProvider.autoDispose<_BooksNotifier, BooksState>((ref) {
  final repository = ref.watch(booksRepositoryProvider);

  return _BooksNotifier(repository: repository);
});
