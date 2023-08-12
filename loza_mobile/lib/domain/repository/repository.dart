import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/data/response/responses.dart';
import 'package:loza_mobile/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Global>> login(LoginRequest loginRequest);

  Future<Either<Failure, Global>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, Global>> posFavorite(int userId, int productId);

  Future<Either<Failure, Global>> postToCart(int userId,
      String name,
      String color,
      int colorno,
      int quan,);

  Future<Either<Failure, HomeObject>> getNewestData(int userId);

  Future<Either<Failure, ProductDetails>> getProductDetails(int productId);
}