
import 'package:flutter/material.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:loza_mobile/presentation/login/view/login_view.dart';
import 'package:loza_mobile/presentation/onboarding/view/onboarding_view.dart';
import 'package:loza_mobile/presentation/register/view/register_view.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        ));
  }
}
