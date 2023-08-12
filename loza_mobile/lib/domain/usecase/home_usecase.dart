import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';
import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<int, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(int userId) async {
    return await _repository.getNewestData(userId);
  }
}

class PostFavoriteUseCase implements BaseUseCase<FavoriteUseCaseInput, Global> {
  final Repository _repository;

  PostFavoriteUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(FavoriteUseCaseInput input) async {
    return await _repository.posFavorite(input.userId, input.productId);
  }
}

class FavoriteUseCaseInput {
  int userId;
  int productId;

  FavoriteUseCaseInput(this.userId, this.productId);
}
