import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/my_account/viewmodel/my_account_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {

  final MyAccountViewModel _viewModel = MyAccountViewModel();

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
                start: AppPadding.p15.w, bottom: AppPadding.p15.h),
            child: SvgPicture.asset(
              ImageAssets.leftArrow,
              width: AppSize.s26.w,
              height: AppSize.s26.w,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              AppStrings.myAccount,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: AppSize.s28.w),
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
                      height: MediaQuery.of(context).size.height / AppSize.s309,
                    ),
                    Text(
                      'samir.runte@newell.org',
                      maxLines: AppConstants.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: AppSize.s15.w,
                      ),
                      child: SvgPicture.asset(
                        ImageAssets.arrowOfAccount,
                        width: AppSize.s18.w,
                        height: AppSize.s18.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s30,
          ),
          const LoZaSeparatorWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Column(
            children: List.generate(AppConstants.itemCount, (index) {
              return _getCardOfAccount(_viewModel.profile[index]);
            }),
          ),
        ]));
  }

  Widget _getCardOfAccount(String nameOfCard) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.s28.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: AppSize.s18.w,
              bottom: AppSize.s18.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameOfCard,
                  style: getRegularStyle(
                      color: ColorManager.black, fontSize: FontSize.fs18.sp),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: AppSize.s15.w,
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.arrowOfAccount,
                    width: AppSize.s18.w,
                    height: AppSize.s18.w,
                  ),
                ),
              ],
            ),
          ),
          const LoZaSeparatorWidget(),
        ],
      ),
    );
  }
}
