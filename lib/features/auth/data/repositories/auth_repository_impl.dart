import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:piton_assignment/constants/api_constants.dart';
import 'package:piton_assignment/core/network_info.dart';
import 'package:piton_assignment/features/auth/domain/core/auth_failure.dart';
import 'package:piton_assignment/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final Client client;

  const AuthRepositoryImpl({
    required this.client,
    required this.networkInfo,
  });

  @override
  Future<Either<AuthFailure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
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
            return right(token);
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
  Future<Either<AuthFailure, String>> registerWithEmailAndPassword({
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
            return logInWithEmailAndPassword(email: email, password: password);
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
}
