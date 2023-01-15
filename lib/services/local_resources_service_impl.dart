import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_resources_service.dart';

class LocalResourcesServiceImpl implements LocalResourcesService {
  final FlutterSecureStorage flutterSecureStorage;

  const LocalResourcesServiceImpl({required this.flutterSecureStorage});

  @override
  Future<Option<String>> getToken() async {
    final token = await flutterSecureStorage.read(key: "token");

    return optionOf(token);
  }

  @override
  Future<void> setToken(String token) {
    return flutterSecureStorage.write(key: "token", value: token);
  }

  @override
  Future<void> deleteToken() {
    return flutterSecureStorage.delete(key: "token");
  }
}
