import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
    required String hobby,
  });

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, String?>> checkAuth();
}
