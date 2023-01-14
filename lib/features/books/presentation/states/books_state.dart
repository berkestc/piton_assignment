import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piton_assignment/core/failure.dart';
import 'package:piton_assignment/features/books/domain/models/category.dart';

part 'books_state.freezed.dart';

@freezed
class BooksState with _$BooksState {
  const factory BooksState({
    required Option<Failure> failure,
    required List<Category> categories,
    required List<int> likedProductIds,
    required Option<int> selectedCategoryId,
    required String searchFilter,
    required bool isLoading,
  }) = _BooksState;

  factory BooksState.initial() {
    return BooksState(
      selectedCategoryId: none(),
      searchFilter: "",
      failure: none(),
      likedProductIds: [],
      categories: [],
      isLoading: true,
    );
  }
}
