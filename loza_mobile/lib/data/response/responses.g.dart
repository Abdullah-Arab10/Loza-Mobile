// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    BaseResponse()..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['token'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
      json['totalCount'] as String?,
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
      'totalCount': instance.totalCount,
    };
