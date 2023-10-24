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

  List<Map<String, dynamic>> shuffel;

  List<Map<String, dynamic>> top5sales;

  HomeData(this.newest,this.shuffel,this.top5sales);
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

  int colorNo;

  double quantity;

  String productImage;

  double totalRate;

  String productDimensions;

  List<Map<String, dynamic>> photos;

  Product(
      this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.color,
      this.colorNo,
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

class AddressData {
  List<Map<String, dynamic>> addresses;

  AddressData(this.addresses);
}

class AddressObject {
  int statusCode;
  bool isError;
  AddressData dataResponse;
  Error? error;

  AddressObject(this.statusCode, this.isError, this.dataResponse, this.error);
}

class FavouriteData {
  List<Map<String, dynamic>> favoriteList;

  FavouriteData(this.favoriteList);
}

class FavouriteObject {
  int statusCode;
  bool isError;
  FavouriteData dataResponse;
  Error? error;

  FavouriteObject(this.statusCode, this.isError, this.dataResponse, this.error);
}

class ReviewsData {
  List<Map<String, dynamic>> allReviews;

  ReviewsData(this.allReviews);
}

class ReviewsObject {
  int statusCode;
  bool isError;
  ReviewsData dataResponse;
  Error? error;

  ReviewsObject(this.statusCode, this.isError, this.dataResponse, this.error);
}

class OrdersData {
  List<Map<String, dynamic>> allOrders;

  OrdersData(this.allOrders);
}

class OrdersObject {
  int statusCode;
  bool isError;
  OrdersData dataResponse;
  Error? error;

  OrdersObject(this.statusCode, this.isError, this.dataResponse, this.error);
}

class Order {

  int number;

  String shippingadress;

  int paymentmethod;

  String orderdate;

  bool isDelivered;

  double totalCheck;

  List<Map<String, dynamic>> products;

  Order(
      this.number,
      this.shippingadress,
      this.paymentmethod,
      this.orderdate,
      this.isDelivered,
      this.totalCheck,
      this.products
      );
}

class OrderDetails{

  int statusCode;

  bool isError;

  Order data;

  Error? error;

  OrderDetails(this.statusCode,this.isError,this.data,this.error);

}

class NotDeliveredOrdersData {
  List<Map<String, dynamic>> allOrders;

  NotDeliveredOrdersData(this.allOrders);
}

class NotDeliveredOrders {
  int statusCode;
  bool isError;
  NotDeliveredOrdersData data;
  Error? error;

  NotDeliveredOrders(this.statusCode, this.isError, this.data, this.error);
}

class DeliveryMan {

  int number;

  String shippingadress;

  int paymentmethod;

  String orderdate;

  bool isDelivered;

  String phonenumber;

  String username;

  double totalCheck;

  List<Map<String, dynamic>> products;

  DeliveryMan(
      this.number,
      this.shippingadress,
      this.paymentmethod,
      this.orderdate,
      this.isDelivered,
      this.phonenumber,
      this.username,
      this.totalCheck,
      this.products
      );
}

class DeliveryManDetails{

  int statusCode;

  bool isError;

  DeliveryMan data;

  Error? error;

  DeliveryManDetails(this.statusCode,this.isError,this.data,this.error);

}