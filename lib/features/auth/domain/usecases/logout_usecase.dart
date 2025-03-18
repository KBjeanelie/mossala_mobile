
import 'package:dartz/dartz.dart';
import '../repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<Either<String, bool>> call() {
    return repository.logout();
  }
}