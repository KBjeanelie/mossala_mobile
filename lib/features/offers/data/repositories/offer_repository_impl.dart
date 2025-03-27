
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/features/offers/data/models/offer_model.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';

import 'package:mossala_mobile/features/offers/domain/entities/project.dart';
import 'package:mossala_mobile/services/api_service.dart';

import '../../domain/repositories/offer_repository.dart';
import '../models/project_model.dart';

class OfferRepositoryImpl implements OfferRepository {
  final ApiService apiService = ApiService();
  final Dio dio;

  OfferRepositoryImpl(this.dio);

  
  @override
  Future<Either<String, ProjectEntity>> createOffer(
    String name,
    String description,
    String address,
    double amount,
    List<File> uploadedImages,
  ) async {
    try {
      // Étape 1 : Convertir les fichiers en `MultipartFile`
      List<MultipartFile> imageFiles = [];
      for (var image in uploadedImages) {
        imageFiles.add(await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ));
      }

      // Étape 2 : Construire les données multipart
      FormData formData = FormData.fromMap({
        'name': name,
        'description': description,
        'adress': address,
        'amount': amount,
        'uploaded_images': imageFiles, 
        'is_closed': false,
        'assigned_freelancer': null,
      });

      // Étape 3 : Envoyer la requête
      final response = await apiService.postWithFile('/projects/', formData);

      if (response?.statusCode == 201) {
        return Right(ProjectModel.fromJson(response?.data));
      } else {
        debugPrint("ERROR: ${response?.data}");
        return Left("Erreur création projet : ${response?.data}");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          debugPrint("ERROR: ${e.response?.data}");
          return Left("Erreur : ${e.response?.data}");
        } else {
          debugPrint("UNKNOWN ERROR: ${e.response?.data}");
          return Left("Serveur indisponible, veuillez réessayer plus tard");
        }
      } else {
        debugPrint("UNKNOWN ERROR: $e");
      }
      return Left("Erreur réseau ou serveur");
    }
  }

  @override
  Future<Either<String, bool>> deleteOffer(String id) async{
    log("FETCHING DATA FROM API FOR DELETING SINGLE PROJECT");
    try {
      final response = await apiService.delete('/projects/$id/');
      if (response?.statusCode == 204) {
        log("DATA DELETED SUCCESSFULLY");
        return Right(true);

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
    //log("FETCHING DATA FROM API FOR SINGLE PROJECT");

    try {
      final response = await apiService.get('/projects/$id/');
      if (response != null && response.data != null) {
        // log("DATA FETCHED SUCCESSFULLY");
        // log("DATA: ${response.data}");
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
      final response = await apiService.post('/projects/$projectId/assign_freelancer/', data);
      if (response?.statusCode == 201) {
        return Right(ProjectModel.fromJson(response?.data));

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
  
  @override
  Future<Either<String, bool>> closedOffer(String id) async{
    try {
      final data = {
        "id":id
      };
      final response = await apiService.post('/projects/$id/close/', data);
      if (response?.statusCode == 201) {
        return Right(true);

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
  Future<Either<String, bool>> cancelApplyOffer(String id) async{
    try {
      final response = await apiService.delete("/apply-projects/$id/");
      if (response?.statusCode == 204) {
        return Right(true);

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
  Future<Either<String, List<OfferEntity>>> getAppliesOffers(String projectId) async{
    log("FETCHING DATA FOR APPLY PROJECT FROM API");

    try {
      final response = await apiService.get('/apply-projects/?project_id=$projectId');
      if (response?.statusCode == 200) {
        final offers = (response?.data as List)
            .map((e) => OfferModel.fromJson(e))
            .toList();
        log("data: ${response?.data}");
        return Right(offers);
      }else {
        log("ERROR FETCHING DATA");
        return Left("Error fetching data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

  @override
  Future<Either<String, OfferEntity>> getApplyOfferById(String id) async{
    try {
      final response = await apiService.get('/apply-projects/$id/');
      if (response?.statusCode == 200) {
        return Right(OfferModel.fromJson(response?.data));
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
  Future<Either<String, bool>> applyOffer(double amount, String duration, String description, int userId, int projectId) async{
    try {
      final data = {
        "amount": amount,
        "duration": duration,
        "description": description,
        "user": userId,
        "project": projectId
      };
      final response = await apiService.post('/apply-projects/', data);
      if (response?.statusCode == 201) {
        return Right(true);
      } else {
        log("ERROR CREATING DATA");
        return Left("Error creating data");
      }
    } catch (e) {
      log("EXCEPTION OCCURRED: $e");
      return Left("Exception occurred while fetching data");
    }
  }

}