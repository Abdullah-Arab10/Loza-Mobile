import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'statusCode')
  int? statusCode;
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name:'token')
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

  @JsonKey(name:'message')
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
  @JsonKey(name:'data')
  DataResponse? dataResponse;
  @JsonKey(name:'errors')
  ErrorResponse? errorResponse;
  @JsonKey(name:'totalCount')
  String? totalCount;

  AuthenticationResponse(this.isError,this.dataResponse,this.errorResponse,this.totalCount);

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
/*
* {
*  "statusCode" : 200,
*  "data" : {
*   "token" : "",
*  },
*  "error" : {
*   "message" : "" ,
* }
* }
*/
