abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {

}

abstract class BaseViewModelInputs {
  void start([int? num]);

  void dispose();

}

abstract class BaseViewModelOutputs {

}
