import 'package:loza_mobile/data/network/app_api.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<GlobalResponse> login(LoginRequest loginRequest);

  Future<GlobalResponse> register(RegisterRequest registerRequest);

  Future<GlobalResponse> postFavorite(int userId, int productId);

  Future<GlobalResponse> postToCart(
    int userId,
    String name,
    String color,
    int colorno,
    int quan,
  );

  Future<GlobalResponse> addAddress(AddAddressRequest addAddressRequest);

  Future<GlobalResponse> addOrder(AddOrderRequest addOrderRequest);

  Future<GlobalResponse> addRating(AddRatingRequest addRatingRequest);

  Future<GlobalResponse> confirmOrder(int orderId);

  Future<HomeResponse> getNewestData(int userId);

  Future<ProductDetailsResponse> getProductDetails(int productId);

  Future<CartResponse> getFromCart(int userId);

  Future<AddressResponse> getAddress(int userId);

  Future<FavouriteResponse> getFavourite(int userId);

  Future<ReviewsResponse> getReviews(int productId);

  Future<OrdersResponse> getOrders(int userId);

  Future<OrderDetailsResponse> getOrdersDetails(int orderId);

  Future<NotDeliveredOrdersResponse> getNotDeliveredOrders();

  Future<DeliveryManDetailsResponse> getDeliVeryMansDetails(int orderId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<GlobalResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<GlobalResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.firstName,
        registerRequest.lastName,
        registerRequest.email,
        registerRequest.password,
        registerRequest.phoneNumber,
        registerRequest.address,
        registerRequest.dateOfBirth);
  }

  @override
  Future<GlobalResponse> postFavorite(int userId, int productId) async {
    return await _appServiceClient.postFavorite(userId, productId);
  }

  @override
  Future<GlobalResponse> postToCart(int userId,
      String name,
      String color,
      int colorno,
      int quan,) async {
    return await _appServiceClient.postToCart(userId, name,color,colorno,quan);
  }

  @override
  Future<GlobalResponse> addAddress(AddAddressRequest addAddressRequest) async {
    return await _appServiceClient.addAddress(
      addAddressRequest.userId,
        addAddressRequest.addressName, addAddressRequest.location);
  }

  @override
  Future<GlobalResponse> addOrder(AddOrderRequest addOrderRequest) async {
    return await _appServiceClient.addOrder(
        addOrderRequest.userid,
        addOrderRequest.paymentmethod,
        addOrderRequest.addressid,
        addOrderRequest.total
    );
  }

  @override
  Future<GlobalResponse> addRating(AddRatingRequest addRatingRequest) async{
    return await _appServiceClient.addRate(
        addRatingRequest.userid,
        addRatingRequest.productId,
        addRatingRequest.rating,
        addRatingRequest.reviews
    );
  }


  @override
  Future<GlobalResponse> confirmOrder(int orderId) async{
    return await _appServiceClient.confirmOrder(orderId);
  }

  @override
  Future<HomeResponse> getNewestData(int userId) async {
    return await _appServiceClient.getNewestData(userId);
  }

  @override
  Future<ProductDetailsResponse> getProductDetails(int productId) async {
    return await _appServiceClient.getProductDetails(productId);
  }

  @override
  Future<CartResponse> getFromCart(int userId) async {
    return await _appServiceClient.getFromCart(userId);
  }

  @override
  Future<AddressResponse> getAddress(int userId) async {
    return await _appServiceClient.getAddress(userId);
  }

  @override
  Future<FavouriteResponse> getFavourite(int userId) async{
    return await _appServiceClient.getFavourite(userId);
  }

  @override
  Future<ReviewsResponse> getReviews(int productId) async {
    return await _appServiceClient.getReviews(productId);
  }

  @override
  Future<OrdersResponse> getOrders(int userId) async {
    return await _appServiceClient.getOrders(userId);
  }

  @override
  Future<OrderDetailsResponse> getOrdersDetails(int orderId) async {
    return await _appServiceClient.getOrdersDetails(orderId);
  }

  @override
  Future<NotDeliveredOrdersResponse> getNotDeliveredOrders() async{
    return await _appServiceClient.getNotDeliveredOrders();
  }

  @override
  Future<DeliveryManDetailsResponse> getDeliVeryMansDetails(int orderId) async{
    return await _appServiceClient.getDeliVeryMansDetails(orderId);
  }

}
