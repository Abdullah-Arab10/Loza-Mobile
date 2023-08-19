import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';


class LoZaOrderWidget extends StatefulWidget {
  final int text1;
  final String text2;
  final String date;
  final bool isDelivered;
  final GestureTapCallback onTap;

  const LoZaOrderWidget({
    Key? key,
    required this.text1,
    required this.text2,
    required this.date,
    required this.isDelivered,
    required this.onTap
  }) : super(key: key);

  @override
  State<LoZaOrderWidget> createState() => _LoZaOrderWidgetState();
}

class _LoZaOrderWidgetState extends State<LoZaOrderWidget> {

  late String orderDate;

  _bind(){
    final DateTime date = DateTime.parse(widget.date);
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
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s5,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p20.w,
          end: AppPadding.p20.w,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageAssets.shoppingCart,
                  fit: BoxFit.fill,
                  width: AppSize.s60.h,
                  height: AppSize.s60.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.text1}',
                      maxLines: AppConstants.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: getHeavyStyle(
                          color: ColorManager.black, fontSize: FontSize.fs16.sp),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s105,
                    ),
                    Text(
                      widget.text2,
                      maxLines: AppConstants.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s105,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: AppSize.s87.w,
                          height: AppSize.s38.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s50),
                            color: ColorManager.black,
                          ),
                        ),
                        Container(
                          width: AppSize.s83.w,
                          height: AppSize.s35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s50),
                            color: ColorManager.white,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.isDelivered ? 'Delivered' : 'NotDelivered',
                              style: getHeavyStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.fs12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
               height: MediaQuery.of(context).size.height / AppSize.s40,),
            const LoZaSeparatorWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s40,),
            Row(
              children: [
                Text(
                  'Date',
                  style: getHeavyStyle(
                      color: ColorManager.black, fontSize: FontSize.fs16.sp),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s60,),
                Text(
                  orderDate,
                  style: getHeavyStyle(
                      color: ColorManager.black.withAlpha(100), fontSize: FontSize.fs16.sp),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        width: AppSize.s81,
                        height: AppSize.s32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                          color: ColorManager.blue,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Details',
                            style: getHeavyStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.fs13.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
