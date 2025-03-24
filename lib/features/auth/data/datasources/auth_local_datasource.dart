import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSource({required this.secureStorage});

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";
  static const _user = "user";

  Future<void> saveUser(Map<String, dynamic> user) async {
    await secureStorage.write(key: _user, value: jsonEncode(user));
  }

  Future<Map<String, dynamic>?> getUser() async {
    String? userJson = await secureStorage.read(key: _user);
    if (userJson == null) return null;
    return jsonDecode(userJson) as Map<String, dynamic>;
  }

  Future<void> saveAccessToken(String token) async {
    await secureStorage.write(key: _accessTokenKey, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    await secureStorage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: _refreshTokenKey);
  }

  Future<void> deleteToken() async {
    await secureStorage.delete(key: _accessTokenKey);
    await secureStorage.delete(key: _refreshTokenKey);
    await secureStorage.delete(key: _user);
  }
}
