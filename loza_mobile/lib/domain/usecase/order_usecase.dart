import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';
import '../repository/repository.dart';

class GetOrdersUseCase implements BaseUseCase<int, OrdersObject> {
  final Repository _repository;

  GetOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, OrdersObject>> execute(
      int userId) async {
    return await _repository.getOrders(userId);
  }
}

class GetOrdersDetailsUseCase implements BaseUseCase<int, OrderDetails> {
  final Repository _repository;

  GetOrdersDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, OrderDetails>> execute(
      int orderId) async {
    return await _repository.getOrdersDetails(orderId);
  }
}