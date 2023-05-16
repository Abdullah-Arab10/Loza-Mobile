import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_new_arrivals_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({Key? key}) : super(key: key);

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget()
  {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p52.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
              end: AppPadding.p15.w,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.leftArrow,
                  width: AppSize.s26.w,
                  height: AppSize.s26.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s70,
                ),
                Text(
                  AppStrings.decoration,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      AppStrings.filters,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s150,
          ),
          const LoZaSeparatorWidget(),
          Expanded(
            child: GridView.count(
              crossAxisCount: AppSize.si2,
              crossAxisSpacing: AppSize.s6.w,
              childAspectRatio: 1/AppSize.s1_21.h,
              padding: EdgeInsetsDirectional.all(AppSize.s10.w),
              children: List.generate(AppConstants.itemCount, (index) {
                return LoZaNewArrivalsCard(
                  imageHeight: AppSize.s170.h,
                  imageWidth: AppSize.s146.w,
                  width: AppSize.s165.w,
                  height: AppSize.s280.h,
                );
              }),
            )
          ),
        ]));
  }
}
