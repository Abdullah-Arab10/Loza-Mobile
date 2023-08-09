

class MyAccountViewModel extends
     MyAccountViewModelInputs with MyAccountViewModelOutputs {

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
