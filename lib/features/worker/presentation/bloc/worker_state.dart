
import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/features/profil/domain/entities/realisation.dart';

abstract class WorkerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WorkerInitial extends WorkerState {}

class WorkerLoading extends WorkerState {}

class WorkerError extends WorkerState {
  final String message;

  WorkerError(this.message);

  @override
  List<Object?> get props => [message];
}

class WorkerAssignedProjectLoaded extends WorkerState {
  final List<ProjectEntity> assignedProjects;
  final int assignedProjectsCount;

  WorkerAssignedProjectLoaded(this.assignedProjects) : assignedProjectsCount = assignedProjects.length;

  @override
  List<Object?> get props => [assignedProjects, assignedProjectsCount];
}

class WorkerCreatedProjectLoaded extends WorkerState {
  final List<ProjectEntity> createdProjects;
  final int createdProjectsCount;

  WorkerCreatedProjectLoaded(this.createdProjects) : createdProjectsCount = createdProjects.length;

  @override
  List<Object?> get props => [createdProjects, createdProjectsCount];
}

class WorkerExperienceLoaded extends WorkerState {
  final List<RealisationEntity> experiences;

  WorkerExperienceLoaded(this.experiences);

  @override
  List<Object?> get props => [experiences];
}

class FetchWorkersLoaded extends WorkerState {
  final List<User> workers;

  FetchWorkersLoaded(this.workers);

  @override
  List<Object?> get props => [workers];
}

class WorkerLoaded extends WorkerState {
  final User worker;

  WorkerLoaded(this.worker);

  @override
  List<Object?> get props => [worker];
}