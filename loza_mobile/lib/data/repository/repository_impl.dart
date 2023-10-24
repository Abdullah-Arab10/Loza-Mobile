import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/mapper/mapper.dart';
import 'package:loza_mobile/data/network/error_handler.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/network_info.dart';
import 'package:loza_mobile/data/data_source/remote_data_source.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, Global>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
       } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
     } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.register(registerRequest);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> posFavorite(int userId, int productId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.postFavorite(userId, productId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> postToCart(int userId, String name, String color, int colorno, int quan) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.postToCart(userId, name, color, colorno, quan);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> addAddress(AddAddressRequest addAddressRequest) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.addAddress(addAddressRequest);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> addOrder(AddOrderRequest addOrderRequest) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.addOrder(addOrderRequest);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> addRating(AddRatingRequest addRatingRequest) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.addRating(addRatingRequest);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Global>> confirmOrder(int orderId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.confirmOrder(orderId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getNewestData(int userId) async{
      if (await _networkInfo.isConnected) {

        try {
          final response = await _remoteDataSource.getNewestData(userId);

          if (response.statusCode == ApiInternalStatus.SUCCESS) {

            return Right(response.toDomain());
          } else {

            return Left(Failure(ApiInternalStatus.FAILURE,
                response.errorResponse?.message ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {

        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(int productId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getProductDetails(productId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CartObject>> getFromCart(int userId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getFromCart(userId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddressObject>> getAddress(int userId) async {
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getAddress(userId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, FavouriteObject>> getFavourite(int userId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getFavourite(userId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ReviewsObject>> getReviews(int productId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getReviews(productId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, OrdersObject>> getOrders(int userId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getOrders(userId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrdersDetails(int orderId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getOrdersDetails(orderId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, NotDeliveredOrders>> getNotDeliveredOrders() async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getNotDeliveredOrders();

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryManDetails>> getDeliVeryMansDetails(int orderId) async{
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.getDeliVeryMansDetails(orderId);

        if (response.statusCode == ApiInternalStatus.SUCCESS) {

          return Right(response.toDomain());
        } else {

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.errorResponse?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {

      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

