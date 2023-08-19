import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/data/network/app_api.dart';
import 'package:loza_mobile/data/network/network_info.dart';
import 'package:loza_mobile/data/data_source/remote_data_source.dart';
import 'package:loza_mobile/data/repository/repository_impl.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/address_usecase.dart';
import 'package:loza_mobile/domain/usecase/cart_usecase.dart';
import 'package:loza_mobile/domain/usecase/checkout_usecase.dart';
import 'package:loza_mobile/domain/usecase/favourite_usecase.dart';
import 'package:loza_mobile/domain/usecase/home_usecase.dart';
import 'package:loza_mobile/domain/usecase/login_usecase.dart';
import 'package:loza_mobile/domain/usecase/order_usecase.dart';
import 'package:loza_mobile/domain/usecase/product_details&cart_usecase.dart';
import 'package:loza_mobile/domain/usecase/register_usecase.dart';
import 'package:loza_mobile/domain/usecase/review_usecase.dart';
import 'package:loza_mobile/presentation/Add_Address/viewmodel/add_address_view_model.dart';
import 'package:loza_mobile/presentation/checkout/viewmodel/checkout_viewmodel.dart';
import 'package:loza_mobile/presentation/favourite/viewmodel/favourite_viewmodel.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:loza_mobile/presentation/order/viewmodel/order_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/add_details_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/product_details_viewmodel.dart';
import 'package:loza_mobile/presentation/rating/viewmodel/rating_viewmodel.dart';
import 'package:loza_mobile/presentation/register/viewmodel/register_viewmodel.dart';
import 'package:loza_mobile/presentation/review/viewmodel/review_viewmodel.dart';
import 'package:loza_mobile/presentation/shopping_cart/viewmodel/shopping_cart_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/dio_factory.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository

  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
            () => RegisterViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<PostFavoriteUseCase>(() => PostFavoriteUseCase(instance()));
    instance.registerFactory<ProductDetailsUseCase>(() => ProductDetailsUseCase(instance()));
    instance.registerFactory<HomeLayoutViewModel>(() => HomeLayoutViewModel(instance(), instance(),instance()));
  }
}

initProductDetailsModule() {
  if (!GetIt.I.isRegistered<PostToCartUseCase>()) {
    instance.registerFactory<PostToCartUseCase>(() => PostToCartUseCase(instance()));
    instance.registerFactory<AddDetailsViewModel>(() => AddDetailsViewModel(instance()));
    instance.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel());
  }
}

initShoppingCartModule() {
  if (!GetIt.I.isRegistered<CartUseCase>()) {
    instance.registerFactory<CartUseCase>(() => CartUseCase(instance()));
    instance.registerFactory<ShoppingCartViewModel>(() => ShoppingCartViewModel(instance()));
  }
}

initAddAddressModule() {
  if (!GetIt.I.isRegistered<AddAddressUseCase>()) {
    instance.registerFactory<AddAddressUseCase>(() => AddAddressUseCase(instance()));
    instance.registerFactory<AddAddressViewModel>(() => AddAddressViewModel(instance()));
  }
}

initGetAddressModule() {
  if (!GetIt.I.isRegistered<GetAddressUseCase>()) {
    instance.registerFactory<GetAddressUseCase>(() => GetAddressUseCase(instance()));
    instance.registerFactory<CheckOutUseCase>(() => CheckOutUseCase(instance()));
    instance.registerFactory<CheckOutViewModel>(() => CheckOutViewModel(instance(),instance()));
  }
}

initGetFavouriteModule() {
  if (!GetIt.I.isRegistered<GetFavouriteUseCase>()) {
    instance.registerFactory<GetFavouriteUseCase>(() => GetFavouriteUseCase(instance()));
    instance.registerFactory<FavouriteViewModel>(() => FavouriteViewModel(instance(),instance()));
  }
}

initAddReviewModule() {
  if (!GetIt.I.isRegistered<PostRatingUseCase>()) {
    instance.registerFactory<PostRatingUseCase>(() => PostRatingUseCase(instance()));
    instance.registerFactory<AddReviewViewModel>(() => AddReviewViewModel(instance()));
  }
}

initGetReviewModule() {
  if (!GetIt.I.isRegistered<GetReviewsUseCase>()) {
    instance.registerFactory<GetReviewsUseCase>(() => GetReviewsUseCase(instance()));
    instance.registerFactory<ReviewViewModel>(() => ReviewViewModel(instance()));
  }
}

initGetOrderModule() {
  if (!GetIt.I.isRegistered<GetOrdersUseCase>()) {
    instance.registerFactory<GetOrdersUseCase>(() => GetOrdersUseCase(instance()));
    instance.registerFactory<GetOrdersDetailsUseCase>(() => GetOrdersDetailsUseCase(instance()));
    instance.registerFactory<OrderViewModel>(() => OrderViewModel(instance(),instance()));
  }
}