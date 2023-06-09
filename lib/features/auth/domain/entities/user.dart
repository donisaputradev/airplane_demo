import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.hobby,
    required this.balance,
    required this.joined,
  });

  final String id;
  final String name;
  final String email;
  final String hobby;
  final int balance;
  final String joined;

  @override
  List<Object?> get props => [id, name, email, hobby, balance, joined];
}
