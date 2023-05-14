part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignOutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class NameChangeEvent extends AuthEvent {
  final String name;

  const NameChangeEvent(this.name);

  @override
  List<Object> get props => [name];
}

class EmailChangeEvent extends AuthEvent {
  final String email;

  const EmailChangeEvent(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChangeEvent extends AuthEvent {
  final String password;

  const PasswordChangeEvent(this.password);

  @override
  List<Object> get props => [password];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({
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
  List<Object> get props => [
        name,
        email,
        password,
        hobby,
      ];
}

class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
