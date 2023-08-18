
import 'package:flutter/material.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/Add_Address/view/add_address_view.dart';
import 'package:loza_mobile/presentation/categories/view/categories_view.dart';
import 'package:loza_mobile/presentation/checkout/view/checkout_view.dart';
import 'package:loza_mobile/presentation/collection/view/collection_view.dart';
import 'package:loza_mobile/presentation/favourite/view/favourite_view.dart';
import 'package:loza_mobile/presentation/filters/view/filters_view.dart';
import 'package:loza_mobile/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:loza_mobile/presentation/home_layout/view/home_layout_view.dart';
import 'package:loza_mobile/presentation/login/view/login_view.dart';
import 'package:loza_mobile/presentation/my_account/view/my_account_view.dart';
import 'package:loza_mobile/presentation/onboarding/view/onboarding_view.dart';
import 'package:loza_mobile/presentation/order/view/invoice_view.dart';
import 'package:loza_mobile/presentation/order/view/order_view.dart';
import 'package:loza_mobile/presentation/product_details/view/product_details_view.dart';
import 'package:loza_mobile/presentation/rating/view/rating_view.dart';
import 'package:loza_mobile/presentation/register/view/register_view.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/review/view/review_view.dart';
import 'package:loza_mobile/presentation/shopping_cart/view/shopping_cart_view.dart';
import 'package:loza_mobile/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeLayoutRoute = "/homeLayout";
  //static const String productDetailsRoute = "/productDetails";
  static const String categoriesRoute = "/categories";
  static const String collectionRoute = "/collection";
  static const String reviewRoute = "/review";
  static const String filtersRoute = "filters";
  static const String shoppingCartRoute = "shoppingCart";
  static const String myAccountRoute = "myAccount";
  //static const String ratingRoute = "rating";
  static const String orderRoute = "order";
  static const String invoiceRoute = "invoice";
  //static const String checkOutRoute = "checkOut";
  static const String addAddressRoute = "addAddress";
  static const String favouriteRoute = "favourite";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
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
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeLayoutView());
      // case Routes.productDetailsRoute:
      //   return MaterialPageRoute(builder: (_) => const ProductDetailsView());
      case Routes.categoriesRoute:
        return MaterialPageRoute(builder: (_) => const CategoriesView());
      case Routes.collectionRoute:
        return MaterialPageRoute(builder: (_) => const CollectionView());
      case Routes.reviewRoute:
        initGetReviewModule();
        return MaterialPageRoute(builder: (_) => const ReviewView());
      case Routes.filtersRoute:
        return MaterialPageRoute(builder: (_) => const FiltersView());
      case Routes.shoppingCartRoute:
        initShoppingCartModule();
        return MaterialPageRoute(builder: (_) => const ShoppingCartView());
      case Routes.myAccountRoute:
        return MaterialPageRoute(builder: (_) => const MyAccountView());
      // case Routes.ratingRoute:
      //   return MaterialPageRoute(builder: (_) => const RatingView());
      case Routes.orderRoute:
        return MaterialPageRoute(builder: (_) => const OrderView());
      case Routes.invoiceRoute:
        return MaterialPageRoute(builder: (_) => const InvoiceView());
      // case Routes.checkOutRoute:
      //   return MaterialPageRoute(builder: (_) => const CheckOutView());
      case Routes.addAddressRoute:
        initAddAddressModule();
        return MaterialPageRoute(builder: (_) => const AddAddressView());
      case Routes.favouriteRoute:
        initHomeModule();
        initGetFavouriteModule();
        return MaterialPageRoute(builder: (_) => const FavouriteView());
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
