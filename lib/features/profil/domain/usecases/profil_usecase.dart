import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/profil/domain/repositories/profil_repository.dart';
import '../../../offers/domain/entities/project.dart';
import '../entities/experience.dart';

class ExperienceUsecase {
  final ProfilRepository repository;

  ExperienceUsecase(this.repository);

  Future<Either<String, List<ExperienceEntity>>> call(){
    return repository.getExperienceOfCurrentUser();
  }
}

class ProjetAssignedUsecase {
  final ProfilRepository repository;

  ProjetAssignedUsecase(this.repository);

  Future<Either<String, List<ProjectEntity>>> call(){
    return repository.getProjectAssignedOfCurrentUser();
  }
}

class ProjetCreatedUsecase {
  final ProfilRepository repository;

  ProjetCreatedUsecase(this.repository);

  Future<Either<String, List<ProjectEntity>>> call(){
    return repository.getProjectCreatedOfCurrentUser();
  }
}