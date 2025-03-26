import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/profil/domain/repositories/profil_repository.dart';
import '../../../offers/domain/entities/project.dart';
import '../entities/realisation.dart';

class RealisationUsecase {
  final ProfilRepository repository;

  RealisationUsecase(this.repository);

  Future<Either<String, List<RealisationEntity>>> call(){
    return repository.getRealisationOfCurrentUser();
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

class SendFeebBackUsecase {
  final ProfilRepository repository;

  SendFeebBackUsecase(this.repository);

  Future<Either<String, bool>> call(String feedBackMessage){
    return repository.sendFeedback(feedBackMessage);
  }
}

class SendWarningUsecase {
  final ProfilRepository repository;

  SendWarningUsecase(this.repository);

  Future<Either<String, bool>> call(String warningMessage){
    return repository.sendFeedback(warningMessage);
  }
}