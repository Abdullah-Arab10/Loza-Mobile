import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/checkout/viewmodel/checkout_viewmodel.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_checkout_widgets.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class CheckOutView extends StatefulWidget {

  final double total;

  const CheckOutView({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final CheckOutViewModel _viewModel = CheckOutViewModel();

  _bind() {
    _viewModel.start();
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
      body: _getContentWidget(context),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LoZaSeparatorWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppPadding.p15.w,
                end: AppPadding.p15.w,
                top: AppPadding.p10.w,
                bottom: AppPadding.p10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '\$${widget.total}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: AppSize.s60.h,
              child: LoZaButtonWidget(
                text: AppStrings.payment,
                toUpperCase: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p52.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: AppPadding.p15.w,
                  end: AppPadding.p15.w,
                  bottom: AppPadding.p15.h),
              child: SvgPicture.asset(
                ImageAssets.leftArrow,
                width: AppSize.s26.w,
                height: AppSize.s26.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              AppStrings.checkout,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          const LoZaSeparatorWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
              end: AppPadding.p15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping to',
                  style: getHeavyStyle(
                      color: ColorManager.black, fontSize: FontSize.fs17.sp),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: getHeavyStyle(
                        color: ColorManager.blue, fontSize: FontSize.fs17.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          StreamBuilder<int?>(
              stream: _viewModel.outputSelectedRadio,
              builder: (context, snapshot) {
                var selectedRadio = snapshot.data;
                if (selectedRadio != null) {
                  return SizedBox(
                    height: AppSize.s100.h,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: AppPadding.p15.w,
                        end: AppPadding.p15.w,
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => LoZaAddressWidget(
                                value: index,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  _viewModel.onChangeSelectedRadio(val);
                                },
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    AppSize.s22,
                              ),
                          itemCount: 3),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s30,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              'Payment method',
              style: getHeavyStyle(
                  color: ColorManager.black, fontSize: FontSize.fs17.sp),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          StreamBuilder<int?>(
              stream: _viewModel.outputPaymentMethodSelectedRadio,
              builder: (context, snapshot) {
                var paymentMethodSelectedRadio = snapshot.data;
                if (paymentMethodSelectedRadio != null) {
                  return Expanded(
                    child: ListView.separated(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w,
                          end: AppPadding.p15.w,
                          top: AppPadding.p20.h,
                          bottom: AppPadding.p20.w,
                        ),
                        itemBuilder: (context, index) =>
                            LoZaPaymentMethodWidget(
                              text: _viewModel.paymentMethods[index],
                              value: index,
                              groupValue: paymentMethodSelectedRadio,
                              onChanged: (val) {
                                _viewModel.onChangePaymentMethodSelectedRadio(val);
                              },
                            ),
                        separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: AppPadding.p20.h,
                                bottom: AppPadding.p20.w,
                              ),
                              child: LoZaSeparatorWidget(
                                color: ColorManager.whiteSmoke,
                              ),
                            ),
                        itemCount: _viewModel.paymentMethods.length),
                  );
                } else {
                  return Container();
                }
              }),
        ]));
  }
}
