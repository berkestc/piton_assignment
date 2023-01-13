import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/core/injections.dart';
import 'package:piton_assignment/features/books/data/repositories/books_repository_impl.dart';
import 'package:piton_assignment/features/books/domain/repositories/books_repository.dart';

final booksRepositoryProvider = Provider.autoDispose<BooksRepository>((ref) {
  final client = ref.watch(httpClientProvider);

  return BooksRepositoryImpl(client: client);
});
