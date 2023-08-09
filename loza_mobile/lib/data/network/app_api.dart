import 'package:dio/dio.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/api/Auth/Login')
  Future<AuthenticationResponse> login(
      @Field('email') String email, @Field('password') String password);

  @POST("/api/Auth/Register")
  Future<AuthenticationResponse> register(
      @Field("firstName") String firstName,
      @Field("lastName") String lastName,
      @Field("email") String email,
      @Field("password") String password,
      @Field("phoneNumber") String phoneNumber,
      @Field("address") String address,
      @Field("dateOfBirth") String dateOfBirth);

  @GET("/api/Product/Newest?userId=")
  Future<HomeResponse> getNewestData(int userId);
}
