import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loza_mobile/app/functions.dart';
import 'package:loza_mobile/domain/usecase/register_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';

import 'package:loza_mobile/presentation/common/freezed/freezed_data_classes.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';

class RegisterViewModel extends BaseViewModel with RegisterViewModelInput
    , RegisterViewModelOutput {
  StreamController firstNameStreamController =
      StreamController<String>.broadcast();
  StreamController lastNameStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController phoneNumberStreamController =
      StreamController<String>.broadcast();
  StreamController addressStreamController =
      StreamController<String>.broadcast();
  StreamController dateOfBirthStreamController =
      StreamController<String>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  StreamController isUserRegisteredInSuccessfullyStreamController =
      StreamController<bool>();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "", "");

  RegisterViewModel(this._registerUseCase);

  // inputs
  @override
  void start() {}

  @override
  void dispose() {
    firstNameStreamController.close();
    lastNameStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    phoneNumberStreamController.close();
    addressStreamController.close();
    dateOfBirthStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputFirstName => firstNameStreamController.sink;

  @override
  Sink get inputLastName => lastNameStreamController.sink;

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputPhoneNumber => phoneNumberStreamController.sink;

  @override
  Sink get inputAddress => addressStreamController.sink;

  @override
  Sink get inputDateOfBirth => dateOfBirthStreamController.sink;

  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  register() async {
    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.firstName,
            registerObject.lastName,
            registerObject.email,
            registerObject.password,
            registerObject.phoneNumber,
            registerObject.address,
            registerObject.dateOfBirth)))
        .fold((failure) {
          isUserRegisteredInSuccessfullyStreamController.add(false);
    }, (data) {
      isUserRegisteredInSuccessfullyStreamController.add(true);
    });
  }

  @override
  setFirstName(String firstName) {
    inputFirstName.add(firstName);
    if (_isFirstNameValid(firstName)) {
      //  update register view object
      registerObject = registerObject.copyWith(firstName: firstName);
    } else {
      // reset username value in register view object
      registerObject = registerObject.copyWith(firstName: "");
    }
    validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (_isEmailValid(email)) {
      //  update register view object
      registerObject = registerObject.copyWith(email: email);
    } else {
      // reset email value in register view object
      registerObject = registerObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setLastName(String lastName) {
    inputLastName.add(lastName);
    if (_isLastNameValid(lastName)) {
      //  update register view object
      registerObject = registerObject.copyWith(lastName: lastName);
    } else {
      // reset lastName value in register view object
      registerObject = registerObject.copyWith(lastName: "");
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      //  update register view object
      registerObject = registerObject.copyWith(password: password);
    } else {
      // reset password value in register view object
      registerObject = registerObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setPhoneNumber(String phoneNumber) {
    inputPhoneNumber.add(phoneNumber);
    if (_isPhoneNumberValid(phoneNumber)) {
      //  update register view object
      registerObject = registerObject.copyWith(phoneNumber: phoneNumber);
    } else {
      // reset phoneNumber value in register view object
      registerObject = registerObject.copyWith(phoneNumber: "");
    }
    validate();
  }

  @override
  setAddress(String address) {
    inputAddress.add(address);
    if (_isAddressValid(address)) {
      //  update register view object
      registerObject = registerObject.copyWith(address: address);
    } else {
      // reset address value in register view object
      registerObject = registerObject.copyWith(address: "");
    }
    validate();
  }

  @override
  setDateOfBirth(String dateOfBirth) {
    inputDateOfBirth.add(dateOfBirth);
    if (_isDateOfBirthValid(dateOfBirth)) {
      //  update register view object
      registerObject = registerObject.copyWith(dateOfBirth: dateOfBirth);
    } else {
      // reset dateOfBirth value in register view object
      registerObject = registerObject.copyWith(dateOfBirth: "");
    }
    validate();
  }

  // -- outputs

  @override
  Stream<bool> get outputIsFirstNameValid => firstNameStreamController.stream
      .map((firstName) => _isFirstNameValid(firstName));

  @override
  Stream<String?> get outputErrorFirstName => outputIsFirstNameValid.map(
      (isFirstName) => isFirstName ? null : AppStrings.invalidFirstName.tr());

  @override
  Stream<bool> get outputIsEmailValid =>
      emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.emailError.tr());

  @override
  Stream<bool> get outputIsLastNameValid => lastNameStreamController.stream
      .map((lastName) => _isLastNameValid(lastName));

  @override
  Stream<String?> get outputErrorLastName =>
      outputIsLastNameValid.map((isLastNameValid) =>
          isLastNameValid ? null : AppStrings.invalidLastName.tr());

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword =>
      outputIsPasswordValid.map((isPasswordValid) => isPasswordValid
          ? null
          : '${AppStrings.passwordError1.tr()}\n${AppStrings.passwordError2.tr()}');

  @override
  Stream<bool> get outputPhoneNumber => phoneNumberStreamController.stream
      .map((phoneNumber) => _isPhoneNumberValid(phoneNumber));

  @override
  Stream<String?> get outputErrorPhoneNumber =>
      outputPhoneNumber.map((isPhoneNumberValid) => isPhoneNumberValid
          ? null
          : '${AppStrings.invalidPhoneNumber.tr()}\n${AppStrings.characters.tr()}');

  @override
  Stream<bool> get outputAddress =>
      addressStreamController.stream.map((address) => _isAddressValid(address));

  @override
  Stream<String?> get outputErrorAddress =>
      outputAddress.map((isAddressValid) =>
          isAddressValid ? null : AppStrings.invalidAddress.tr());

  @override
  Stream<bool> get outputDateOfBirth => dateOfBirthStreamController.stream
      .map((dateOfBirth) => _isDateOfBirthValid(dateOfBirth));

  @override
  Stream<String?> get outputErrorDateOfBirth =>
      outputDateOfBirth.map((isDateOfBirthValid) =>
          isDateOfBirthValid ? null : AppStrings.invalidDateOfBirth.tr());

  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  // --  private functions

  bool _isFirstNameValid(String firstName) {
    return firstName.length >= 3;
  }

  bool _isLastNameValid(String lastName) {
    return lastName.length >= 3;
  }

  bool _isPasswordValid(String password) {
    if (password.isNotEmpty &&
        password.length >= 6 &&
        isDigitPasswordValid(password) &&
        isSymbolPasswordValid(password) &&
        isUpperCasePasswordValid(password) &&
        isLowerCasePasswordValid(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isEmailValid(String email) {
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isPhoneNumberValid(String phoneNumber) {
    return phoneNumber.length >= 10 && phoneNumber.isNotEmpty;
  }

  bool _isAddressValid(String address) {
    return address.length >= 5 && address.isNotEmpty;
  }

  bool _isDateOfBirthValid(String dateOfBirth) {
    return dateOfBirth.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return registerObject.lastName.isNotEmpty &&
        registerObject.firstName.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.phoneNumber.isNotEmpty &&
        registerObject.address.isNotEmpty &&
        registerObject.dateOfBirth.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputFirstName;

  Sink get inputLastName;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputPhoneNumber;

  Sink get inputAddress;

  Sink get inputDateOfBirth;

  Sink get inputAllInputsValid;

  register();

  setFirstName(String firstName);

  setLastName(String lastName);

  setEmail(String email);

  setPassword(String password);

  setPhoneNumber(String phoneNumber);

  setAddress(String address);

  setDateOfBirth(String dateOfBirth);
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsFirstNameValid;

  Stream<String?> get outputErrorFirstName;

  Stream<bool> get outputIsLastNameValid;

  Stream<String?> get outputErrorLastName;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<bool> get outputPhoneNumber;

  Stream<String?> get outputErrorPhoneNumber;

  Stream<bool> get outputAddress;

  Stream<String?> get outputErrorAddress;

  Stream<bool> get outputDateOfBirth;

  Stream<String?> get outputErrorDateOfBirth;

  Stream<bool> get outputAreAllInputsValid;
}
