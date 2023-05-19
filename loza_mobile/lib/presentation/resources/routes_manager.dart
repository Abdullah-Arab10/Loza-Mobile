
import 'package:flutter/material.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/categories/view/categories_view.dart';
import 'package:loza_mobile/presentation/collection/view/collection_view.dart';
import 'package:loza_mobile/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:loza_mobile/presentation/home_layout/view/home_layout_view.dart';
import 'package:loza_mobile/presentation/login/view/login_view.dart';
import 'package:loza_mobile/presentation/onboarding/view/onboarding_view.dart';
import 'package:loza_mobile/presentation/product_details/view/product_details_view.dart';
import 'package:loza_mobile/presentation/register/view/register_view.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/review/view/review_view.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeLayoutRoute = "/homeLayout";
  static const String productDetailsRoute = "/productDetails";
  static const String categoriesRoute = "/categories";
  static const String collectionRoute = "/collection";
  static const String reviewRoute = "/review";
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
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeLayoutRoute:
        return MaterialPageRoute(builder: (_) => const HomeLayoutView());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProductDetailsView());
      case Routes.categoriesRoute:
        return MaterialPageRoute(builder: (_) => const CategoriesView());
      case Routes.collectionRoute:
        return MaterialPageRoute(builder: (_) => const CollectionView());
      case Routes.reviewRoute:
        return MaterialPageRoute(builder: (_) => const ReviewView());
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
