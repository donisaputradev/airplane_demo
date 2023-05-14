import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignInUseCase implements UseCaseFuture<Failure, User, SignInParams> {
  SignInUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, User>> call(SignInParams params) {
    return authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
