
import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/profil/domain/entities/experience.dart';

abstract class ProfilState extends Equatable {
  @override
  List<Object?> get props => [];
}
class ProfilInitial extends ProfilState {}

class ProfilLoading extends ProfilState {}

class ProfilError extends ProfilState {
  final String message;

  ProfilError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfilExperienceLoaded extends ProfilState {
  final List<ExperienceEntity> experiences;

  ProfilExperienceLoaded(this.experiences);

  @override
  List<Object?> get props => [experiences];
}