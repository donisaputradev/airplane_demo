part of 'auth_bloc.dart';

enum AuthStateStatus { initial, loading, failure, authorized, unauthorized }

class AuthState extends Equatable {
  const AuthState({
    this.failure,
    this.status = AuthStateStatus.initial,
    this.name = const NameFormZ.dirty(),
    this.password = const PasswordFormZ.dirty(),
    this.email = const EmailFormZ.dirty(),
    this.uid,
  });

  factory AuthState.initial() {
    return const AuthState();
  }

  bool get isAllFormValid =>
      (name.value.isNotEmpty && name.isValid) &&
      (email.value.isNotEmpty && email.isValid) &&
      (password.value.isNotEmpty && password.isValid);

  final AuthStateStatus status;
  final Failure? failure;
  final NameFormZ name;
  final PasswordFormZ password;
  final EmailFormZ email;
  final String? uid;

  AuthState copyWith({
    AuthStateStatus? status,
    Failure? failure,
    NameFormZ? name,
    PasswordFormZ? password,
    EmailFormZ? email,
    String? uid,
  }) {
    return AuthState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [failure, status, uid, name, email, password];
}
