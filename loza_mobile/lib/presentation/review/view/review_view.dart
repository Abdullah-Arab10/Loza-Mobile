import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_review_card_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_textfield_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p52.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: AppPadding.p15.w,
                end: AppPadding.p15.w,
                bottom: AppPadding.p15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  ImageAssets.leftArrow,
                  width: AppSize.s26.w,
                  height: AppSize.s26.w,
                ),
                SvgPicture.asset(
                  ImageAssets.pencil,
                  width: AppSize.s26.w,
                  height: AppSize.s26.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              AppStrings.reviews,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          const LoZaSeparatorWidget(),
          _getReviewsWidget(),
          Container(
            height: AppSize.s50.h,
            color: ColorManager.veryLightGrey,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppPadding.p10.w,
                bottom: AppPadding.p10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: AppSize.s30.h,
                    width: AppSize.s280.w,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s50)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: AppStrings.addAComment,
                        labelStyle: getBookStyle(
                            color: ColorManager.black
                                .withAlpha(AppConstants.withAlpha),
                            fontSize: FontSize.fs11.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                          borderSide: BorderSide(
                            color: ColorManager.white
                          ),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                          borderSide: BorderSide(
                              color: ColorManager.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  SvgPicture.asset(
                    ImageAssets.plane,
                    width: AppSize.s26.w,
                    height: AppSize.s26.w,
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  Widget _getReviewsWidget() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p11.w,
          top: AppSize.s11.h,
        ),
        itemBuilder: (context, index) => const LoZaReviewCardWidget(),
        itemCount: AppConstants.itemBuilder,
        separatorBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppPadding.p60.w,
            top: AppPadding.p9.h,
            bottom: AppPadding.p9.h,
          ),
          child: const LoZaSeparatorWidget(),
        ),
      ),
    );
  }
}
