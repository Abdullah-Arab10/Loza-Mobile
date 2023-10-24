import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/home_usecase.dart';
import 'package:loza_mobile/domain/usecase/product_details&cart_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomeLayoutViewModel extends BaseViewModel
    with HomeLayoutViewModelInputs, HomeLayoutViewModelOutputs {
  final _dataStreamController = BehaviorSubject<HomeViewObject>();
  final _favoriteStreamController = BehaviorSubject<Map<int, bool>>();
  final productDetailsStreamController = BehaviorSubject<Product>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final ProductDetailsUseCase _productDetailsUseCase;
  final HomeUseCase _homeUseCase;
  final PostFavoriteUseCase _postFavoriteUseCase;

  HomeLayoutViewModel(this._homeUseCase, this._postFavoriteUseCase,
      this._productDetailsUseCase);

  List<String> drawer = [
    'Home',
    'New collections',
    'Editor\'s Picks',
    'Top Deals',
    'Notifications',
    'Settings',
  ];

  List<String> icons = [
    ImageAssets.home,
    ImageAssets.newCollections,
    ImageAssets.editorsPicks,
    ImageAssets.topDeals,
    ImageAssets.notifications,
    ImageAssets.settings,
  ];

  Map<int, bool> favorites = {};

  @override
  void dispose() {
    _dataStreamController.close();
    _favoriteStreamController.close();
    productDetailsStreamController.close();
  }

  @override
  void start([int? num]) {
    getNewestData();
  }

  @override
  getNewestData() async {
    int id = Extensions.extractIdFromToken();
    (await _homeUseCase.execute(id)).fold((failure) {}, (homeObject) {
      inputHomeData.add(HomeViewObject(
          homeObject.dataResponse.newest,
          homeObject.dataResponse.shuffel,
          homeObject.dataResponse.top5sales
      ));
      for (var element in homeObject.dataResponse.newest) {
        favorites.addAll({
          element['id']: element['isFavorite'],
        });
      }
      inputFavoriteData.add(favorites);
    });
  }

  @override
  getProductDetails(int productId) async {
    (await _productDetailsUseCase.execute(productId)).fold((failure) {},
            (homeObject) {
          productDetailsStreamController.add(Product(
            homeObject.dataResponse.id,
            homeObject.dataResponse.name,
            homeObject.dataResponse.description,
            homeObject.dataResponse.price,
            homeObject.dataResponse.category,
            homeObject.dataResponse.color,
            homeObject.dataResponse.colorNo,
            homeObject.dataResponse.quantity,
            homeObject.dataResponse.productImage,
            homeObject.dataResponse.totalRate,
            homeObject.dataResponse.productDimensions,
            homeObject.dataResponse.photos,
          ));
        });
  }

  @override
  postFavorite(int productId) async {
    int id = Extensions.extractIdFromToken();
    favorites[productId] = !favorites[productId]!;
    inputFavoriteData.add(favorites);
    (await _postFavoriteUseCase
            .execute(FavoriteUseCaseInput(id, productId)))
        .fold((failure) {
      // inputFavoriteData.add(favorites);
    }, (success) {});
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  Sink get inputFavoriteData => _favoriteStreamController.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);

  @override
  Stream<Map<int, bool>> get outputFavoriteData =>
      _favoriteStreamController.stream.map((favMap) => favMap);

  changeLanguage(BuildContext context) {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

}

abstract class HomeLayoutViewModelInputs {
  Sink get inputHomeData;
  Sink get inputFavoriteData;
  getNewestData();
  getProductDetails(int productId);
  postFavorite(int productId);
  //void start2();
}

abstract class HomeLayoutViewModelOutputs {
  Stream<HomeViewObject> get outputHomeData;
  Stream<Map<int, bool>> get outputFavoriteData;
}

class HomeViewObject {
  List<Map<String, dynamic>> newest;

  List<Map<String, dynamic>> shuffel;

  List<Map<String, dynamic>> top5sales;

  HomeViewObject(this.newest,this.shuffel,this.top5sales);
}
