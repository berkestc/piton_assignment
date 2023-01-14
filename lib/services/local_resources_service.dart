import 'package:dartz/dartz.dart';

abstract class LocalResourcesService {
  Future<Option<String>> getToken();
  Future<void> setToken(String token);
  Future<void> deleteToken();
}
