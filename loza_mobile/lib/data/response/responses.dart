import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'statusCode')
  int? statusCode;
}
// login & register

@JsonSerializable()
class DataResponse {
  @JsonKey(name: 'token')
  String? token;

  DataResponse(this.token);

  // from json
  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  @JsonKey(name: 'message')
  String? message;

  ErrorResponse(this.message);

  // from json
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class GlobalResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  DataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  GlobalResponse(this.isError, this.dataResponse, this.errorResponse);

  // from json
  factory GlobalResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$GlobalResponseToJson(this);
}

// home

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'Newest')
  List<Map<String, dynamic>>? newest;

  HomeDataResponse(this.newest);

  //fromJson
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  HomeDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  HomeResponse(this.isError,this.dataResponse, this.errorResponse);

  // toJson
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

  //fromJson
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

// Product details

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'category')
  int? category;

  @JsonKey(name: 'color')
  String? color;

  @JsonKey(name: 'colorNo')
  int? colorNo;

  @JsonKey(name: 'quantity')
  double? quantity;

  @JsonKey(name: 'productImage')
  String? productImage;

  @JsonKey(name: 'totalrate')
  double? totalRate;

  @JsonKey(name: 'productDimensions')
  String? productDimensions;

  @JsonKey(name: 'photos')
  List<Map<String, dynamic>>? photos;

  ProductResponse(
      this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.color,
      this.colorNo,
      this.quantity,
      this.productImage,
      this.totalRate,
      this.productDimensions,
      this.photos
      );


  // toJson
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  //fromJson
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class ProductDetailsResponse extends BaseResponse{
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  ProductResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  ProductDetailsResponse(this.isError,this.dataResponse,this.errorResponse);

  //fromJson
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);

}

// cart

@JsonSerializable()
class CartDataResponse {
  @JsonKey(name: 'UserCart')
  List<Map<String, dynamic>>? newest;

  CartDataResponse(this.newest);

  //fromJson
  factory CartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$CartDataResponseToJson(this);

}

@JsonSerializable()
class CartResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  CartDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  CartResponse(this.isError,this.dataResponse, this.errorResponse);

  // toJson
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);

  //fromJson
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable()
class AddressDataResponse {
  @JsonKey(name: 'Addresses')
  List<Map<String, dynamic>>? addresses;

  AddressDataResponse(this.addresses);

  //fromJson
  factory AddressDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$AddressDataResponseToJson(this);

}

@JsonSerializable()
class AddressResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  AddressDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  AddressResponse(this.isError,this.dataResponse, this.errorResponse);

  // toJson
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);

  //fromJson
  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);
}

@JsonSerializable()
class FavouriteDataResponse {
  @JsonKey(name: 'favoriteList')
  List<Map<String, dynamic>>? favoriteList;

  FavouriteDataResponse(this.favoriteList);

  //fromJson
  factory FavouriteDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$FavouriteDataResponseToJson(this);

}

@JsonSerializable()
class FavouriteResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  FavouriteDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  FavouriteResponse(this.isError,this.dataResponse, this.errorResponse);

  // toJson
  Map<String, dynamic> toJson() => _$FavouriteResponseToJson(this);

  //fromJson
  factory FavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseFromJson(json);
}

@JsonSerializable()
class ReviewsDataResponse {
  @JsonKey(name: 'allReveiws')
  List<Map<String, dynamic>>? allReviews;

  ReviewsDataResponse(this.allReviews);

  //fromJson
  factory ReviewsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ReviewsDataResponseToJson(this);

}

@JsonSerializable()
class ReviewsResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  ReviewsDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  ReviewsResponse(this.isError,this.dataResponse, this.errorResponse);

  // toJson
  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);

  //fromJson
  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);
}