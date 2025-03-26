
import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

import '../../domain/entities/realisation.dart';

abstract class ProfilEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilEventRealisation extends ProfilEvent {
  final List<RealisationEntity> experiences = [];

  ProfilEventRealisation();
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