import 'dart:async';
import 'package:flutter/material.dart';

import 'package:loza_mobile/presentation/filters/view/multi_select_view.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';

class FiltersViewModel extends   FiltersViewModelInputs with FiltersViewModelOutputs{

  final StreamController _rangeValuesStreamController = StreamController<RangeValues>();
  final StreamController _selectedBrandsStreamController =  StreamController<List<String>>();
  final StreamController _selectedCategoriesStreamController =  StreamController<List<String>>();
  final StreamController _selectedColorStreamController =  StreamController<int>();

  static const double min = 0;
  static const double max = 1000;

  RangeValues rangeValues = const RangeValues(min, max);

  final List<String> brands = ['Hooker', 'Aspen'];

  int isSelected = -1;

  final List<String> categories = [
    AppStrings.decoration,
    AppStrings.ceiling,
    AppStrings.floor,
    AppStrings.furniture,
    AppStrings.lamps,
    AppStrings.wooden,
  ];

  List<String> selectedBrands = [];

  List<String> selectedCategories = [];

  List<Color> colors = [
    ColorManager.black,
    ColorManager.blue,
    ColorManager.orange,
    ColorManager.red,
    ColorManager.moderateBlue,
    ColorManager.softBlue,
    ColorManager.lightGrey
  ];

  @override
  void dispose() {
    _rangeValuesStreamController.close();
    _selectedBrandsStreamController.close();
    _selectedCategoriesStreamController.close();
    _selectedColorStreamController.close();
  }

  @override
  void start() {
    inputRangeValues.add(rangeValues);
    inputSelectedBrands.add(selectedBrands);
    inputSelectedCategories.add(selectedCategories);
    inputSelectedColor.add(isSelected);
  }

  @override
  void onRangeChange(RangeValues rangeVal) {
    rangeValues = rangeVal;
    inputRangeValues.add(rangeValues);
  }

  @override
  void showSelectedBrand(BuildContext context, List<String> items) async {

    final List<String>? results = await showDialog(
      context: context,
      builder: (context) {
        return MultiSelect(items: items);
      },
    );

    _brandsCheck(results);
  }

  @override
  void showSelectedCategories(BuildContext context, List<String> items) async {

    final List<String>? results = await showDialog(
      context: context,
      builder: (context) {
        return MultiSelect(items: items);
      },
    );

    _categoriesCheck(results);
  }

  @override
  void changeColor(int index){
    isSelected = index;
    inputSelectedColor.add(isSelected);
  }

  @override
  Sink get inputRangeValues => _rangeValuesStreamController.sink;

  @override
  Sink get inputSelectedBrands => _selectedBrandsStreamController.sink;

  @override
  Sink get inputSelectedCategories => _selectedCategoriesStreamController.sink;

  @override
  Sink get inputSelectedColor => _selectedColorStreamController.sink;

  @override
  Stream<RangeValues> get outPutRangeValue => _rangeValuesStreamController.stream.map((rangeValues) => rangeValues);

  @override
  Stream<List<String>> get outPutSelectedBrands => _selectedBrandsStreamController.stream.map((selectedBrands) => selectedBrands);

  @override
  Stream<List<String>> get outPutSelectedCategories => _selectedCategoriesStreamController.stream.map((selectedCategories) => selectedCategories);

  @override
  Stream<int> get outPutSelectedColor => _selectedColorStreamController.stream.map((selectedColor) => selectedColor);

  void _brandsCheck(List<String>? results){
    if (results != null) {
      selectedBrands = results;
      inputSelectedBrands.add(selectedBrands);
    }
  }

  void _categoriesCheck(List<String>? results){
    if (results != null) {
      selectedCategories = results;
      inputSelectedCategories.add(selectedCategories);
    }
  }
}

abstract class FiltersViewModelInputs{

  void onRangeChange(RangeValues rangeVal);

  void showSelectedBrand(BuildContext context, List<String> items);

  void showSelectedCategories(BuildContext context, List<String> items);

  void changeColor(int index);

  Sink get inputRangeValues;

  Sink get inputSelectedBrands;

  Sink get inputSelectedCategories;

  Sink get inputSelectedColor;
}

abstract class FiltersViewModelOutputs{

  Stream<RangeValues> get outPutRangeValue;

  Stream<List<String>> get outPutSelectedBrands;

  Stream<List<String>> get outPutSelectedCategories;

  Stream<int> get outPutSelectedColor;
}