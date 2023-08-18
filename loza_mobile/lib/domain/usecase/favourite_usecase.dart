import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';
import '../repository/repository.dart';

class GetFavouriteUseCase implements BaseUseCase<int, FavouriteObject> {
  final Repository _repository;

  GetFavouriteUseCase(this._repository);

  @override
  Future<Either<Failure, FavouriteObject>> execute(
      int userId) async {
    return await _repository.getFavourite(userId);
  }
}