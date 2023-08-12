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

  Future<HomeResponse> getNewestData(int userId);

  Future<ProductDetailsResponse> getProductDetails(int productId);
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
  Future<HomeResponse> getNewestData(int userId) async {
    return await _appServiceClient.getNewestData(userId);
  }

  @override
  Future<ProductDetailsResponse> getProductDetails(int productId) async {
    return await _appServiceClient.getProductDetails(productId);
  }
}
