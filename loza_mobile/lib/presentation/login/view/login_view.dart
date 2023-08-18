import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/flutter_toast_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_textfield_widget.dart';
import 'package:loza_mobile/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/routes_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _viewModel.start();
    _emailController
        .addListener(() => _viewModel.setUserName(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn == 1) {
        loZaToastWidget(
            msg: AppStrings.loggedInSuccessfully.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: ColorManager.green,
            textColor: ColorManager.white,
            fontSize: 15
        );
        _appPreferences.setUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.homeLayoutRoute);
      }else if(isLoggedIn == 2){
        loZaToastWidget(
            msg: AppStrings.theEmailOrPasswordIsIncorrect.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: ColorManager.red,
            textColor: ColorManager.white,
            fontSize: 15
        );
      }else if(isLoggedIn == 3){
        loZaToastWidget(
            msg: AppStrings.thePasswordIsIncorrect.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: ColorManager.red,
            textColor: ColorManager.white,
            fontSize: 15
        );
      }else if(isLoggedIn == 4){
        loZaToastWidget(
            msg: AppStrings.pleaseTryAgainLater.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: ColorManager.red,
            textColor: ColorManager.white,
            fontSize: 15
        );
      }
    });
  }

  Map<String, dynamic>? newest;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
              top: AppPadding.p40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p12.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // _appPreferences.getToken().then((value) {
                      //   Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
                      //   print(decodedToken['Id']);
                      // });
                    },
                    child: SvgPicture.asset(
                      ImageAssets.close,
                      width: AppSize.s26.w,
                      height: AppSize.s26.w,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: AppPadding.p32.w,
                    right: AppPadding.p32.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / AppSize.s30),
                      Text(
                        AppStrings.login.tr().toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / AppPadding.p12),
                      StreamBuilder(
                        stream: _viewModel.outputsUserNameValid,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _emailController,
                            label: AppStrings.email.tr(),
                            error:
                                (snapshot.data ?? true) ? null : AppStrings.emailError.tr(),
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / AppPadding.p33),
                      StreamBuilder(
                        stream: _viewModel.outputsPasswordValid,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _passwordController,
                            label: AppStrings.password.tr(),
                            error: (snapshot.data ?? true)
                                ? null
                                : '${AppStrings.passwordError1.tr()}\n${AppStrings.passwordError2.tr()}',
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / AppPadding.p7_5),
                      StreamBuilder(
                        stream: _viewModel.outputsAreAllDataValid,
                        builder: (context, snapshot) {
                          return SizedBox(
                            width: double.infinity,
                            height: AppSize.s38.h,
                            child: LoZaButtonWidget(
                              text: AppStrings.login.tr(),
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.login();
                                    }
                                  : null,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / AppPadding.p16),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.forgetPassword.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / AppSize.s10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.registerText.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
