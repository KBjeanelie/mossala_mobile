import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, User>> login(String tel, String password);
  Future<Either<String, User>> register(String username, String tel, String password);
  Future<Either<String, bool>> logout();
}
