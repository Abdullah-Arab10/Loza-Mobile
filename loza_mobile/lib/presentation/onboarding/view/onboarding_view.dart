import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';
import 'package:loza_mobile/presentation/widgets/loza_button_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  // _bind() {
  //   _appPreferences.setOnBoardingScreenViewed();
  //   _viewModel.start();
  // }
  //
  // @override
  // void initState() {
  //   // _bind();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //     stream: _viewModel.outputSliderViewObject,
    //     builder: (context, snapshot) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: AppConstants.itemBuilder,
        itemBuilder: (context, index) {
          return _viewModel.pageBuilder(index);
        },
        reverse: true,
      ),
    );
  }
}

Widget _getRowCircles(context, int num) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / AppSize.s9,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          num == 3 ? ImageAssets.ovalCopy2 : ImageAssets.ovalCopy,
          width: AppSize.s10.w,
          height: AppSize.s10.h,
        ),
        SvgPicture.asset(
          num == 2 ? ImageAssets.ovalCopy2 : ImageAssets.ovalCopy,
          width: AppSize.s10.w,
          height: AppSize.s10.h,
        ),
        SvgPicture.asset(
          num == 1 ? ImageAssets.ovalCopy2 : ImageAssets.ovalCopy,
          width: AppSize.s10.w,
          height: AppSize.s10.h,
        ),
      ],
    ),
  );
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.onBoardingPhoto1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: AppPadding.p70.h,
              start: AppPadding.p30.w,
              end: AppPadding.p30.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: AppPadding.p35.h),
                  child: _getRowCircles(context, AppConstants.firstBlackCircle),
                ),
              ),
              Text(
                AppStrings.ourFavouriteLooksForYouStyle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / AppSize.s60,
              ),
              Text(
                AppStrings.manyDesktopPublishingEtc,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: AppPadding.p60.h,
            start: AppPadding.p30.w,
            end: AppPadding.p30.w),
        child: Column(
          children: [
            Image.asset(ImageAssets.onBoardingPhoto2),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s40,
            ),
            _getRowCircles(context, AppConstants.secondBlackCircle),
            SizedBox(
              height: MediaQuery.of(context).size.width / AppSize.s10,
            ),
            Text(
              AppStrings.newArrivals,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / AppSize.s60,
            ),
            Text(
              AppStrings.loremIpsumEtc,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(AppStrings.adipiscingElit,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            SizedBox(
              height: MediaQuery.of(context).size.width / AppSize.s14,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppPadding.p30.w,
                end: AppPadding.p30.w,
              ),
              child: SizedBox(
                  width: double.infinity,
                  height: AppSize.s38.h,
                  child: LoZaButtonWidget(
                    text: AppStrings.getStarted,
                    toUpperCase: true,
                    onPressed: () {},
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.grey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: AppPadding.p33.w, end: AppPadding.p33.w),
            child: Column(
              children: [
                Text(
                  AppStrings.discover,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / AppSize.s60,
                ),
                Text(
                  AppStrings.loremIpsumEtc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(AppStrings.adipiscingElit,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / AppSize.s40,
          ),
          Image.asset(ImageAssets.onBoardingPhoto3),
          SizedBox(
            height: MediaQuery.of(context).size.width / AppSize.s8,
          ),
          _getRowCircles(context, AppConstants.thirdBlackCircle),
          SizedBox(
            height: MediaQuery.of(context).size.width / AppSize.s8,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p30.w,
              end: AppPadding.p30.w,
            ),
            child: SizedBox(
                width: double.infinity,
                height: AppSize.s38.h,
                child: LoZaButtonWidget(
                  text: AppStrings.startShopping,
                  onPressed: () {},
                )),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage4 extends StatelessWidget {
  const OnBoardingPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            ImageAssets.onBoardingPhoto4,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: AppPadding.p55.w),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                ImageAssets.lozaLogo,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: AppPadding.p120.h,
                start: AppPadding.p40.w,
                end: AppPadding.p40.w),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: AppSize.s38.h,
                child: LoZaButtonWidget(
                  text: AppStrings.signUp,
                  color: ColorManager.white,
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: AppPadding.p70.h,
                top: AppPadding.p14.h,
                start: AppPadding.p40.w,
                end: AppPadding.p40.w),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: AppSize.s38.h,
                child: LoZaButtonWidget(
                  text: AppStrings.login,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
