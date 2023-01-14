import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:piton_assignment/constants/api_constants.dart';
import 'package:piton_assignment/core/network_info.dart';
import 'package:piton_assignment/features/auth/data/DTOs/user_dto.dart';
import 'package:piton_assignment/features/auth/domain/core/auth_failure.dart';
import 'package:piton_assignment/features/auth/domain/models/user.dart';
import 'package:piton_assignment/features/auth/domain/repositories/auth_repository.dart';
import 'package:piton_assignment/services/local_resources_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalResourcesService localResourcesService;
  final NetworkInfo networkInfo;
  final Client client;

  const AuthRepositoryImpl({
    required this.localResourcesService,
    required this.networkInfo,
    required this.client,
  });

  @override
  Future<Either<AuthFailure, User>> logInWithEmailAndPassword({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await client.post(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.logInEndpoint),
          body: {"email": email, "password": password},
        );

        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body) as Map<String, dynamic>;

          final token = (decoded["action_login"] as Map<String, dynamic>)["token"] as String;

          if (token.isNotEmpty) {
            if (rememberMe) await localResourcesService.setToken(token);
            return right(UserDto.fromToken(token).toDomain());
          } else {
            return left(const AuthFailure.invalidEmailOrPassword());
          }
        }

        return left(const AuthFailure.unknownError());
      } catch (e) {
        return left(const AuthFailure.unknownError());
      }
    } else {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<Either<AuthFailure, User>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await client.post(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint),
          body: {"name": name, "email": email, "password": password},
        );

        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body) as Map<String, dynamic>;

          final error = decoded["error"] as String?;

          if (error == null) {
            return logInWithEmailAndPassword(email: email, password: password, rememberMe: false);
          }
        }

        return left(const AuthFailure.unknownError());
      } catch (e) {
        return left(const AuthFailure.unknownError());
      }
    } else {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    final token = await localResourcesService.getToken();

    return token.fold(() => none(), (a) async {
      if (JwtDecoder.isExpired(a)) {
        await localResourcesService.deleteToken();
        return none();
      } else {
        return some(UserDto.fromToken(a).toDomain());
      }
    });
  }
}
