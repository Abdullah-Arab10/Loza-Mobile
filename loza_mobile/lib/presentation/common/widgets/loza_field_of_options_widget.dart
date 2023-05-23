import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaFieldOfOptionsWidget extends StatelessWidget {

  final String text;
  final List<String> items;
  final GestureTapCallback onTap;

  const LoZaFieldOfOptionsWidget({
    Key? key,
    required this.text,
    required this.items,
    required this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.s15.w,
        end: AppSize.s15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: getRegularStyle(
                color: ColorManager.black, fontSize: FontSize.fs17.sp),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  children: items
                      .map(
                        (e) => Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: AppSize.s15.w,
                        //top: AppSize.s15.w,
                      ),
                      child: Container(
                          decoration:
                          BoxDecoration(color: ColorManager.black),
                          padding: EdgeInsetsDirectional.only(
                            start: AppSize.s16.w,
                            end: AppSize.s16.w,
                          ),
                          child: Text(
                            e,
                            style: getHeavyStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.fs13.sp),
                          )),
                    ),
                  )
                      .toList(),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  ImageAssets.arrow,
                  width: AppSize.s12.w,
                  height: AppSize.s12.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s70,
          ),
          LoZaSeparatorWidget(
            color: ColorManager.black.withAlpha(AppConstants.withAlpha2),
          ),
        ],
      ),
    );
  }
}
