import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/features/profil/domain/entities/experience.dart';

abstract class WorkerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class WorkerEventExperience extends WorkerEvent {
  final List<ExperienceEntity> experiences = [];
  final int userId;

  WorkerEventExperience(this.userId);
  @override
  List<Object?> get props => [experiences];
}


class WorkerEventAssignedProject extends WorkerEvent {
  final List<ProjectEntity> assignedProjects = [];
  final int userId;

  WorkerEventAssignedProject(this.userId);
  @override
  List<Object?> get props => [assignedProjects];
}


class WorkerEventCreatedProject extends WorkerEvent {
  final List<ProjectEntity> createdProjects = [];
  final int userId;

  WorkerEventCreatedProject(this.userId);
  @override
  List<Object?> get props => [createdProjects];
}


class FetchWorkersEvent extends WorkerEvent {
  final List<User> workers = [];

  FetchWorkersEvent();
  @override
  List<Object?> get props => [workers];
}


class FetchSingleWorkerEvent extends WorkerEvent {
  final int userId;

  FetchSingleWorkerEvent(this.userId);
  @override
  List<Object?> get props => [userId];
}