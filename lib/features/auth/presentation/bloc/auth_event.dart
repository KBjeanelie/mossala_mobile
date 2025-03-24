import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/auth/domain/entities/quarter_entity.dart';

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
  final String lastname;
  final String firstname;
  final String tel;
  final String adress;
  final String password;

  RegisterEvent(this.lastname, this.firstname, this.tel, this.adress, this.password);

  @override
  List<Object?> get props => [
    lastname,
    firstname,
    tel,
    adress,
    password,
  ];
}

class LogoutEvent extends AuthEvent {}

class FetchQuarters extends AuthEvent {
  final List<QuarterEntity> quarters = [];

  FetchQuarters();

  @override
  List<Object?> get props => [quarters];
}
