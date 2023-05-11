import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
}