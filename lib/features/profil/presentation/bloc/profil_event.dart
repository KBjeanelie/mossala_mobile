
import 'package:equatable/equatable.dart';

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