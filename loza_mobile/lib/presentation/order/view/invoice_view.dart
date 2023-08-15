import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_order_details_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
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
                      'Expected:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '12/06/2023',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'nabek',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '06:44 PM',
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
                )),
           ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          SizedBox(
            width: double.infinity,
            height: AppSize.s60.h,
            child: LoZaButtonWidget(
              onPressed: (){},
                text: 'Return Order'
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
          itemBuilder: (context, index) => const LoZaOrderDetailsWidget(
            text: 'Table:',
            quan: 1,
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
          itemCount: 3,

        ),
      ),
    );
  }
}
