import 'package:dartz/dartz.dart';
import 'package:piton_assignment/features/auth/domain/core/auth_failure.dart';
import 'package:piton_assignment/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, User>> logInWithEmailAndPassword({
    required String email,
    required String password,
    required bool rememberMe,
  });
  Future<Either<AuthFailure, User>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Option<User>> getSignedInUser();
}
