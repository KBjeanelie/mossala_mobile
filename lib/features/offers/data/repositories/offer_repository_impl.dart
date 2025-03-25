
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/services/api_service.dart';

import '../../domain/repositories/offer_repository.dart';
import '../models/project_model.dart';

class OfferRepositoryImpl implements OfferRepository {
  final ApiService apiService = ApiService();
  final Dio dio;

  OfferRepositoryImpl(this.dio);


  @override
  Future<Either<String, ProjectEntity>> createOffer(ProjectEntity offer) async{
    log("FETCHING DATA FROM API FOR CREATING PROJECT");
    try {
      final response = await dio.post('/projects/', data: offer);
      if (response.statusCode == 201) {
        log("DATA CREATED SUCCESSFULLY");
        return Right(ProjectModel.fromJson(response.data));

      } else {
        log("ERROR CREATING DATA");
        return Left("Error creating data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

  @override
  Future<Either<String, ProjectEntity>> deleteOffer(String id) async{
    log("FETCHING DATA FROM API FOR DELETING SINGLE PROJECT");
    try {
      final response = await dio.delete('/projects/$id/');
      if (response.statusCode == 204) {
        log("DATA DELETED SUCCESSFULLY");
        return Right(ProjectModel.fromJson(response.data));

      } else {
        log("ERROR DELETING DATA");
        return Left("Error deleting data");
      } 
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

  @override
  Future<Either<String, ProjectEntity>> getOfferById(String id) async{
    log("FETCHING DATA FROM API FOR SINGLE PROJECT");

    try {
      final response = await apiService.get('/projects/$id/');
      if (response != null && response.data != null) {
        log("DATA FETCHED SUCCESSFULLY");
        log("DATA: ${response.data}");
        return Right(ProjectModel.fromJson(response.data));

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
  Future<Either<String, List<ProjectEntity>>> getOffers() async{
    try {
      final response = await apiService.get('/projects/');
      if (response != null && response.data != null) {
        final offers = (response.data as List)
            .map((e) => ProjectModel.fromJson(e))
            .toList();
        return Right(offers);
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
  Future<Either<String, ProjectEntity>> assignedOfferToWorker(String projectId, String workerId) async{
    try {
      final data =  {
        "freelancer_id": workerId
      };
      final response = await dio.post('/projects/$projectId/assign_freelancer/', data: data);
      if (response.statusCode == 201) {
        return Right(ProjectModel.fromJson(response.data));

      } else {
        log("ERROR CREATING DATA");
        return Left("Error creating data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }
  
  @override
  Future<Either<String, List<ProjectEntity>>> getOpenOffer() async{
    try {
      final response = await apiService.get('/projects/is-open/');
      if (response != null && response.data != null) {
        final offers = (response.data as List)
            .map((e) => ProjectModel.fromJson(e))
            .toList();
        return Right(offers);
      } else {
        log("ERROR FETCHING DATA $response");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

}