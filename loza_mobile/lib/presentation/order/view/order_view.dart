import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_order_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_shopping_card.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  //final OrderViewModel _viewModel = OrderViewModel();

  dynamic _items;

  _bind() async{
    //_viewModel.start();
  }

  @override
  void initState()  {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget(){
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: AppPadding.p52.h,
            bottom: AppPadding.p160.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: AppPadding.p15.w,
                    end: AppPadding.p15.w,
                    bottom: AppPadding.p15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.close,
                      width: AppSize.s26.w,
                      height: AppSize.s26.w,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.pushNamed(context, Routes.productDetailsRoute);
                      },
                      child: Text(
                        AppStrings.edit,
                        style: getHeavyStyle(color: ColorManager.blue,fontSize: FontSize.fs17.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppPadding.p15.w,
                ),
                child: Text(
                  'My Order',
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
                ),
                child: Text(
                  '3 ${AppStrings.order}',
                  style: getHeavyStyle(
                      color: ColorManager.black, fontSize: FontSize.fs19.sp),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              _getShoppingCardsWidget(),
            ],
          ),
        ),
      ),
      // bottomSheet: Container(
      //   color: ColorManager.white,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       const LoZaSeparatorWidget(),
      //       Padding(
      //         padding: EdgeInsetsDirectional.only(
      //           start: AppPadding.p15.w,
      //           end: AppPadding.p15.w,
      //           top: AppPadding.p10.w,
      //           bottom: AppPadding.p10.w,
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'Shipping fee',
      //                   style: Theme.of(context).textTheme.labelMedium,
      //                 ),
      //                 Text(
      //                   'Sub total',
      //                   style: Theme.of(context).textTheme.labelMedium,
      //                 ),
      //                 Text(
      //                   'Total',
      //                   style: Theme.of(context).textTheme.bodySmall,
      //                 ),
      //               ],
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   '\$6.99',
      //                   style: Theme.of(context).textTheme.labelMedium,
      //                 ),
      //                 Text(
      //                   '\$79.99',
      //                   style: Theme.of(context).textTheme.labelMedium,
      //                 ),
      //                 Text(
      //                   '\$86.98',
      //                   style: Theme.of(context).textTheme.bodySmall,
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         width: double.infinity,
      //         height: AppSize.s60.h,
      //         child: LoZaButtonWidget(
      //           text: AppStrings.checkout,
      //           toUpperCase: true,
      //           onPressed: (){},
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );

  }

  Widget _getShoppingCardsWidget() {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
          start: AppPadding.p11.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const LoZaOrderWidget(
        text1: '5935892332',
        text2: '\$100',
      ),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p100.w,
          bottom: AppPadding.p15.h,
        ),
        child: const LoZaSeparatorWidget(),
      ),
      itemCount: 3,

    );
  }

  @override
  void dispose() {
    //_viewModel.dispose();
    super.dispose();
  }
}
