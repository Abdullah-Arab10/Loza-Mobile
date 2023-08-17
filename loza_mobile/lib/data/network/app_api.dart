import 'package:dio/dio.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/api/Auth/Login')
  Future<GlobalResponse> login(
      @Field('email') String email, @Field('password') String password);

  @POST("/api/Auth/Register")
  Future<GlobalResponse> register(
      @Field("firstName") String firstName,
      @Field("lastName") String lastName,
      @Field("email") String email,
      @Field("password") String password,
      @Field("phoneNumber") String phoneNumber,
      @Field("address") String address,
      @Field("dateOfBirth") String dateOfBirth);

  @POST("/api/Favorite/MakeFavorite/")
  Future<GlobalResponse> postFavorite(int userId, int productId);

  @POST("/api/Cart/AddToCart")
  Future<GlobalResponse> postToCart(
      @Field("userId") int userId,
      @Field("name") String name,
      @Field("color") String color,
      @Field("colorno") int colorno,
      @Field("quant") int quan,
  );

  @GET("/api/Product/Newest?userId=")
  Future<HomeResponse> getNewestData(int userId);

  @GET("/api/Product/api/Product/GetProductsById/")
  Future<ProductDetailsResponse> getProductDetails(int productId);

  @GET("/api/Cart/GetUserCart?userId=")
  Future<CartResponse> getFromCart(int userId);
}
