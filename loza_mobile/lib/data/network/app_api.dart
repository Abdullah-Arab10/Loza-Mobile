import 'package:dio/dio.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/Auth/Login')
  Future<AuthenticationResponse> login(@Field('email') String email,
      @Field('password') String password);
}
