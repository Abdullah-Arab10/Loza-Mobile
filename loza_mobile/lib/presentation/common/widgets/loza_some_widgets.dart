import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

final HomeLayoutViewModel _viewModel = instance<HomeLayoutViewModel>();

Widget getDrawerWidget(BuildContext context) {
  return Drawer(
    backgroundColor: ColorManager.white,
    elevation: AppConstants.elevation,
    child: Padding(
      padding:
      EdgeInsetsDirectional.only(top: AppSize.s30.h, end: AppSize.s18.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              ImageAssets.close,
              width: AppSize.s28.w,
              height: AppSize.s28.w,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: AppSize.s44.h,
              start: AppSize.s28.w,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s30.w,
                  backgroundImage: const AssetImage(
                    ImageAssets.personalPhoto,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Garrett Miller',
                      maxLines: AppConstants.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height / AppSize.s309,
                    ),
                    Text(
                      'samir.runte@newell.org',
                      maxLines: AppConstants.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s14,
          ),
          Column(
            children: List.generate(AppConstants.itemCount, (index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppSize.s36.w,
                  top: AppSize.s30.h,
                ),
                child: _getCardsOfDrawer(
                    _viewModel.drawer[index], _viewModel.icons[index],context),
              );
            }),
          ),
        ],
      ),
    ),
  );
}

Widget _getCardsOfDrawer(String nameOfCard, String icon,BuildContext context) {
  return Row(
    children: [
      SvgPicture.asset(icon),
      SizedBox(
        width: MediaQuery.of(context).size.width / AppSize.s30,
      ),
      Text(
        nameOfCard,
        style: getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.fs18.sp),
      ),
    ],
  );
}

Widget getSection(String title) {
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
                AppStrings.showAll.tr(),
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