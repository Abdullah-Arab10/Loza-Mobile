import 'package:loza_mobile/data/network/app_api.dart';
import 'package:loza_mobile/data/network/request.dart';
import 'package:loza_mobile/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  Future<HomeResponse> getNewestData(int userId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
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
  Future<HomeResponse> getNewestData(int userId) async{
    return await _appServiceClient.getNewestData(userId);
  }


}
