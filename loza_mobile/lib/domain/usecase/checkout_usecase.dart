import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

class CheckOutUseCase implements BaseUseCase<CheckOutUseCaseInput, Global> {
  final Repository _repository;

  CheckOutUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(
      CheckOutUseCaseInput input) async {
    return await _repository.addOrder(AddOrderRequest(input.userid, input.paymentmethod, input.addressid, input.total));
  }
}

class CheckOutUseCaseInput {
  int userid;
  int paymentmethod;
  int addressid;
  double total;

  CheckOutUseCaseInput(this.userid, this.paymentmethod, this.addressid, this.total);
}