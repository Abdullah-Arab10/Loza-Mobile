import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

class CartUseCase implements BaseUseCase<int, CartObject> {
  final Repository _repository;

  CartUseCase(this._repository);

  @override
  Future<Either<Failure, CartObject>> execute(int userId) async {
    return await _repository.getFromCart(userId);
  }
}