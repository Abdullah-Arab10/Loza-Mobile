import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_order_details_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/deliveryMan/viewmodel/deliveryMan_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class InvoiceDeliveryManView extends StatefulWidget {

  final String buttonName;
  final DeliveryMan deliveryMan;

  const InvoiceDeliveryManView({Key? key,required this.buttonName,required this.deliveryMan}) : super(key: key);

  @override
  State<InvoiceDeliveryManView> createState() => _InvoiceDeliveryManViewState();
}

class _InvoiceDeliveryManViewState extends State<InvoiceDeliveryManView> {

  final DeliVeryManViewModel _viewModel = instance<DeliVeryManViewModel>();

  late String orderDate;

  _bind(){
    final DateTime date = DateTime.parse(widget.deliveryMan.orderdate);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    orderDate = formatter.format(date);
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

  Widget _getContentWidget(){
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppPadding.p52.h,

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
                ImageAssets.leftArrow,
                width: AppSize.s26.w,
                height: AppSize.s26.w,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
              end: AppPadding.p15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Creation time:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Address:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Payment Method:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Phone Number:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'User Name:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.deliveryMan.shippingadress,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.deliveryMan.paymentmethod == 1 ? 'pay with wallet' : 'pay cash',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.deliveryMan.phonenumber,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.deliveryMan.username,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          LoZaSeparatorWidget(
            color: ColorManager.black.withAlpha(50),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
              end: AppPadding.p15.w,
            ),
            child: Text(
              'Your order',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          _getOrderDetailsWidget(),

          LoZaSeparatorWidget(
            color: ColorManager.black.withAlpha(50),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
              end: AppPadding.p15.w,
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: LoZaOrderDetailsWidget(
                    text: 'Net Total',
                    style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.fs20.sp
                    ),
                    price: widget.deliveryMan.totalCheck
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          SizedBox(
            width: double.infinity,
            height: AppSize.s60.h,
            child: LoZaButtonWidget(
              onPressed: (){
                _viewModel.confirmOrder(widget.deliveryMan.number);
              },
              text: widget.buttonName,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getOrderDetailsWidget() {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p15.w,
          end: AppPadding.p15.w,
        ),
        child: ListView.separated(
          padding: EdgeInsetsDirectional.only(
            bottom: AppPadding.p9.w,
          ),
          itemBuilder: (context, index) => LoZaOrderDetailsWidget(
            text: widget.deliveryMan.products[index]['proname'],
            quan: widget.deliveryMan.products[index]['quantinty'],
            price: widget.deliveryMan.products[index]['price'],
          ),
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsetsDirectional.only(
              top: AppPadding.p22.h,
              bottom: AppPadding.p22.h,
            ),
            child:  LoZaSeparatorWidget(
              color: ColorManager.black.withAlpha(50),
            ),
          ),
          itemCount: widget.deliveryMan.products.length,

        ),
      ),
    );
  }
}
