import 'package:loza_mobile/presentation/base/base_view_model.dart';

class MyAccountViewModel extends BaseViewModel
    with MyAccountViewModelInputs, MyAccountViewModelOutputs {

  List<String> profile = [
    'Wishlist',
    'My Orders',
    'Payment Method',
    'Delivery Address',
    'Gift cards & vouchers',
    'Contact Preferences',
  ];

  @override
  void dispose() {

  }

  @override
  void start() {

  }
}

abstract class MyAccountViewModelInputs {}

abstract class MyAccountViewModelOutputs {}
