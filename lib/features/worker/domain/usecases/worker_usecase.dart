
import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/profil/domain/entities/experience.dart';
import '../../../offers/domain/entities/project.dart';
import '../repositories/worker_repository.dart';


class GetWorkersUsecase {
  final WorkerRepository repository;

  GetWorkersUsecase(this.repository);

  Future<Either<String, List<User>>> call(){
    return repository.getWorkers();
  }
}


class GetSingleWorkerUsecase {
  final WorkerRepository repository;

  GetSingleWorkerUsecase(this.repository);

  Future<Either<String, User>> call(int userId){
    return repository.getSingleWorker(userId);
  }
}


class ExperienceOfWorkerUsecase {
  final WorkerRepository repository;

  ExperienceOfWorkerUsecase(this.repository);

  Future<Either<String, List<ExperienceEntity>>> call(int userId){
    return repository.getExperienceOfWorker(userId);
  }
}


class ProjectAssignedToWorkerUsecase {
  final WorkerRepository repository;

  ProjectAssignedToWorkerUsecase(this.repository);

  Future<Either<String, List<ProjectEntity>>> call(int userId){
    return repository.getProjectAssignedOfWorker(userId);
  }
}


class ProjectCreatedByWorkerUsecase {
  final WorkerRepository repository;

  ProjectCreatedByWorkerUsecase(this.repository);

  Future<Either<String, List<ProjectEntity>>> call(int userId){
    return repository.getProjectCreatedOfWorker(userId);
  }
}