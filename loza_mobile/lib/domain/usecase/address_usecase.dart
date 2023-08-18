import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

class AddAddressUseCase implements BaseUseCase<AddAddressUseCaseInput, Global> {
  final Repository _repository;

  AddAddressUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(
      AddAddressUseCaseInput input) async {
    return await _repository.addAddress(AddAddressRequest(input.userId, input.addressName, input.location));
  }
}

class AddAddressUseCaseInput {
  int userId;
  String addressName;
  String location;

  AddAddressUseCaseInput(this.userId, this.addressName,this.location);
}

class GetAddressUseCase implements BaseUseCase<int, AddressObject> {
  final Repository _repository;

  GetAddressUseCase(this._repository);

  @override
  Future<Either<Failure, AddressObject>> execute(
      int userId) async {
    return await _repository.getAddress(userId);
  }
}