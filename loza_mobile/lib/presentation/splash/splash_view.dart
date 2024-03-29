import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/routes_manager.dart';
import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer( const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if (isUserLoggedIn)
        {
          // navigate to main screen
          Navigator.pushReplacementNamed(context, Routes.homeLayoutRoute)
        }
      else
        {
          _appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) => {
            if (isOnBoardingScreenViewed)
              {
                // navigate to login screen

                Navigator.pushReplacementNamed(
                    context, Routes.loginRoute)
              }
            else
              {
                // navigate to onboarding screen

                Navigator.pushReplacementNamed(
                    context, Routes.onBoardingRoute)
              }
          })
        }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body:
      const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
