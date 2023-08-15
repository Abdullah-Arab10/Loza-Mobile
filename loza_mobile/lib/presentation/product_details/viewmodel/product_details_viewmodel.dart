import 'package:flutter/material.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/usecase/product_details&cart_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/view/add_details_view.dart';

class ProductDetailsViewModel extends BaseViewModel
    with ProductDetailsViewModelInputs, ProductDetailsViewModelOutputs {
  final PostToCartUseCase _postToCartUseCase;

  ProductDetailsViewModel(this._postToCartUseCase);

  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void showAdditionalDetails(String name, int userId, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AddDetailsView(name: name, userId: userId,);
      },
    );
  }

  @override
  postToCart(PostToCartObject postToCartObject) async {
    (await _postToCartUseCase.execute(PostToCartUseCaseInput(
            postToCartObject.userId,
            postToCartObject.name,
            postToCartObject.color,
            postToCartObject.colorno,
            postToCartObject.quan)))
        .fold((failure) {}, (data) {});
  }
}

abstract class ProductDetailsViewModelInputs {
  void showAdditionalDetails(String name, int userId, BuildContext context);
  postToCart(PostToCartObject postToCartObject);
}

abstract class ProductDetailsViewModelOutputs {}

class PostToCartObject {
  int userId;
  String name;
  String color;
  int colorno;
  int quan;

  PostToCartObject(this.userId, this.name, this.color, this.colorno, this.quan);
}
