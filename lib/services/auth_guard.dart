import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class AuthGuard {
  static final _storage = const FlutterSecureStorage();

  static Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final token = await _storage.read(key: 'access_token'); 
    if (token == null || token.isEmpty) {
      return '/login';
    }
    return null;
  }
}
