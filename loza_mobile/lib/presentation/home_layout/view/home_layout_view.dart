import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_best_seller_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_new_arrivals_card.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({Key? key}) : super(key: key);

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: _getContentWidget());
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorManager.veryLightGrey,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppPadding.p52.h,
                start: AppPadding.p15.w,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            ImageAssets.menu,
                            width: AppSize.s26.w,
                            height: AppSize.s26.w,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        ImageAssets.shopIcon,
                        width: AppSize.s26.w,
                        height: AppSize.s26.w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                      SvgPicture.asset(
                        ImageAssets.favouriteIcon,
                        width: AppSize.s26.w,
                        height: AppSize.s26.w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        ImageAssets.maskCopy,
                        width: double.infinity,
                        height: AppSize.s220.h,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: AppPadding.p20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.blackFridays,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              AppStrings.saleUp,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              AppStrings.to70Off,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: AppPadding.p12.h,
                              ),
                              child: SizedBox(
                                width: AppSize.s112,
                                height: AppSize.s34,
                                child: LoZaButtonWidget(
                                  onPressed: () {},
                                  text: AppStrings.shopNow,
                                  textStyle: getBookStyle(
                                      color: ColorManager.veryLightGrey,
                                      fontSize: FontSize.fs15.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          _getSection(AppStrings.arrivals),
          _getNewArrivalsWidget(),
          _getSection(AppStrings.bestSellers),
          _getBestSellerWidget()
        ],
      ),
    );
  }

  Widget _getNewArrivalsWidget() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.s3.h,
        start: AppSize.s11.w,
        bottom: AppSize.s3.h,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / AppSize.s3_9,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const LoZaNewArrivalsCard(),
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: AppSize.s6.w,
          ),
        ),
      ),
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppPadding.p11.w,
        end: AppPadding.p6.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getHeavyStyle(
                color: ColorManager.black, fontSize: FontSize.fs22.sp),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  AppStrings.showAll,
                  style: getBookStyle(
                      color: ColorManager.black, fontSize: FontSize.fs13.sp),
                ),
                SvgPicture.asset(ImageAssets.arrow),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBestSellerWidget() {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
        start: AppPadding.p11.w,
        top: AppSize.s3.h
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const LoZaBestSellerWidget(),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p90.w,
          top: AppPadding.p9.h,
          bottom: AppPadding.p9.h,
        ),
        child: Container(
          color: ColorManager.grey,
          height: AppSize.s1.h,
        ),
      ),
    );
  }
}
