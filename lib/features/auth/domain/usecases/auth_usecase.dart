
import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, User>> call(String tel, String password) {
    return repository.login(tel, password);
  }
}


class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<Either<String, bool>> call() {
    return repository.logout();
  }
}

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<String, User>> call(
    String lastname, 
    String firstname, 
    String tel,
    String adress,
    String password
  ) {
    return repository.register(lastname, firstname, tel, adress, password);
  }
}
