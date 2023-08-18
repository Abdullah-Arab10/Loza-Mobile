import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/Add_Address/viewmodel/add_address_view_model.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_textfield_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final AddAddressViewModel _viewModel = instance<AddAddressViewModel>();
  final TextEditingController _addAddressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _addAddressController
        .addListener(() => _viewModel.setAddressName(_addAddressController.text));
    _locationController
        .addListener(() => _viewModel.setLocation(_locationController.text));
    _viewModel.isAddAddressSuccessfullyStreamController.stream.listen((isAdd) {
      if(isAdd){
        Navigator.of(context).pop();
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
    return SingleChildScrollView(
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
                child: InkWell(
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
                        height: MediaQuery.of(context).size.height / AppSize.s30),
                    Text(
                      AppStrings.addAddress.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / AppPadding.p12),
                    StreamBuilder(
                      stream: _viewModel.outputsAddressNameValid,
                      builder: (context, snapshot) {
                        return LoZaTextFieldWidget(
                          controller: _addAddressController,
                          label: AppStrings.address.tr(),
                          error:
                          (snapshot.data ?? true) ? null : AppStrings.addAddressError,
                        );
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / AppPadding.p33),
                    StreamBuilder(
                      stream: _viewModel.outputsLocationValid,
                      builder: (context, snapshot) {
                        return LoZaTextFieldWidget(
                          controller: _locationController,
                          label: AppStrings.location.tr(),
                          error: (snapshot.data ?? true)
                              ? null
                              : AppStrings.locationError,
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
                            text: AppStrings.addAddress.tr(),
                            onPressed: (snapshot.data ?? false)
                                ? () {
                              _viewModel.addAddress();
                            }
                                : null,
                          ),
                        );
                      },
                    ),
                  ],
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
