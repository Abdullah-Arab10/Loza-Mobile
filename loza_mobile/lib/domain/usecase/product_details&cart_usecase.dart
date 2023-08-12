import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';
import '../repository/repository.dart';

class ProductDetailsUseCase implements BaseUseCase<int, ProductDetails> {
  final Repository _repository;

  ProductDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, ProductDetails>> execute(int productId) async {
    return await _repository.getProductDetails(productId);
  }
}

class PostToCartUseCase implements BaseUseCase<PostToCartUseCaseInput, Global> {
  final Repository _repository;

  PostToCartUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(PostToCartUseCaseInput input) async {
    return await _repository.postToCart(input.userId, input.name,input.color,input.colorno,input.quan);
  }
}

class PostToCartUseCaseInput {
  int userId;
      String name;
  String color;
      int colorno;
  int quan;

  PostToCartUseCaseInput(this.userId, this.name,this.color,this.colorno,this.quan);
}
