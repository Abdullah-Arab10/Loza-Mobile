import 'package:flutter/material.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/view/add_details_view.dart';

class ProductDetailsViewModel extends BaseViewModel
    with ProductDetailsViewModelInputs, ProductDetailsViewModelOutputs {


  //ProductDetailsViewModel(this._postToCartUseCase);

  @override
  void dispose() {}

  @override
  void start([int? num]) {}

  @override
  void showAdditionalDetails(String name, int userId, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AddDetailsView(name: name, userId: userId,);
      },
    );
  }
}

abstract class ProductDetailsViewModelInputs {
  void showAdditionalDetails(String name, int userId, BuildContext context);
}

abstract class ProductDetailsViewModelOutputs {}

