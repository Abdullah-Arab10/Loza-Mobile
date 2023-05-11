import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        input.firstName,
        input.lastName,
        input.email,
        input.password,
        input.phoneNumber,
        input.address,
        input.dateOfBirth));
  }
}

class RegisterUseCaseInput {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String address;
  String dateOfBirth;

  RegisterUseCaseInput(this.firstName, this.lastName, this.email, this.password,
      this.phoneNumber, this.address, this.dateOfBirth);
}
