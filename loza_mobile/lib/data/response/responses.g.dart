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

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) =>
    GlobalResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$GlobalResponseToJson(GlobalResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['Newest'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'Newest': instance.newest,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['category'] as int?,
      json['color'] as String?,
      json['colorNo'] as int?,
      (json['quantity'] as num?)?.toDouble(),
      json['productImage'] as String?,
      (json['totalrate'] as num?)?.toDouble(),
      json['productDimensions'] as String?,
      (json['photos'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'color': instance.color,
      'colorNo': instance.colorNo,
      'quantity': instance.quantity,
      'productImage': instance.productImage,
      'totalrate': instance.totalRate,
      'productDimensions': instance.productDimensions,
      'photos': instance.photos,
    };

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : ProductResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      (json['UserCart'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'UserCart': instance.newest,
    };

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : CartDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

AddressDataResponse _$AddressDataResponseFromJson(Map<String, dynamic> json) =>
    AddressDataResponse(
      (json['Addresses'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AddressDataResponseToJson(
        AddressDataResponse instance) =>
    <String, dynamic>{
      'Addresses': instance.addresses,
    };

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : AddressDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

FavouriteDataResponse _$FavouriteDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavouriteDataResponse(
      (json['favoriteList'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$FavouriteDataResponseToJson(
        FavouriteDataResponse instance) =>
    <String, dynamic>{
      'favoriteList': instance.favoriteList,
    };

FavouriteResponse _$FavouriteResponseFromJson(Map<String, dynamic> json) =>
    FavouriteResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : FavouriteDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$FavouriteResponseToJson(FavouriteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

ReviewsDataResponse _$ReviewsDataResponseFromJson(Map<String, dynamic> json) =>
    ReviewsDataResponse(
      (json['allReveiws'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ReviewsDataResponseToJson(
        ReviewsDataResponse instance) =>
    <String, dynamic>{
      'allReveiws': instance.allReviews,
    };

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : ReviewsDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$ReviewsResponseToJson(ReviewsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

OrdersDataResponse _$OrdersDataResponseFromJson(Map<String, dynamic> json) =>
    OrdersDataResponse(
      (json['AllOrders'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$OrdersDataResponseToJson(OrdersDataResponse instance) =>
    <String, dynamic>{
      'AllOrders': instance.allOrders,
    };

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : OrdersDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      json['number'] as int?,
      json['shippingadress'] as String?,
      json['paymentmethod'] as int?,
      json['orderdate'] as String?,
      json['isDelivered'] as bool?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    )..totalCheck = (json['totalCheck'] as num?)?.toDouble();

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'number': instance.number,
      'shippingadress': instance.shippingadress,
      'paymentmethod': instance.paymentmethod,
      'orderdate': instance.orderdate,
      'isDelivered': instance.isDelivered,
      'totalCheck': instance.totalCheck,
      'products': instance.products,
    };

OrderDetailsResponse _$OrderDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsResponse(
      json['isError'] as bool?,
      json['data'] == null
          ? null
          : OrderResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['errors'] == null
          ? null
          : ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>),
    )..statusCode = json['statusCode'] as int?;

Map<String, dynamic> _$OrderDetailsResponseToJson(
        OrderDetailsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'data': instance.dataResponse,
      'errors': instance.errorResponse,
    };
