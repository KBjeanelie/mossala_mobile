

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/services/api_service.dart';

import '../../domain/entities/experience.dart';
import '../../domain/repositories/profil_repository.dart';
import '../models/experience_model.dart';

class ProfileRepositoryImpl implements ProfilRepository {
  final ApiService apiService = ApiService();
  final Dio dio;

  ProfileRepositoryImpl(this.dio);
  @override
  Future<Either<String, List<ExperienceEntity>>> getExperienceOfCurrentUser() async {
    log("FETCHING DATA FROM API FOR EXPERIENCE OF CURRENT USER");
    try {
      final response = await apiService.get('/user-experiences/');
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
  Future<Either<String, List<ProjectEntity>>> getProjectAssignedOfCurrentUser() {
    // TODO: implement getProjectAssignedOfCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<ProjectEntity>>> getProjectCreatedOfCurrentUser() {
    // TODO: implement getProjectCreatedOfCurrentUser
    throw UnimplementedError();
  }
}