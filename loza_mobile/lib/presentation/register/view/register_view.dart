import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/flutter_toast_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_textfield_widget.dart';
import 'package:loza_mobile/presentation/register/viewmodel/register_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/routes_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _firstNameController
        .addListener(() => _viewModel.setFirstName(_firstNameController.text));
    _lastNameController
        .addListener(() => _viewModel.setLastName(_lastNameController.text));
    _emailController
        .addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _phoneController
        .addListener(() => _viewModel.setPhoneNumber(_phoneController.text));
    _addressController
        .addListener(() => _viewModel.setAddress(_addressController.text));
    _dateOfBirthController.addListener(
        () => _viewModel.setDateOfBirth(_dateOfBirthController.text));

    _viewModel.isUserRegisteredInSuccessfullyStreamController.stream
        .listen((isRegistered) {
          if(isRegistered){
            loZaToastWidget(
                msg: AppStrings.accountSuccessfullyCreated.tr(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: ColorManager.green,
                textColor: ColorManager.white,
                fontSize: 15
            );
            Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
          }else{
            loZaToastWidget(
                msg: AppStrings.theEmailAlreadyExist.tr(),
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
              top: AppPadding.p45.h,
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
                      Navigator.of(context).pop();
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
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30),
                      Text(
                        AppStrings.personalDetails.tr().toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p12),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorFirstName,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _firstNameController,
                            label: AppStrings.firstName.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorLastName,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _lastNameController,
                            label: AppStrings.lastName.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorEmail,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _emailController,
                            label: AppStrings.email.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorPassword,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _passwordController,
                            label: AppStrings.password.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorPhoneNumber,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            label: AppStrings.phone.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorAddress,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _addressController,
                            label: AppStrings.address.tr(),
                            error: snapshot.data,
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p33),
                      StreamBuilder<String?>(
                        stream: _viewModel.outputErrorDateOfBirth,
                        builder: (context, snapshot) {
                          return LoZaTextFieldWidget(
                            controller: _dateOfBirthController,
                            label: AppStrings.dateOfBirth.tr(),
                            error: snapshot.data,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2024-12-31'),
                              ).then((value) {
                                _dateOfBirthController.text =
                                    DateFormat.yMd().format(value!);
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p7_5),
                      StreamBuilder<bool>(
                        stream: _viewModel.outputAreAllInputsValid,
                        builder: (context, snapshot) {
                          return SizedBox(
                            width: double.infinity,
                            height: AppSize.s38.h,
                            child: LoZaButtonWidget(
                              text: AppStrings.register.tr(),
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.register();
                                    }
                                  : null,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute);
                          },
                          child: Text(
                            AppStrings.alreadyHaveAnAccount.tr(),
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
