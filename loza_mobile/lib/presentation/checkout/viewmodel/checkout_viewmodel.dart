import 'dart:async';

import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class CheckOutViewModel extends BaseViewModel
    with CheckOutViewModelInputs, CheckOutViewModelOutputs {
  final _selectedRadioStreamController =
  BehaviorSubject<int?>();
  final _paymentMethodSelectedRadioStreamController =
  BehaviorSubject<int?>();

  List<String> paymentMethods = [
    'WALLET',
    'CASH',
  ];

  int? _selectedRadio = 0;
  int? _paymentMethodSelectedRadio = 0;

  @override
  void dispose() {
    _selectedRadioStreamController.close();
    _paymentMethodSelectedRadioStreamController.close();
  }

  @override
  void start([int? num]) {
    inputSelectedRadio.add(_selectedRadio);
    inputPaymentMethodSelectedRadio.add(_paymentMethodSelectedRadio);
  }

  @override
  void onChangeSelectedRadio(int? val) {
    _selectedRadio = val;
    inputSelectedRadio.add(_selectedRadio);
  }

  @override
  void onChangePaymentMethodSelectedRadio(int? val) {
    _paymentMethodSelectedRadio = val;
    inputPaymentMethodSelectedRadio.add(_paymentMethodSelectedRadio);
  }

  @override
  Sink get inputSelectedRadio => _selectedRadioStreamController.sink;

  @override
  Sink get inputPaymentMethodSelectedRadio => _paymentMethodSelectedRadioStreamController.sink;

  @override
  Stream<int?> get outputSelectedRadio => _selectedRadioStreamController.stream.map((selectedRadio) => selectedRadio);

  @override
  Stream<int?> get outputPaymentMethodSelectedRadio => _paymentMethodSelectedRadioStreamController.stream.map((selectedRadio) => selectedRadio);

}

abstract class CheckOutViewModelInputs {
  Sink get inputSelectedRadio;
  Sink get inputPaymentMethodSelectedRadio;
  void onChangeSelectedRadio(int? val);
  void onChangePaymentMethodSelectedRadio(int? val);
}

abstract class CheckOutViewModelOutputs {
  Stream<int?> get outputSelectedRadio;
  Stream<int?> get outputPaymentMethodSelectedRadio;
}
