import 'package:airplane_demo/features/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.hobby,
    required this.balance,
  });

  final String id;
  final String name;
  final String email;
  final String hobby;
  final int balance;

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      hobby: hobby,
      balance: balance,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, name, email, hobby, balance];
}
