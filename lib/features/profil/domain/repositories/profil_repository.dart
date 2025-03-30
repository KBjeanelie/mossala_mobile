import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

import '../entities/realisation.dart';

abstract class ProfilRepository {
  Future<Either<String, User>> updateUserProfile(UserModel userProfil);
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfCurrentUser();
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfCurrentUser();
  Future<Either<String, List<RealisationEntity>>> getRealisationOfCurrentUser();
  Future<Either<String, bool>> sendWarning(String warningMessage);
  Future<Either<String, bool>> sendFeedback(String feedBackMessage);
  Future<Either<String, bool>> addUserRealisation(
    String name,
    String description,
    String date,
    int userId,
    File image,
  );
}