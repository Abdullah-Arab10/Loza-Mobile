import 'package:loza_mobile/domain/usecase/favourite_usecase.dart';
import 'package:loza_mobile/domain/usecase/home_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';
import 'package:rxdart/rxdart.dart';

class FavouriteViewModel extends BaseViewModel
    with FavouriteViewModelInputs, FavouriteViewModelOutputs {

  final _favouriteStreamController = BehaviorSubject<FavouriteViewObject>();

  final GetFavouriteUseCase _favouriteUseCase;
  final PostFavoriteUseCase _postFavoriteUseCase;
  FavouriteViewModel(this._favouriteUseCase,this._postFavoriteUseCase);

  @override
  void dispose() {
    _favouriteStreamController.close();

  }

  @override
  void start() {
    int id = Extensions.extractIdFromToken();
    getFromFavourite(id);
  }

  @override
  getFromFavourite(int userId) async{
    (await _favouriteUseCase.execute(userId)).fold((failure) {}, (favouriteObject) {
      inputFavouriteData.add(FavouriteViewObject(favouriteObject.dataResponse.favoriteList));
    });
  }

  @override
  postFavorite(int productId) async {
    int id = Extensions.extractIdFromToken();
    (await _postFavoriteUseCase
        .execute(FavoriteUseCaseInput(id, productId)))
        .fold((failure) {}, (success) {
      getFromFavourite(id);
    });
  }

  @override
  Sink get inputFavouriteData => _favouriteStreamController.sink;

  @override
  Stream<FavouriteViewObject> get outputFavouriteData =>
      _favouriteStreamController.stream.map((data) => data);

}

abstract class FavouriteViewModelInputs {

  Sink get inputFavouriteData;
  getFromFavourite(int userId);
  postFavorite(int productId);
}

abstract class FavouriteViewModelOutputs {
  Stream<FavouriteViewObject> get outputFavouriteData;
}

class FavouriteViewObject {
  List<Map<String, dynamic>> userFavourite;

  FavouriteViewObject(this.userFavourite);
}