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
  Future<Either<Failure, Authentication>> login(
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
  Future<Either<Failure, Authentication>> register(
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
  }

