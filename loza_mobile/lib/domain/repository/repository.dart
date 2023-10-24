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

  Future<Either<Failure, Global>> addAddress(AddAddressRequest addAddressRequest);

  Future<Either<Failure, Global>> addOrder(AddOrderRequest addAddressRequest);

  Future<Either<Failure, Global>> addRating(AddRatingRequest addRatingRequest);

  Future<Either<Failure, Global>> confirmOrder(int orderId);

  Future<Either<Failure, HomeObject>> getNewestData(int userId);

  Future<Either<Failure, ProductDetails>> getProductDetails(int productId);

  Future<Either<Failure, CartObject>> getFromCart(int userId);

  Future<Either<Failure, AddressObject>> getAddress(int userId);

  Future<Either<Failure, FavouriteObject>> getFavourite(int userId);

  Future<Either<Failure, ReviewsObject>> getReviews(int productId);

  Future<Either<Failure, OrdersObject>> getOrders(int userId);

  Future<Either<Failure, OrderDetails>> getOrdersDetails(int orderId);

  Future<Either<Failure, NotDeliveredOrders>> getNotDeliveredOrders();

  Future<Either<Failure, DeliveryManDetails>> getDeliVeryMansDetails(int orderId);
}