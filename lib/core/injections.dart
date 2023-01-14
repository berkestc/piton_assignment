import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:piton_assignment/services/local_resources_service.dart';
import 'package:piton_assignment/services/local_resources_service_impl.dart';

import 'network_info.dart';

final httpClientProvider = Provider<http.Client>((ref) => http.Client());
final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(connectivity: Connectivity()));
final localResourcesServiceProvider = Provider<LocalResourcesService>(
  (ref) => LocalResourcesServiceImpl(flutterSecureStorage: ref.watch(flutterSecureStorageProvider)),
);
final flutterSecureStorageProvider = Provider((ref) => const FlutterSecureStorage());
