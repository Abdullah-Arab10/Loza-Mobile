import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}