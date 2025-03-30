import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../features/auth/data/datasources/auth_local_datasource.dart' show AuthLocalDataSource;

class ApiService {
  final Dio dio = Dio();
  final AuthLocalDataSource authLocalDataSource = AuthLocalDataSource(secureStorage: FlutterSecureStorage());

  final String baseUrlLocal = "https://api-mosala.eneogroup.com/api";

  ApiService() {
    dio.options.baseUrl = baseUrlLocal;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.headers["Content-Type"] = "application/json";
  }

  // 📌 Fonction générique pour les appels API (avec gestion du token)
  Future<Response?> request(
    String method,
    String endpoint, {
    Map<String, dynamic>? data,
    FormData? dataForm,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      // Récupérer le token
      String? accessToken = await authLocalDataSource.getAccessToken();
      if (accessToken == null) {
        await refreshAccessToken();
        accessToken = await authLocalDataSource.getAccessToken();
      }

      final Options options = Options(
        method: method,
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );

      // Effectuer la requête
      final Response response = await dio.request(
        endpoint,
        data: dataForm ?? data,
        queryParameters: queryParams,
        options: options,
      );

      return response;
    } on DioException catch (e) {
      // Vérifier si le token a expiré et essayer un refresh
      if (e.response?.statusCode == 401) {
        bool refreshed = await refreshAccessToken();
        if (refreshed) {
          return request(method, endpoint, data: data, queryParams: queryParams);
        }
      }
      log("API Error: ${e.message}");
      return null;
    }
  }

  // 📌 Méthodes spécifiques pour chaque opération API
  Future<Response?> get(String endpoint, {Map<String, dynamic>? queryParams}) => request("GET", endpoint, queryParams: queryParams);

  Future<Response?> post(String endpoint, Map<String, dynamic> data) => request("POST", endpoint, data: data);

  Future<Response?> postWithFile(String endpoint, FormData data) => request("POST", endpoint, dataForm: data);

  Future<Response?> put(String endpoint, Map<String, dynamic> data) => request("PUT", endpoint, data: data);

  Future<Response?> patch(String endpoint, Map<String, dynamic> data) => request("PATCH", endpoint, data: data);

  Future<Response?> delete(String endpoint) => request("DELETE", endpoint);

  // 📌 Rafraîchir le token en cas d'expiration
  Future<bool> refreshAccessToken() async {
    try {
      final String? refreshToken = await authLocalDataSource.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await dio.post(
        '/token/refresh/',
        data: {"refresh": refreshToken},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        await authLocalDataSource.saveAccessToken(response.data['access']);
        return true;
      } else {
        await authLocalDataSource.deleteToken();
        return false;
      }
    } on DioException catch (_) {
      await authLocalDataSource.deleteToken();
      return false;
    }
  }
}
