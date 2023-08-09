import 'dart:async';

import 'package:flutter/material.dart';

import 'package:loza_mobile/presentation/resources/colors_manager.dart';

class AddDetailsViewModel extends
     AddDetailsViewModelInputs with AddDetailsViewModelOutputs {

  final StreamController _quantityStreamController = StreamController<int>();
  final StreamController _changeColorStreamController = StreamController<String?>();

  List<Color> colors = [
    ColorManager.black,
    ColorManager.blue,
    ColorManager.orange,
    ColorManager.red,
    ColorManager.moderateBlue,
    ColorManager.softBlue,
    ColorManager.lightGrey
  ];

  List<String> nameOfColors = [
    'black',
    'blue',
    'orange',
    'red',
    'moderate blue',
    'soft blue',
    'light grey',
  ];

  String? nameOfColor;

  @override
  void dispose() {
    _quantityStreamController.close();
    _changeColorStreamController.close();
  }

  @override
  void start() {
    inputsQuantity.add(1);
    inputsChangeColor.add(nameOfColor);
  }

  @override
  void remove(int quantity) {
    if(quantity > 1){
      quantity --;
      inputsQuantity.add(quantity);
    }
  }

  @override
  void add(int quantity) {
    if(quantity < 5){
      quantity ++;
      inputsQuantity.add(quantity);
    }
  }

  @override
  void changeColor(String? color) {
    nameOfColor = color;
    inputsChangeColor.add(nameOfColor);
  }

  @override
  Sink get inputsQuantity => _quantityStreamController.sink;

  @override
  Sink get inputsChangeColor => _changeColorStreamController.sink;

  @override
  Stream<int> get outputsQuantity => _quantityStreamController.stream.map((quantity) => quantity);

  @override
  Stream<String?> get outputsChangeColor => _changeColorStreamController.stream.map((nameOfColor) => nameOfColor);

  int valueOfColor(String? color){
    switch(color){
      case 'black':
        return ColorManager.black.value;
      case 'blue':
        return ColorManager.blue.value;
      case 'orange':
        return ColorManager.orange.value;
      case 'red':
        return ColorManager.red.value;
      case 'moderate blue':
        return ColorManager.moderateBlue.value;
      case 'soft blue':
        return ColorManager.softBlue.value;
      case 'light grey':
        return ColorManager.lightGrey.value;
      default:
        return ColorManager.black.value;
    }
  }
}

abstract class AddDetailsViewModelInputs {

  void remove(int quantity);
  void add(int quantity);
  void changeColor(String? color);

  Sink get inputsQuantity;
  Sink get inputsChangeColor;

}

abstract class AddDetailsViewModelOutputs {

  Stream<int> get outputsQuantity;
  Stream<String?> get outputsChangeColor;
}
