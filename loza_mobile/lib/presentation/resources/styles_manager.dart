import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// book style

TextStyle getBookStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.book, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// black style

TextStyle getBlackStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}

// heavy style

TextStyle getHeavyStyle(
    {double fontSize = FontSize.fs12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.heavy, color);
}
