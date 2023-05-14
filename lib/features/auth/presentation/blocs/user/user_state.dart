part of 'user_bloc.dart';

enum UserStateStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.failure,
    this.user,
    this.status = UserStateStatus.initial,
  });

  factory UserState.initial() {
    return const UserState();
  }

  final UserStateStatus status;
  final User? user;
  final Failure? failure;

  UserState copyWith({
    UserStateStatus? status,
    User? user,
    Failure? failure,
  }) {
    return UserState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [failure, status, user];
}
