
import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';

import '../../../offers/domain/entities/project.dart';
import '../../../profil/domain/entities/realisation.dart';

abstract class WorkerRepository {
  Future<Either<String, List<User>>> getWorkers();
  Future<Either<String, User>> getSingleWorker(int userId);
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfWorker(int userId);
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfWorker(int userId);
  Future<Either<String, List<RealisationEntity>>> getExperienceOfWorker(int userId);
}