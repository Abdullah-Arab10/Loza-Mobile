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
  Map<String, dynamic> toDomain() {
    return {
      'id': this?['id'] ?? Constants.zero,
      'name': this?['name'] ?? Constants.empty,
      'description': this?['description'] ?? Constants.empty,
      'price': this?['price'] ?? Constants.zero,
      'category': this?['category'] ?? Constants.zero,
      'color': this?['color'] ?? Constants.empty,
      'colorNo': this?['colorNo'] ?? Constants.zero,
      'quantity': this?['quantity'] ?? Constants.zero,
      'productImage': this?['productImage'] ?? Constants.empty,
      'isFavorite': this?['isFavorite'] ?? Constants.orTrue,
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
  Map<String, dynamic> photoToDomain() {
    return {
      'photoUrl': this?['photoUrl'] ?? Constants.empty,
    };
  }
}

extension ProductDetailsResponseMapper on ProductDetailsResponse? {
  ProductDetails toDomain() {
    List<Map<String, dynamic>> photos = (this?.dataResponse?.photos?.map(
                (photosDataResponse) => photosDataResponse.photoToDomain()) ??
            const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var product = Product(
      this?.dataResponse?.id?.orZero() ?? Constants.zero,
      this?.dataResponse?.name?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.description?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.price?.orZeroD() ?? Constants.zeroD,
      this?.dataResponse?.category?.orZero() ?? Constants.zero,
      this?.dataResponse?.color?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.colorNo?.orZero() ?? Constants.zero,
      this?.dataResponse?.quantity?.orZeroD() ?? Constants.zeroD,
      this?.dataResponse?.productImage?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.totalRate?.orZeroD() ?? Constants.zeroD,
      this?.dataResponse?.productDimensions?.orEmpty() ?? Constants.empty,
      photos,
    );

    return ProductDetails(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      product,
      this?.errorResponse?.toDomain(),
    );
  }
}

// cart

extension CartDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> cartToDomain() {
    return {
      'qunatity': this?['qunatity'] ?? Constants.zero,
      'productName': this?['productName'] ?? Constants.empty,
      'price': this?['price'] ?? Constants.zero,
      'photo': this?['photo'] ?? Constants.empty,
      'color': this?['color'] ?? Constants.empty,
      'colorNo': this?['colorNo'] ?? Constants.zero,
      'id': this?['id'] ?? Constants.zero,
    };
  }
}

extension CartResponseMapper on CartResponse? {
  CartObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.newest
        ?.map((homeDataResponse) => homeDataResponse.cartToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = CartData(newest);
    return CartObject(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension AddressDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> addressToDomain() {
    return {
      'id': this?['id'] ?? Constants.zero,
      'location': this?['location'] ?? Constants.empty,
      'addressName': this?['addressName'] ?? Constants.empty,
    };
  }
}

extension AddressResponseMapper on AddressResponse? {
  AddressObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.addresses
        ?.map((addressDataResponse) => addressDataResponse.addressToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = AddressData(newest);
    return AddressObject(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension FavouriteDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> favouriteToDomain() {
    return {
      'id': this?['id'] ?? Constants.zero,
      'name': this?['name'] ?? Constants.empty,
      'description': this?['description'] ?? Constants.empty,
      'price': this?['price'] ?? Constants.zero,
      'category': this?['category'] ?? Constants.zero,
      'color': this?['color'] ?? Constants.empty,
      'colorNo': this?['colorNo'] ?? Constants.zero,
      'quantity': this?['quantity'] ?? Constants.zero,
      'productImage': this?['productImage'] ?? Constants.empty,
      'productDimensions' : this?['productDimensions'] ?? Constants.empty,
      'isFavorite': this?['isFavorite'] ?? Constants.orTrue,
    };
  }
}

extension FavouriteResponseMapper on FavouriteResponse? {
  FavouriteObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.favoriteList
        ?.map((favouriteDataResponse) => favouriteDataResponse.favouriteToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = FavouriteData(newest);
    return FavouriteObject(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension ReviewsDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> reviewToDomain() {
    return {
      'userName': this?['userName'] ?? Constants.empty,
      'rate': this?['rate'] ?? Constants.zero,
      'rreviews': this?['rreviews'] ?? Constants.empty,
    };
  }
}

extension ReviewsResponseMapper on ReviewsResponse? {
  ReviewsObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.allReviews
        ?.map((favouriteDataResponse) => favouriteDataResponse.reviewToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = ReviewsData(newest);
    return ReviewsObject(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension OrdersDataResponseMapper on Map<String, dynamic>? {
  Map<String, dynamic> orderToDomain() {
    return {
      'orderNumber': this?['orderNumber'] ?? Constants.zero,
      'useraddress': this?['useraddress'] ?? Constants.empty,
      'isDelivered': this?['isDelivered'] ?? Constants.orFalse,
      'orderdate': this?['orderdate'] ?? Constants.empty,
    };
  }
}

extension OrdersResponseMapper on OrdersResponse? {
  OrdersObject toDomain() {
    List<Map<String, dynamic>> newest = (this
        ?.dataResponse
        ?.allOrders
        ?.map((orderDataResponse) => orderDataResponse.orderToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var dataResponse = OrdersData(newest);
    return OrdersObject(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      dataResponse,
      this?.errorResponse?.toDomain(),
    );
  }
}

extension ProductMapper on Map<String, dynamic>? {
  Map<String, dynamic> productToDomain() {
    return {
      'proname': this?['proname'] ?? Constants.empty,
      'quantinty': this?['quantinty'] ?? Constants.zero,
      'color': this?['color'] ?? Constants.empty,
      'price': this?['price'] ?? Constants.zeroD,
    };
  }
}

extension OrderDetailsResponseMapper on OrderDetailsResponse? {
  OrderDetails toDomain() {
    List<Map<String, dynamic>> products = (this?.dataResponse?.products?.map(
            (productDataResponse) => productDataResponse.productToDomain()) ??
        const Iterable.empty())
        .cast<Map<String, dynamic>>()
        .toList();

    var product = Order(
      this?.dataResponse?.number?.orZero() ?? Constants.zero,
      this?.dataResponse?.shippingadress?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.paymentmethod?.orZero() ?? Constants.zero,
      this?.dataResponse?.orderdate?.orEmpty() ?? Constants.empty,
      this?.dataResponse?.isDelivered?.orTrue() ?? Constants.orFalse,
      this?.dataResponse?.totalCheck?.orZeroD() ?? Constants.zeroD,
      products,
    );

    return OrderDetails(
      this?.statusCode?.orZero() ?? Constants.zero,
      this?.isError?.orTrue() ?? Constants.orTrue,
      product,
      this?.errorResponse?.toDomain(),
    );
  }
}