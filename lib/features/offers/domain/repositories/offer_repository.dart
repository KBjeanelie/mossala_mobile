
import 'package:dartz/dartz.dart';

import '../entities/project.dart';

abstract class OfferRepository {
  Future<Either<String, List<ProjectEntity>>> getOffers();
  Future<Either<String, ProjectEntity>> getOfferById(String id);
  Future<Either<String, ProjectEntity>> createOffer(ProjectEntity offer);
  Future<Either<String, ProjectEntity>> deleteOffer(String id);
}