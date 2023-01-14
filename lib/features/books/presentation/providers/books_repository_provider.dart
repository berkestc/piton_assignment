import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/core/injections.dart';
import 'package:piton_assignment/features/auth/presentation/providers/user_provider.dart';
import 'package:piton_assignment/features/books/data/repositories/books_repository_impl.dart';
import 'package:piton_assignment/features/books/domain/repositories/books_repository.dart';

final booksRepositoryProvider = Provider.autoDispose<BooksRepository>((ref) {
  final user = ref.read(userProvider).user.toNullable()!;
  final networkInfo = ref.watch(networkInfoProvider);
  final client = ref.watch(httpClientProvider);

  return BooksRepositoryImpl(
    networkInfo: networkInfo,
    client: client,
    user: user,
  );
});
