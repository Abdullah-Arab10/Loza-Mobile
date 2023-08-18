import 'dart:async';
import 'package:loza_mobile/domain/usecase/address_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/common/freezed/freezed_data_classes.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';

class AddAddressViewModel extends BaseViewModel
    with AddAddressViewModelInputs, AddAddressViewModelOutputs {
  final StreamController _addressNameStreamController =
  StreamController<String>.broadcast();
  final StreamController _locationStreamController =
  StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();
  StreamController isAddAddressSuccessfullyStreamController =
  StreamController<bool>();

  var addAddressObject = AddAddressObject("", "");

  final AddAddressUseCase _addAddressUseCase;
  AddAddressViewModel(this._addAddressUseCase);

  // inputs
  @override
  void dispose() {
    _addressNameStreamController.close();
    _locationStreamController.close();
    _areAllInputsValidStreamController.close();
    isAddAddressSuccessfullyStreamController.close();
  }



  @override
  setLocation(String location) {
    inputsLocation.add(location);
    addAddressObject = addAddressObject.copyWith(location: location);
    inputsAreAllDataValid.add(null);
  }

  @override
  setAddressName(String addressName) {
    inputsAddressName.add(addressName);
    addAddressObject = addAddressObject.copyWith(addressName: addressName);
    inputsAreAllDataValid.add(null);
  }

  @override
  addAddress() async {
    int id = Extensions.extractIdFromToken();
    (await _addAddressUseCase.execute(
        AddAddressUseCaseInput(id, addAddressObject.addressName, addAddressObject.location)))
        .fold((failure) {}, (data) {
      isAddAddressSuccessfullyStreamController.add(true);
    });
  }

  @override
  Sink get inputsLocation => _locationStreamController.sink;

  @override
  Sink get inputsAddressName => _addressNameStreamController.sink;

  @override
  Sink get inputsAreAllDataValid => _areAllInputsValidStreamController.sink;

  // outputs
  @override
  Stream<bool> get outputsLocationValid => _locationStreamController.stream
      .map((location) => _isLocationValid(location));

  @override
  Stream<bool> get outputsAddressNameValid =>
      _addressNameStreamController.stream.map((addressName) => _isAddressNameValid(addressName));

  @override
  Stream<bool> get outputsAreAllDataValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  // private
  bool _isLocationValid(String location) {
    if (location.isNotEmpty &&
        location.length >= 4 ) {
      return true;
    } else {
      return false;
    }
  }

  bool _isAddressNameValid(String addressName) {
    if (addressName.isNotEmpty &&
        addressName.length >= 4) {
      return true;
    } else {
      return false;
    }
  }

  bool _areAllInputsValid() {
    return _isLocationValid(addAddressObject.location) &&
        _isAddressNameValid(addAddressObject.addressName);
  }

  @override
  void start([int? num]) {

  }
}

abstract class AddAddressViewModelInputs {
  setAddressName(String addressName);
  setLocation(String location);
  addAddress();

  Sink get inputsAddressName;
  Sink get inputsLocation;
  Sink get inputsAreAllDataValid;
}

abstract class AddAddressViewModelOutputs {
  Stream<bool> get outputsAddressNameValid;
  Stream<bool> get outputsLocationValid;
  Stream<bool> get outputsAreAllDataValid;
}
