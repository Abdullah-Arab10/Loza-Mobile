import 'package:flutter/material.dart';

import 'package:loza_mobile/presentation/product_details/view/add_details_view.dart';

class ProductDetailsViewModel extends
     ProductDetailsViewModelInputs with ProductDetailsViewModelOutputs {

  @override
  void dispose() {}

  @override
  void start() {
    // createDataBase();
  }

  @override
  void showAdditionalDetails(BuildContext context) async {
     await showDialog(
      context: context,
      builder: (context) {
        return const AddDetailsView();
      },
    );
  }

}

abstract class ProductDetailsViewModelInputs {

  void showAdditionalDetails(BuildContext context);
}

abstract class ProductDetailsViewModelOutputs {}
