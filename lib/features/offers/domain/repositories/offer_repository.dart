
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../entities/project.dart';

abstract class OfferRepository {
  Future<Either<String, List<ProjectEntity>>> getOffers();
  Future<Either<String, List<ProjectEntity>>> getOpenOffer();
  Future<Either<String, ProjectEntity>> getOfferById(String id);
  Future<Either<String, ProjectEntity>> createOffer(
    String name,
    String description,
    String address,
    double amount,
    List<File> uploadedImages,
  );
  Future<Either<String, bool>> deleteOffer(String id);
  Future<Either<String, bool>> closedOffer(String id);
  Future<Either<String, ProjectEntity>> assignedOfferToWorker(String projectId, String workerId);
}