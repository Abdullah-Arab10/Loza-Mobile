import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/app/extensions.dart';
import 'package:loza_mobile/data/response/responses.dart';
import 'package:loza_mobile/domain/models/models.dart';

extension DataResponseMapper on DataResponse? {
  Data toDomain() {
    return Data(
      this?.token?.orEmpty() ?? Constants.empty,
    );
  }
}

extension ErrorResponseMapper on ErrorResponse? {
  Error toDomain() {
    return Error(
      this?.message?.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      this?.dataResponse?.toDomain(),
      this?.errorResponse?.toDomain(),
      this?.totalCount?.orEmpty() ?? Constants.empty
    );
  }
}