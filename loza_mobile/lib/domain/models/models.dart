// categories model

import 'package:flutter/material.dart';

class CategoriesObject {
  bool isArrow;
  String imagePath;
  String text1;
  String text2;

  CategoriesObject(this.isArrow, this.imagePath, this.text1, this.text2);
}

// login models

class Data {
  String token;

  Data(this.token);
}

class Error {
  String message;

  Error(this.message);
}

class Global {
  int statusCode;
  bool isError;
  Data? data;
  Error? error;

  Global(this.statusCode, this.isError, this.data, this.error);
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

  HomeObject(this.statusCode, this.isError, this.dataResponse, this.error);
}

// Filters model

class FiltersObject {
  double min;
  double max;
  RangeValues rangeValues;

  FiltersObject(this.min, this.max, this.rangeValues);
}

// Shopping model

class ShoppingCartObject {
  String image;
  String text1;
  String text2;

  ShoppingCartObject(this.image, this.text1, this.text2);
}

// ProductDetailsModel

class Product {
  int id;

  String name;

  String description;

  double price;

  int category;

  String color;

  double quantity;

  String productImage;

  String productDimensions;

  int totalRate;

  List<Map<String, dynamic>> photos;

  Product(
      this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.color,
      this.quantity,
      this.productImage,
      this.totalRate,
      this.productDimensions,
      this.photos);
}

class ProductDetails{

  int statusCode;

  bool isError;

  Product dataResponse;

  Error? errorResponse;

  ProductDetails(this.statusCode,this.isError,this.dataResponse,this.errorResponse);

}

// cart

class CartData {
  List<Map<String, dynamic>> userCart;

  CartData(this.userCart);
}

class CartObject {
  int statusCode;
  bool isError;
  CartData dataResponse;
  Error? error;

  CartObject(this.statusCode, this.isError, this.dataResponse, this.error);
}