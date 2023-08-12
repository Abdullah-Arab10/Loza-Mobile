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
  int? price;

  @JsonKey(name: 'category')
  int? category;

  @JsonKey(name: 'color')
  String? color;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'productImage')
  String? productImage;

  @JsonKey(name: 'totalrate')
  int? totalRate;

  @JsonKey(name: 'photos')
  List<Map<String, dynamic>>? photos;

  ProductResponse(
      this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.color,
      this.quantity,
      this.productImage,
      this.totalRate,
      this.photos
      );


  // toJson
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  //fromJson
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class ProductDataResponse {
  @JsonKey(name: 'Product')
  ProductResponse? product;

  ProductDataResponse(this.product);

  //fromJson
  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);

}

@JsonSerializable()
class ProductDetailsResponse extends BaseResponse{
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  ProductDataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  ProductDetailsResponse(this.isError,this.dataResponse,this.errorResponse);

  //fromJson
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);

}


