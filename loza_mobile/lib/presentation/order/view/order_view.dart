import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_order_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/order/view/invoice_view.dart';
import 'package:loza_mobile/presentation/order/viewmodel/order_viewmodel.dart';
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
  final OrderViewModel _viewModel = instance<OrderViewModel>();

  _bind() {
    _viewModel.start();
  }

  bind2() {
    _viewModel.orderDetailsStreamController.stream.listen((orderDetails) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InvoiceView(orderDetails: orderDetails),
        ),
      );
    });
  }

  @override
  void initState() {
    _bind();
    bind2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return StreamBuilder<OrderViewObject>(
        stream: _viewModel.outputOrderData,
        builder: (context, snapshot) {
          var orders = snapshot.data;
          if (orders != null) {
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
                                print(ColorManager.lightGrey.value);
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
                          'My Order',
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
                          '${orders.userOrder.length} ${AppStrings.items}',
                          style: getHeavyStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.fs19.sp),
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      ListView.separated(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p11.w,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => LoZaOrderWidget(
                          text1: orders.userOrder[index]['orderNumber'],
                          text2: orders.userOrder[index]['useraddress'],
                          date: orders.userOrder[index]['orderdate'],
                          isDelivered: orders.userOrder[index]['isDelivered'],
                          onTap: (){
                            _viewModel.getOrdersDetails(orders.userOrder[index]['orderNumber']);
                          },
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: AppPadding.p100.w,
                            bottom: AppPadding.p15.h,
                          ),
                          child: const LoZaSeparatorWidget(),
                        ),
                        itemCount: orders.userOrder.length,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
  @override
  void dispose() {
    //_viewModel.dispose();
    super.dispose();
  }
}
