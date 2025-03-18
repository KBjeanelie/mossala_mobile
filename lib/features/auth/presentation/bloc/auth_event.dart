import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String tel;
  final String password;

  LoginEvent({required this.tel, required this.password});

  @override
  List<Object?> get props => [tel, password];
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  RegisterEvent({required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}

class LogoutEvent extends AuthEvent {}
