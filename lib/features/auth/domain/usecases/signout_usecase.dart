import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase implements UseCaseFuture<Failure, bool, NoParams> {
  SignOutUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return authRepository.signOut();
  }
}
