

import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/services/api_service.dart';

import '../../../offers/data/models/project_model.dart';
import '../../domain/entities/realisation.dart';
import '../../domain/repositories/profil_repository.dart';
import '../models/realisation_model.dart';

class ProfileRepositoryImpl implements ProfilRepository {
  final ApiService apiService = ApiService();
  final Dio dio;

  ProfileRepositoryImpl(this.dio);
  @override
  Future<Either<String, List<RealisationEntity>>> getRealisationOfCurrentUser() async {
    log("FETCHING DATA FROM API FOR EXPERIENCE OF CURRENT USER");
    try {
      final response = await apiService.get('/user-realisations/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final experiences = (response.data as List)
            .map((e) => RealisationModel.fromJson(e))
            .toList();
        return Right(experiences);
      } else {
        log("ERROR FETCHING DATA");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

  @override
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfCurrentUser() async{
    log("FETCHING DATA FROM API FOR ASSIGNED OF CURRENT USER");
    try {
      final response = await apiService.get('/user-assigned-project/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final assignedProject = (response.data as List)
            .map((e) => ProjectModel.fromJson(e))
            .toList();
        return Right(assignedProject);
      } else {
        log("ERROR FETCHING DATA");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

  @override
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfCurrentUser() async{
    log("FETCHING DATA FROM API FOR ASSIGNED OF CURRENT USER");
    try {
      final response = await apiService.get('/user-created-project/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final createdProject = (response.data as List)
            .map((e) => ProjectModel.fromJson(e))
            .toList();
        return Right(createdProject);
      } else {
        log("ERROR FETCHING DATA");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }
  
  @override
  Future<Either<String, bool>> sendFeedback(String feedBackMessage) async{
    
    try {
      final data = {
        "feedback_message": feedBackMessage
      };
      final response = await apiService.post('/feedbacks/',data);
      if (response?.statusCode == 201) {
        return Right(true);
      } else {
        return Left("Error sending feedback");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while sending feedback");
    }
  }
  
  @override
  Future<Either<String, bool>> sendWarning(String warningMessage) async{
    try {
      final data = {
        "warning_message": warningMessage
      };
      final response = await apiService.post('/warnings/',data);
      if (response?.statusCode == 201) {
        return Right(true);
      } else {
        return Left("Error sending warnings");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while sending feedback");
    }
  }
  
  @override
  Future<Either<String, bool>> addUserRealisation(String name, String description, String date, int userId, File image,) async{
    try {
      FormData formData = FormData.fromMap({
        "realisation_name": name,
        "description": description,
        "date": date,
        "user": userId,
        //"image": image.readAsBytesSync().toList(),
      });
      final response = await apiService.postWithFile('/user-realisations/', formData);
      if (response?.statusCode == 201) {
        return Right(true);
      } else {
        return Left("Error adding realisation");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while adding realisation");
    }
  }

  @override
  Future<Either<String, User>> updateUserProfile(UserModel userProfil) async{
    try {
      final data = userProfil.toJson();
      log("Données envoyées à l'API : $data");
      final response = await apiService.patch('/update-current-user/', userProfil.toJson());
      if (response?.statusCode == 200) {
        return Right(UserModel.fromJson(response?.data));
      } else if (response?.statusCode == 400) {
        log("Erreur 400 : ${response?.data}");
        return Left("Requête invalide : ${response?.data['message'] ?? 'Erreur inconnue'}");
      } else {
        log("Erreur API : ${response?.toString()}");
        return Left("Erreur lors de la mise à jour du profil utilisateur");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while updating user profile");
    }
  }
}