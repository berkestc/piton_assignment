import 'package:dartz/dartz.dart';
import '../core/auth_failure.dart';
import '../models/user.dart';

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
