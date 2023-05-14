import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.firebaseAuth);

  final AuthFirebaseDataSource firebaseAuth;

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await firebaseAuth.signOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
    required String hobby,
  }) async {
    try {
      final result = await firebaseAuth.signUp(
        name: name,
        email: email,
        password: password,
        hobby: hobby,
      );
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, String?>> checkAuth() async {
    try {
      final result = await firebaseAuth.checkAuth();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
