import 'package:dartz/dartz.dart';
import 'package:loza_mobile/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
