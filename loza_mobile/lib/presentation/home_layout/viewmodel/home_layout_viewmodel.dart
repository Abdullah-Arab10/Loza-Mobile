import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/home_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomeLayoutViewModel extends BaseViewModel
    with HomeLayoutViewModelInputs, HomeLayoutViewModelOutputs {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  final _dataStreamController = BehaviorSubject<HomeViewObject>();

  final HomeUseCase _homeUseCase;

  HomeLayoutViewModel(this._homeUseCase);

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
  @override
  void dispose() {}

  @override
  void start() {
    _getNewestData();
  }

  _getNewestData() async {
    //int id = extractIdFromToken();
    (await _homeUseCase.execute(4)).fold(
            (failure) => {

        }, (homeObject) {
      inputHomeData.add(HomeViewObject(homeObject.dataResponse.newest));
    });
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);

  int extractIdFromToken(){
    int id = 1;
    _appPreferences.getToken().then((value) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
      id = decodedToken['Id'];
    });
    return id;
  }
}

abstract class HomeLayoutViewModelInputs {
  Sink get inputHomeData;
}

abstract class HomeLayoutViewModelOutputs {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Map<String, dynamic>> newest;


  HomeViewObject(this.newest);
}