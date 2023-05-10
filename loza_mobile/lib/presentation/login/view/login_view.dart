import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/app/di.dart';
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

  _bind() {
    _viewModel.start();
    _emailController
        .addListener(() => _viewModel.setUserName(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

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
    return Container(
      padding: EdgeInsets.only(
        top: AppPadding.p42.h,
        left: AppPadding.p32.w,
        right: AppPadding.p32.w,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  ImageAssets.close,
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s30),
              Text(
                AppStrings.login.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / AppPadding.p12),
              StreamBuilder(
                stream: _viewModel.outputsUserNameValid,
                builder: (context, snapshot) {
                  return LoZaTextFieldWidget(
                    controller: _emailController,
                    label: AppStrings.email,
                    error:
                        (snapshot.data ?? true) ? null : AppStrings.emailError,
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
                    label: AppStrings.password,
                    error: (snapshot.data ?? true)
                        ? null
                        : AppStrings.passwordError,
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
                      text: AppStrings.login,
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _viewModel.login();
                            }
                          : null,
                    ),
                  );
                },
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / AppPadding.p16),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.forgotPasswordRoute);
                  },
                  child: Text(
                    AppStrings.forgetPassword,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / AppSize.s6),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.registerRoute);
                  },
                  child: Text(
                    AppStrings.registerText,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ],
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
