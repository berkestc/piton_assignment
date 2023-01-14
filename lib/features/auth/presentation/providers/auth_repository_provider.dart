import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final localResourcesService = ref.watch(localResourcesServiceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  final client = ref.watch(httpClientProvider);

  return AuthRepositoryImpl(
    localResourcesService: localResourcesService,
    client: client,
    networkInfo: networkInfo,
  );
});
