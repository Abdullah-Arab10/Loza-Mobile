abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  @override
  void dispose() {

  }
}

abstract class BaseViewModelInputs{

void start();

void dispose();

}

abstract class BaseViewModelOutputs{}