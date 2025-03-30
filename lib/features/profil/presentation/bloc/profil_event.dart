
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
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

class WarningSendEvent extends ProfilEvent {
  final String message;
  WarningSendEvent(this.message);
  @override
  List<Object?> get props => [message];
}

class FeedBackSendEvent extends ProfilEvent {
  final String message;
  FeedBackSendEvent(this.message);
  @override
  List<Object?> get props => [message];
}

class ProfilRealisationEvent extends ProfilEvent {
  final String name;
  final String description;
  final String date;
  final int userId;
  final File image;

  ProfilRealisationEvent(
    this.name,
    this.description,
    this.date,
    this.userId,
    this.image,
  );
  @override
  List<Object?> get props => [
    name,
    description,
    date,
    userId,
    image,
  ];

}

class UserUpdateProfilEvent extends ProfilEvent {
  final UserModel userProfil;
  UserUpdateProfilEvent(this.userProfil);
  @override
  List<Object?> get props => [userProfil];
}