import 'dart:async';
import 'package:flutter/material.dart';


class MultiSelectViewModel extends   MultiSelectViewModelInputs with MultiSelectViewModelOutputs{

  final StreamController _isSelectedStreamController = StreamController<List<String>>();

  final List<String> multiSelectedItems = [];

  @override
  void dispose() {
    _isSelectedStreamController.close();
  }

  @override
  void start() {
    inputIsSelected.add(multiSelectedItems);
  }

  @override
  void itemChange(String itemValue, bool isSelected) {
    if (isSelected) {
      multiSelectedItems.add(itemValue);
      inputIsSelected.add(multiSelectedItems);
    } else {
      multiSelectedItems.remove(itemValue);
      inputIsSelected.add(multiSelectedItems);
    }
  }

  @override
  Sink get inputIsSelected => _isSelectedStreamController.sink;

  @override
  Stream<List<String>> get outPutIsSelected => _isSelectedStreamController.stream.map((isSelected) => isSelected);

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void submit(BuildContext context) {
    Navigator.pop(context, multiSelectedItems);
  }

}

abstract class MultiSelectViewModelInputs{

  void itemChange(String itemValue, bool isSelected);

  Sink get inputIsSelected;

}

abstract class MultiSelectViewModelOutputs{

  Stream<List<String>> get outPutIsSelected;

}