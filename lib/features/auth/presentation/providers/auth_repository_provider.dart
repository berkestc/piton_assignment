import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/features/auth/data/repositories/auth_repository_impl.dart';

import '../../../../core/injections.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  final client = ref.watch(httpClientProvider);

  return AuthRepositoryImpl(client: client, networkInfo: networkInfo);
});
