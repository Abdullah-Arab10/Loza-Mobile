import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/app/functions.dart';
import 'package:loza_mobile/domain/usecase/login_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/common/freezed/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<int>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }


  @override
  void start() {}

  @override
  setPassword(String password) {
    inputsPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputsAreAllDataValid.add(null);
  }

  @override
  setUserName(String email) {
    inputsUserName.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputsAreAllDataValid.add(null);
  }

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.email, loginObject.password)))
        .fold((failure) {
          if(failure.statusCode == 400){
            isUserLoggedInSuccessfullyStreamController.add(2);
          }else if(failure.statusCode == 401){
            isUserLoggedInSuccessfullyStreamController.add(3);
          }else{
            isUserLoggedInSuccessfullyStreamController.add(4);
          }
    }, (data) {
      _appPreferences.setToken(data.data!.token);
      isUserLoggedInSuccessfullyStreamController.add(1);
    });
  }

  @override
  Sink get inputsPassword => _passwordStreamController.sink;

  @override
  Sink get inputsUserName => _emailStreamController.sink;

  @override
  Sink get inputsAreAllDataValid => _areAllInputsValidStreamController.sink;

  // outputs
  @override
  Stream<bool> get outputsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputsUserNameValid =>
      _emailStreamController.stream.map((email) => _isUserNameValid(email));

  @override
  Stream<bool> get outputsAreAllDataValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  // private
  bool _isPasswordValid(String password) {
    if (password.isNotEmpty &&
        password.length >= 6 &&
        isDigitPasswordValid(password) &&
        isUpperCasePasswordValid(password) &&
        isLowerCasePasswordValid(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isUserNameValid(String email) {
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.email);
  }

}

abstract class LoginViewModelInputs {
  setUserName(String email);
  setPassword(String password);
  login();

  Sink get inputsUserName;
  Sink get inputsPassword;
  Sink get inputsAreAllDataValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputsUserNameValid;
  Stream<bool> get outputsPasswordValid;
  Stream<bool> get outputsAreAllDataValid;
}
