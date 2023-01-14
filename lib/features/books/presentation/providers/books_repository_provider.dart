import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/injections.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../../data/repositories/books_repository_impl.dart';
import '../../domain/repositories/books_repository.dart';

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
