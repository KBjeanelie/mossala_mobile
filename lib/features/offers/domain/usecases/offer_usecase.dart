
import 'dart:io';

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


class GetOpenOffer{
  final OfferRepository repository;

  GetOpenOffer(this.repository);

   Future<Either<String, List<ProjectEntity>>> call() async {
    return await repository.getOpenOffer();
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

  Future<Either<String, ProjectEntity>> call(
    String name,
    String description,
    String address,
    double amount,
    List<File> uploadedImages,
  ) async {
    return await repository.createOffer(name, description, address, amount, uploadedImages);
  }
}

class DeleteOfferUsecase {
  final OfferRepository repository;

  DeleteOfferUsecase(this.repository);

  Future<Either<String, bool>> call(String id) async {
    return await repository.deleteOffer(id);
  }
}

class AssignedOfferToWorker{
  final OfferRepository repository;

  AssignedOfferToWorker(this.repository);

  Future<Either<String, ProjectEntity>> call(String projectId, String workerId) async {
    return await repository.assignedOfferToWorker(projectId, workerId);
  }
}