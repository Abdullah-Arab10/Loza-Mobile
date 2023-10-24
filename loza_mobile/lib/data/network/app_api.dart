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

  @POST('/api/Address/addAddress?userId=')
  Future<GlobalResponse> addAddress(
      int userId,
      @Field('addressName') String addressName, @Field('location') String location);

  @POST("/api/Order/CreateOrder")
  Future<GlobalResponse> addOrder(
      @Field("userId") int userId,
      @Field("paymentmethod") int paymentMethod,
      @Field("addressid") int addressId,
      @Field("total") double total,
      );

  @POST("/api/RatingReview/AddRate")
  Future<GlobalResponse> addRate(
      @Field("userId") int userId,
      @Field("productId") int productId,
      @Field("rating") double rating,
      @Field("reviews") String reviews,
      );

  @PUT("/api/DeliveryMan/ConfirmOrder?ordernumber=")
  Future<GlobalResponse> confirmOrder(int orderId);

  @GET("/api/Product/Newest?userId=")
  Future<HomeResponse> getNewestData(int userId);

  @GET("/api/Product/api/Product/GetProductsById/")
  Future<ProductDetailsResponse> getProductDetails(int productId);

  @GET("/api/Cart/GetUserCart?userId=")
  Future<CartResponse> getFromCart(int userId);

  @GET("/api/Address/getAddressById?userId=")
  Future<AddressResponse> getAddress(int userId);

  @GET("/api/Favorite/GetAllFavorites/")
  Future<FavouriteResponse> getFavourite(int userId);

  @GET("/AllReviews/")
  Future<ReviewsResponse> getReviews(int productId);

  @GET("/api/Order/GetUserOrders/")
  Future<OrdersResponse> getOrders(int userId);

  @GET("/api/Order/GetOrderByNumber?orderid=")
  Future<OrderDetailsResponse> getOrdersDetails(int orderId);

  @GET("/api/DeliveryMan/NotDelIveredOrders")
  Future<NotDeliveredOrdersResponse> getNotDeliveredOrders();

  @GET("/api/DeliveryMan/GetOrderDetailsForDeliveryMan?ordernumber=")
  Future<DeliveryManDetailsResponse> getDeliVeryMansDetails(int orderId);

}
