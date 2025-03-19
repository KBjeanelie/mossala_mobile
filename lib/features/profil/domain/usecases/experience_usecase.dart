import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/profil/domain/repositories/profil_repository.dart';
import '../entities/experience.dart';

class ExperienceUsecase {
  final ProfilRepository repository;

  ExperienceUsecase(this.repository);

  Future<Either<String, List<ExperienceEntity>>> call(){
    return repository.getExperienceOfCurrentUser();
  }
}