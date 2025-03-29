
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/offers/domain/entities/application.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';

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

class ClosedOfferUsecase {
  final OfferRepository repository;

  ClosedOfferUsecase(this.repository);

  Future<Either<String, bool>> call(String id) async {
    return await repository.closedOffer(id);
  }
}

class AssignedOfferToWorker{
  final OfferRepository repository;

  AssignedOfferToWorker(this.repository);

  Future<Either<String, ProjectEntity>> call(String projectId, String workerId) async {
    return await repository.assignedOfferToWorker(projectId, workerId);
  }
}


class GetAppliesOffersUsecase {
  final OfferRepository repository;

  GetAppliesOffersUsecase(this.repository);

  Future<Either<String, List<OfferEntity>>> call(String projectId) async {
    return await repository.getAppliesOffers(projectId);
  }
}

class GetProjectWithApplicationUsecase {
  final OfferRepository repository;

  GetProjectWithApplicationUsecase(this.repository);

  Future<Either<String, ProjectWithApplicationsEntity>> call(String projectId) async {
    return await repository.getProjectWithApplication(projectId);
  }
}

class GetApplyOfferByIdUsercase {
  final OfferRepository repository;

  GetApplyOfferByIdUsercase(this.repository);

  Future<Either<String, OfferEntity>> call(String id) async {
    return await repository.getApplyOfferById(id);
  }
}

class ApplyOfferUsecase {
  final OfferRepository repository;
  ApplyOfferUsecase(this.repository);

  Future<Either<String, bool>> call(
    double amount,
    String duration,
    String description,
    int userId,
    int projectId,
  ) async {
    return await repository.applyOffer(amount, duration, description, userId, projectId);
  }
}

class CancelApplyOfferUsecase {
  final OfferRepository repository;

  CancelApplyOfferUsecase(this.repository);
  
  Future<Either<String, bool>> call(String id) async {
    return await repository.cancelApplyOffer(id);
  }
}