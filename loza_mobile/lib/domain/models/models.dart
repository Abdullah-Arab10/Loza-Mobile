// categories model

import 'package:flutter/material.dart';

class CategoriesObject{
  bool isArrow;
  String imagePath;
  String text1;
  String text2;

  CategoriesObject(this.isArrow,this.imagePath,this.text1,this.text2);
}

// login models

class Data{
  String token;

  Data(this.token);
}

class Error{
  String message;

  Error(this.message);
}

class Authentication{
  int statusCode;
  bool isError;
  Data? data;
  Error? error;
  String totalCount;

  Authentication(this.statusCode,this.isError,this.data,this.error,this.totalCount);
}

// Filters model

class FiltersObject{
  double min;
  double max;
  RangeValues rangeValues;

  FiltersObject(this.min,this.max,this.rangeValues);
}