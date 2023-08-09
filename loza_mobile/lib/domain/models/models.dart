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

  Authentication(this.statusCode,this.isError,this.data,this.error);
}

// Newest

class HomeData {
  List<Map<String, dynamic>> newest;

  HomeData(this.newest);
}

class HomeObject {

  int statusCode;
  bool isError;
  HomeData dataResponse;
  Error? error;

  HomeObject(this.statusCode,this.isError,this.dataResponse,this.error);
}

// Filters model

class FiltersObject{
  double min;
  double max;
  RangeValues rangeValues;

  FiltersObject(this.min,this.max,this.rangeValues);
}

// Shopping model

class ShoppingCartObject{

  String image;
  String text1;
  String text2;

  ShoppingCartObject(this.image,this.text1,this.text2);
}