import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/base_usecase.dart';

import '../../data/network/request.dart';

class PostRatingUseCase implements BaseUseCase<PostRatingUseCaseInput, Global> {
  final Repository _repository;

  PostRatingUseCase(this._repository);

  @override
  Future<Either<Failure, Global>> execute(PostRatingUseCaseInput input) async {
    return await _repository.addRating(AddRatingRequest(input.userId,input.productId,input.rating,input.reviews));
  }
}

class PostRatingUseCaseInput {
  int userId;
  int productId;
  double rating;
  String reviews;

  PostRatingUseCaseInput(this.userId, this.productId,this.rating,this.reviews);
}

class GetReviewsUseCase implements BaseUseCase<int, ReviewsObject> {
  final Repository _repository;

  GetReviewsUseCase(this._repository);

  @override
  Future<Either<Failure, ReviewsObject>> execute(
      int productId) async {
    return await _repository.getReviews(productId);
  }
}