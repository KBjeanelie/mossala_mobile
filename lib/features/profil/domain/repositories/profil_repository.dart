import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

import '../entities/experience.dart';

abstract class ProfilRepository {
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfCurrentUser();
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfCurrentUser();
  Future<Either<String, List<ExperienceEntity>>> getExperienceOfCurrentUser();
}