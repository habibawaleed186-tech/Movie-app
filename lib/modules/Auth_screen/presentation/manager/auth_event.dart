
import 'package:equatable/equatable.dart';
import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}


final class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int avatarIndex;

  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required String phone,
    required this.avatarIndex,
  }) : phone = phone;

  @override
  List<Object?> get props => [name, email, password, phone, avatarIndex];
}

final class ResetPasswordEvent extends AuthEvent {
  final String email;
  const ResetPasswordEvent({required this.email});
  @override
  List<Object?> get props => [email];
}