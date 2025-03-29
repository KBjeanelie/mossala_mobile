import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/auth/domain/entities/quarter_entity.dart';

import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthLoggedOut extends AuthState {}



class QuartersLoaded extends AuthState {
  final List<QuarterEntity> quarters;

  QuartersLoaded(this.quarters);
}
