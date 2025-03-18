import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mossala_mobile/services/api_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService = ApiService();
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(this.authLocalDataSource, {required this.dio});

  @override
  Future<Either<String, User>> login(String tel, String password) async {
    log("LOGIN : $tel, $password");
    try {
      log("LOGIN REQUEST API : ${apiService.baseUrlLocal}/login/");
      final response = await dio.post(
        '${apiService.baseUrlLocal}/login/',
        data: {"tel": tel, "password": password},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      log("LOGIN SUCCESS....");
      log("LOGIN RESPONSE : ${response.data}");
      final accessToken = response.data['access'];
      final refreshToken = response.data['refresh'];
      await authLocalDataSource.saveAccessToken(accessToken);
      await authLocalDataSource.saveRefreshToken(refreshToken);
      final user = UserModel.fromJson(response.data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          debugPrint("INVALID NUMBER OR PASSWORD: ${e.response?.data}");
          return Left("Numéro de téléphone ou mot de passe incorrect");
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
  Future<Either<String, User>> register(String username, String tel, String password) async {
    try {
      final response = await dio.post(
        '/auth/register/',
        data: {"username": username, "tel": tel, "password": password},
      );

      if (response.statusCode == 201) {
        final user = UserModel.fromJson(response.data);
        return Right(user);
      } else {
        return Left("Erreur lors de l'inscription");
      }
    } catch (e) {
      return Left("Erreur réseau ou serveur");
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      log("LOGOUT REQUEST API : ${apiService.baseUrlLocal}/logout/");
      final String? token = await authLocalDataSource.getRefreshToken();
      final response = await dio.post(
        '${apiService.baseUrlLocal}/logout/',
        data: {"refresh_token": token},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${await authLocalDataSource.getAccessToken()}",
          },
        ),
      );
      log("LOGOUT SUCCESS....");
      log("LOGOUT RESPONSE : ${response.data}");
      await authLocalDataSource.deleteToken();
      return Right(true);
    } catch (e) {
      debugPrint("LOGOUT ERROR: $e");
      if (e is DioException) {
        debugPrint("INVALID REFRESH TOKEN: ${e.response?.data}");
        if (e.response?.statusCode == 302) {
          debugPrint("INVALID REFRESH TOKEN: ${e.response?.data}");
          return Left("Token invalide");
        } else {
          debugPrint("UNKNOWN ERROR: ${e.response?.data}");
          return Left("ERROR: ${e.response?.data}");
        }
      } else {
        debugPrint("UNKNOWN ERROR: $e");
      }
      return Left("Erreur réseau ou serveur");
    }
  }
}
