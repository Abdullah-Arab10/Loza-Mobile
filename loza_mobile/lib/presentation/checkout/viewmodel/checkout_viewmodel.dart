import 'dart:async';

import 'package:loza_mobile/domain/usecase/address_usecase.dart';
import 'package:loza_mobile/domain/usecase/checkout_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';
import 'package:rxdart/rxdart.dart';

class CheckOutViewModel extends BaseViewModel
    with CheckOutViewModelInputs, CheckOutViewModelOutputs {
  final _dataStreamController = BehaviorSubject<AddressViewObject>();
  final _selectedRadioStreamController = BehaviorSubject<int?>();
  final _paymentMethodSelectedRadioStreamController = BehaviorSubject<int?>();

  final CheckOutUseCase _checkOutUseCase;
  final GetAddressUseCase _getAddressUseCase;
  CheckOutViewModel(this._getAddressUseCase, this._checkOutUseCase);

  List<String> paymentMethods = [
    'WALLET',
    'CASH',
  ];

  List<String> paymentMethods2 = [
    'pay with wallet',
    'pay cash',
  ];

  int? _selectedRadio = 0;
  int? _paymentMethodSelectedRadio = 0;

  @override
  void dispose() {
    _dataStreamController.close();
    _selectedRadioStreamController.close();
    _paymentMethodSelectedRadioStreamController.close();
  }

  @override
  void start([int? num]) {
    inputSelectedRadio.add(_selectedRadio);
    inputPaymentMethodSelectedRadio.add(_paymentMethodSelectedRadio);
    getAddress();
  }

  @override
  getAddress() async {
    int id = Extensions.extractIdFromToken();
    (await _getAddressUseCase.execute(id)).fold((failure) {}, (data) {
      inputAddressData.add(AddressViewObject(data.dataResponse.addresses));
    });
  }

  @override
  addOrder(
    int paymentmethod,
    int addressid,
    double total,
  ) async {
    int id = Extensions.extractIdFromToken();
    (await _checkOutUseCase.execute(
            CheckOutUseCaseInput(id, paymentmethod, addressid, total)))
        .fold((failure) {}, (data) {});
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
  Sink get inputAddressData => _dataStreamController.sink;

  @override
  Sink get inputSelectedRadio => _selectedRadioStreamController.sink;

  @override
  Sink get inputPaymentMethodSelectedRadio =>
      _paymentMethodSelectedRadioStreamController.sink;

  @override
  Stream<AddressViewObject> get outputAddressData =>
      _dataStreamController.stream.map((data) => data);

  @override
  Stream<int?> get outputSelectedRadio => _selectedRadioStreamController.stream
      .map((selectedRadio) => selectedRadio);

  @override
  Stream<int?> get outputPaymentMethodSelectedRadio =>
      _paymentMethodSelectedRadioStreamController.stream
          .map((selectedRadio) => selectedRadio);
}

abstract class CheckOutViewModelInputs {
  Sink get inputAddressData;
  Sink get inputSelectedRadio;
  Sink get inputPaymentMethodSelectedRadio;
  void onChangeSelectedRadio(int? val);
  void onChangePaymentMethodSelectedRadio(int? val);
  getAddress();
  addOrder(
    int paymentmethod,
    int addressid,
      double total,
  );
}

abstract class CheckOutViewModelOutputs {
  Stream<AddressViewObject> get outputAddressData;
  Stream<int?> get outputSelectedRadio;
  Stream<int?> get outputPaymentMethodSelectedRadio;
}

class AddressViewObject {
  List<Map<String, dynamic>> addresses;

  AddressViewObject(this.addresses);
}
