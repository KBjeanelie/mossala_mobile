import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/data/models/project_model.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/features/profil/data/models/experience_model.dart';
import 'package:mossala_mobile/features/profil/domain/entities/experience.dart';
import 'package:mossala_mobile/features/worker/domain/repositories/worker_repository.dart';
import 'package:mossala_mobile/services/api_service.dart';



class WorkerRepositoryImpl implements WorkerRepository {

  final ApiService apiService = ApiService();
  final Dio dio;

  WorkerRepositoryImpl(this.dio);
  
  @override
  Future<Either<String, List<ExperienceEntity>>> getExperienceOfWorker(int userId) async{
    log("FETCHING DATA FROM API FOR EXPERIENCE OF WORKER");
    try {
      final response = await apiService.get('/worker-experiences/$userId/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final experiences = (response.data as List)
            .map((e) => ExperienceModel.fromJson(e))
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
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfWorker(int userId) async{
    log("FETCHING DATA FROM API FOR ASSIGNED OF WORKER");
    try {
      final response = await apiService.get('/worker-assigned-project/$userId/');
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
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfWorker(int userId) async{
    log("FETCHING DATA FROM API FOR ASSIGNED OF WORKER");
    try {
      final response = await apiService.get('/worker-created-project/$userId/');
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
  Future<Either<String, User>> getSingleWorker(int userId) async{
    log("FETCHING DATA FROM API FOR SINGLE WORKER");
    try {
      final response = await apiService.get('/users/$userId/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final worker = UserModel.fromJson(response.data);
        return Right(worker);
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
  Future<Either<String, List<User>>> getWorkers() async{
    log("FETCHING DATA FROM API FOR WORKERS");
    try {
      final response = await apiService.get('/users/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        final workers = (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
        return Right(workers);
      } else {
        log("ERROR FETCHING DATA");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }
  
}