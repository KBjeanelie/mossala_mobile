
import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/features/profil/domain/entities/realisation.dart';

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

class ProfilRealisationLoaded extends ProfilState {
  final List<RealisationEntity> realisations;

  ProfilRealisationLoaded(this.realisations);

  @override
  List<Object?> get props => [realisations];
}

class ProfilCreatedProjectLoaded extends ProfilState {
  final List<ProjectEntity> createdProjects;
  final int createdProjectsCount;

  ProfilCreatedProjectLoaded(this.createdProjects) : createdProjectsCount = createdProjects.length;

  @override
  List<Object?> get props => [createdProjects, createdProjectsCount];
}

class ProfilAssignedProjectLoaded extends ProfilState {
  final List<ProjectEntity> assignedProjects;
  final int assignedProjectsCount;

  ProfilAssignedProjectLoaded(this.assignedProjects) : assignedProjectsCount = assignedProjects.length;

  @override
  List<Object?> get props => [assignedProjects, assignedProjectsCount];
}

class WarningSent extends ProfilState {
  final bool sent;
  WarningSent(this.sent);
  @override
  List<Object?> get props => [sent];
}

class FeedbackSent extends ProfilState {
  final bool sent;
  FeedbackSent(this.sent);
  @override
  List<Object?> get props => [sent];
}

class ProfilRealisationCreated extends ProfilState {
  final bool created;
  ProfilRealisationCreated(this.created);
  @override
  List<Object?> get props => [created];
}