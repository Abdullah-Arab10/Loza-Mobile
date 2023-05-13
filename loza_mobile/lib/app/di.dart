import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/data/network/app_api.dart';
import 'package:loza_mobile/data/network/network_info.dart';
import 'package:loza_mobile/data/data_source/remote_data_source.dart';
import 'package:loza_mobile/data/repository/repository_impl.dart';
import 'package:loza_mobile/domain/repository/repository.dart';
import 'package:loza_mobile/domain/usecase/login_usecase.dart';
import 'package:loza_mobile/domain/usecase/register_usecase.dart';
import 'package:loza_mobile/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:loza_mobile/presentation/register/viewmodel/register_viewmodel.dart';
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

  // local data source
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

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