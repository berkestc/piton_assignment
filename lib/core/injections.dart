import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:http/http.dart' as http;
import '../services/local_resources_service.dart';
import '../services/local_resources_service_impl.dart';

import '../services/network_info.dart';
import '../services/network_info_impl.dart';

final httpClientProvider = Provider.autoDispose<http.Client>((ref) => http.Client());
final networkInfoProvider = Provider.autoDispose<NetworkInfo>((ref) => NetworkInfoImpl(connectivity: Connectivity()));
final localResourcesServiceProvider = Provider.autoDispose<LocalResourcesService>(
  (ref) => LocalResourcesServiceImpl(flutterSecureStorage: ref.watch(flutterSecureStorageProvider)),
);
final flutterSecureStorageProvider = Provider.autoDispose((ref) => const FlutterSecureStorage());
