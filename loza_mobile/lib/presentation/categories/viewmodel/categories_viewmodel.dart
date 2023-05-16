import 'dart:async';

import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/base/base_view_model.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';

class CategoriesViewModel extends BaseViewModel
    with CategoriesViewModelInputs, CategoriesViewModelOutputs {

  final StreamController _categoryObjectStreamController = StreamController< List<CategoriesObject>>();

  late final List<CategoriesObject> _list;

  @override
  void dispose() {
    _categoryObjectStreamController.close();
  }

  @override
  void start() {
    _list = _getCategoriesObject();
    _postDataToView();
  }

  @override
  Sink get inputCategoriesObject => _categoryObjectStreamController.sink;

  @override
  Stream< List<CategoriesObject>> get outputCategoriesObject => _categoryObjectStreamController.stream.map((categoryObject) => categoryObject);

  void _postDataToView(){
    inputCategoriesObject.add(
        _list
    );
  }

  List<CategoriesObject> _getCategoriesObject() => [
    CategoriesObject(true,ImageAssets.decoration, AppStrings.decoration, '827 items'),
    CategoriesObject(true,ImageAssets.ceiling, AppStrings.ceiling, '827 items'),
    CategoriesObject(true,ImageAssets.floor, AppStrings.floor, '827 items'),
    CategoriesObject(true,ImageAssets.furniture, AppStrings.furniture, '827 items'),
    CategoriesObject(true,ImageAssets.lamps, AppStrings.lamps, '827 items'),
    CategoriesObject(true,ImageAssets.wooden, AppStrings.wooden, '827 items'),
  ];
}

abstract class CategoriesViewModelInputs {

  Sink get inputCategoriesObject;
}

abstract class CategoriesViewModelOutputs {

  Stream< List<CategoriesObject>> get outputCategoriesObject;
}
