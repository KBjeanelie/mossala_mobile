
import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

import '../../domain/entities/experience.dart';

abstract class ProfilEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilEventExperience extends ProfilEvent {
  final List<ExperienceEntity> experiences = [];

  ProfilEventExperience();
  @override
  List<Object?> get props => [experiences];
}

class ProfilEventAssignedProject extends ProfilEvent {
  final List<ProjectEntity> assignedProjects = [];

  ProfilEventAssignedProject();
  @override
  List<Object?> get props => [assignedProjects];
}

class ProfilEventCreatedProject extends ProfilEvent {
  final List<ProjectEntity> createdProjects = [];

  ProfilEventCreatedProject();
  @override
  List<Object?> get props => [createdProjects];
}