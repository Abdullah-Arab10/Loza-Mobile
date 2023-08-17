import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/checkout/view/checkout_view.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_shopping_card.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';
import 'package:loza_mobile/presentation/shopping_cart/viewmodel/shopping_cart_viewmodel.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final ShoppingCartViewModel _viewModel = instance<ShoppingCartViewModel>();

  _bind() async {
    _viewModel.start(1);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return StreamBuilder<CartViewObject>(
        stream: _viewModel.outputCartData,
        builder: (context, snapshot) {
          var cartViewObject = snapshot.data;
          if (cartViewObject != null) {
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
                              onPressed: () {
                                // Navigator.pushNamed(context, Routes.productDetailsRoute);
                              },
                              child: Text(
                                AppStrings.edit,
                                style: getHeavyStyle(
                                    color: ColorManager.blue,
                                    fontSize: FontSize.fs17.sp),
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
                          AppStrings.shoppingCart,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      const LoZaSeparatorWidget(),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s60,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w,
                        ),
                        child: Text(
                          '${cartViewObject.userCart.length} ${AppStrings.items}',
                          style: getHeavyStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.fs19.sp),
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      _getShoppingCardsWidget(cartViewObject.userCart),
                    ],
                  ),
                ),
              ),
              bottomSheet: StreamBuilder<double>(
                  stream: _viewModel.outputTotal,
                  builder: (context, snapshot) {
                    var total = snapshot.data;
                    if (total != null) {
                      return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    '\$$total',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: AppSize.s60.h,
                              child: LoZaButtonWidget(
                                text: AppStrings.checkout,
                                toUpperCase: true,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => CheckOutView(total: total)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _getShoppingCardsWidget(List<Map<String, dynamic>> userCart) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
        start: AppPadding.p11.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => LoZaShoppingCardWidget(
        image: userCart[index]['photo'],
        text1: userCart[index]['productName'],
        text2: userCart[index]['price'],
        colorName: userCart[index]['color'],
        colorNum: userCart[index]['colorNo'],
        quan: userCart[index]['qunatity'],
      ),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p100.w,
          top: AppPadding.p9.h,
          bottom: AppPadding.p9.h,
        ),
        child: const LoZaSeparatorWidget(),
      ),
      itemCount: userCart.length,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
