import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';
import '../repository/repository.dart';

class GetNotDeliveredOrdersUseCase implements BaseUseCase<void, NotDeliveredOrders> {
  final Repository _repository;

  GetNotDeliveredOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, NotDeliveredOrders>> execute(void input) async {
    return await _repository.getNotDeliveredOrders();
  }
}

class GetDeliveryManDetailsUseCase implements BaseUseCase<int, DeliveryManDetails> {
  final Repository _repository;

  GetDeliveryManDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, DeliveryManDetails>> execute(
      int orderId) async {
    return await _repository.getDeliVeryMansDetails(orderId);
  }
}

class ConfirmOrderUseCase implements BaseUseCase<int, Global> {
  final Repository _repository;

  ConfirmOrderUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(
      int orderId) async {
    return await _repository.confirmOrder(orderId);
  }
}