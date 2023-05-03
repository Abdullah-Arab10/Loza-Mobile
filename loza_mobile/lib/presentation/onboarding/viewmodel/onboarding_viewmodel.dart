import 'package:flutter/cupertino.dart';
import 'package:loza_mobile/presentation/onboarding/view/onboarding_view.dart';

class OnBoardingViewModel extends OnBoardingViewModelInputs
    with OnBoardingViewModelOutputs {
  @override
  Widget pageBuilder(int index) {
    switch (index) {
      case 0:
        return const OnBoardingPage1();
      case 1:
        return const OnBoardingPage2();
      case 2:
        return const OnBoardingPage3();
      case 3:
        return const OnBoardingPage4();
      default:
        return Container();
    }
  }
}

abstract class OnBoardingViewModelInputs {
  Widget pageBuilder(int index);
}

abstract class OnBoardingViewModelOutputs {}
