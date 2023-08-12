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

extension GlobalResponseMapper on GlobalResponse? {
  Global toDomain() {
    return Global(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      this?.dataResponse?.toDomain(),
      this?.errorResponse?.toDomain(),
    );
  }
}

extension HomeDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> toDomain(){
    return {
      'id' : this?['id'] ?? Constants.zero,
      'name' : this?['name'] ?? Constants.empty,
      'description' : this?['description'] ?? Constants.empty,
      'price' : this?['price'] ?? Constants.zero,
      'category' : this?['category'] ?? Constants.zero,
      'color' : this?['color'] ?? Constants.empty,
      'colorNo' : this?['colorNo'] ?? Constants.zero,
      'quantity' : this?['quantity'] ?? Constants.zero,
      'productImage' : this?['productImage' ] ?? Constants.empty,
      'isFavorite' : this?['isFavorite'] ?? Constants.orTrue,
    };
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.newest
        ?.map((homeDataResponse) => homeDataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = HomeData(newest);
    return HomeObject(
        this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
        dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension PhotoMapper on Map<String, dynamic>? {
  Map<String, dynamic> photoToDomain(){
    return {
      'photoUrl' : this?['photoUrl'] ?? Constants.empty,
    };
  }
}

extension ProductDetailsResponseMapper on ProductDetailsResponse? {
  ProductDetails toDomain() {
    Product productDataResponse = Product(
      this?.dataResponse?.product?.id?.orZero() ?? Constants.zero,
      this?.dataResponse?.product?.name?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.product?.description?.orEmpty() ?? Constants.empty,
     this?.dataResponse?.product?.price?.orZero() ?? Constants.zero,
      this?.dataResponse?.product?.category?.orZero() ?? Constants.zero,
      this?.dataResponse?.product?.color?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.product?.quantity?.orZero() ?? Constants.zero,
       this?.dataResponse?.product?.productImage?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.product?.totalRate?.orZero() ?? Constants.zero,
     (this?.dataResponse?.product?.photos?.map((photo) => photo.photoToDomain()) ??
    const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList(),
    );
    var dataResponse = ProductData(productDataResponse);
    return ProductDetails(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}