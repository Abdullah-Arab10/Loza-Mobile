import 'package:loza_mobile/presentation/base/base_view_model.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';

class HomeLayoutViewModel extends BaseViewModel
    with HomeLayoutViewModelInputs, HomeLayoutViewModelOutputs {

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
  void start() {}
}

class HomeLayoutViewModelInputs {}

class HomeLayoutViewModelOutputs {}
