
import 'package:dartz/dartz.dart';

import '../entities/project.dart';
import '../repositories/offer_repository.dart';

class GetOfferUsecase {
  final OfferRepository repository;

  GetOfferUsecase(this.repository);

  Future<Either<String, List<ProjectEntity>>> call() async {
    return await repository.getOffers();
  }
}

class GetOfferByIdUsecase {
  final OfferRepository repository;

  GetOfferByIdUsecase(this.repository);

  Future<Either<String, ProjectEntity>> call(String id) async {
    return await repository.getOfferById(id);
  }
}


class CreateOfferUsecase {
  final OfferRepository repository;

  CreateOfferUsecase(this.repository);

  Future<Either<String, ProjectEntity>> call(ProjectEntity offer) async {
    return await repository.createOffer(offer);
  }
}

class DeleteOfferUsecase {
  final OfferRepository repository;

  DeleteOfferUsecase(this.repository);

  Future<Either<String, ProjectEntity>> call(String id) async {
    return await repository.deleteOffer(id);
  }
} 