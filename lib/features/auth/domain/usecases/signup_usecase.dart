import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignUpUseCase implements UseCaseFuture<Failure, User, SignUpParams> {
  SignUpUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, User>> call(SignUpParams params) {
    return authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
      hobby: params.hobby,
    );
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.hobby,
  });

  final String name;
  final String email;
  final String password;
  final String hobby;

  @override
  List<Object?> get props => [name, email, password, hobby];
}
