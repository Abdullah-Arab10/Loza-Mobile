import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaAddressWidget extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged onChanged;
  final String address1;
  final String address2;

  const LoZaAddressWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.address1,
    required this.address2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppPadding.p15.w,
        bottom: AppPadding.p15.w,
      ),
      child: Container(
        width: AppSize.s309.w,
        height: AppSize.s70.h,
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p13.w,
          end: AppPadding.p13.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: ColorManager.whiteSmoke,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: AppSize.s50.w,
              height: AppSize.s50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                color: ColorManager.white,
              ),
              padding: EdgeInsetsDirectional.all(AppPadding.p10.w),
              child: SvgPicture.asset(
                ImageAssets.homeIcon,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / AppSize.s30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  address1,
                  style: getHeavyStyle(
                      color: ColorManager.black, fontSize: FontSize.fs16.sp),
                ),
                Text(
                  address2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Radio(
                    value: value,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: ColorManager.blue,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class LoZaPaymentMethodWidget extends StatelessWidget {

  final String text;
  final int value;
  final int groupValue;
  final ValueChanged onChanged;
  final String text2;

  const LoZaPaymentMethodWidget({
    Key? key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: AppSize.s60.w,
            height: AppSize.s60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s100),
              color: ColorManager.whiteSmoke,
            ),
            padding: EdgeInsetsDirectional.only(
              top: AppPadding.p14.h,
              bottom: AppPadding.p14.h,
              start: AppPadding.p8.w,
              end: AppPadding.p8.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s4),
                color: ColorManager.black,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: getBlackStyle(
                      color: ColorManager.whiteSmoke,
                      fontSize: FontSize.fs9.sp),
                ),
              ),
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text2,
              style: getHeavyStyle(
                  color: ColorManager.black, fontSize: FontSize.fs16.sp),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: ColorManager.blue,
            ),
          ),
        ),
      ],
    );
  }
}
