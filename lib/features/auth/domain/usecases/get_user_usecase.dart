import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements UseCaseFuture<Failure, User, NoParams> {
  GetUserUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return authRepository.getUser();
  }
}
