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
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'isError')
  bool? isError;
  @JsonKey(name: 'data')
  DataResponse? dataResponse;
  @JsonKey(name: 'errors')
  ErrorResponse? errorResponse;

  AuthenticationResponse(this.isError, this.dataResponse, this.errorResponse);

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

// newest

// @JsonSerializable()
// class NewestResponse {
//   @JsonKey(name: 'id')
//   int? id;
//
//   @JsonKey(name: 'name')
//   String? name;
//
//   @JsonKey(name: 'description')
//   String? description;
//
//   @JsonKey(name: 'price')
//   int? price;
//
//   @JsonKey(name: 'category')
//   int? category;
//
//   @JsonKey(name: 'color')
//   String? color;
//
//   @JsonKey(name: 'colorNo')
//   int? colorNo;
//
//   @JsonKey(name: 'quantity')
//   int? quantity;
//
//   @JsonKey(name: 'productImage')
//   String? productImage;
//
//   @JsonKey(name: 'isFavorite')
//   bool? isFavorite;
//
//   NewestResponse(
//       this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.category,
//       this.color,
//       this.colorNo,
//       this.quantity,
//       this.productImage,
//       this.isFavorite);
//
//   // toJson
//   Map<String, dynamic> toJson() => _$NewestResponseToJson(this);
//
//   //fromJson
//   factory NewestResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewestResponseFromJson(json);
// }

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
