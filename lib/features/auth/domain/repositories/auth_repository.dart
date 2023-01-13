import 'package:dartz/dartz.dart';
import 'package:piton_assignment/features/auth/domain/core/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, String>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
