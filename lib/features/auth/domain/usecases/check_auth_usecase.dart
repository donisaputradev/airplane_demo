import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

class CheckAuthUseCase implements UseCaseFuture<Failure, String?, NoParams> {
  CheckAuthUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return authRepository.checkAuth();
  }
}
