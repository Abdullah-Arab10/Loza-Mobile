import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_best_seller_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_new_arrivals_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
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
  final HomeLayoutViewModel _viewModel = instance<HomeLayoutViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        drawer: _getDrawerWidget(),
        body: _getContentWidget());
  }

  Widget _getDrawerWidget() {
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
                      _viewModel.drawer[index], _viewModel.icons[index]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCardsOfDrawer(String nameOfCard, String icon) {
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

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          var homeViewObject = snapshot.data;
          if (homeViewObject != null) {
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
                                  child: Builder(builder: (context) {
                                    return InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: SvgPicture.asset(
                                        ImageAssets.menu,
                                        width: AppSize.s26.w,
                                        height: AppSize.s26.w,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.shopIcon,
                                width: AppSize.s26.w,
                                height: AppSize.s26.w,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    AppSize.s30,
                              ),
                              SvgPicture.asset(
                                ImageAssets.favouriteIcon,
                                width: AppSize.s26.w,
                                height: AppSize.s26.w,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    AppSize.s30,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      AppStrings.saleUp,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    Text(
                                      AppStrings.to70Off,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
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
                    height: MediaQuery.of(context).size.height / AppSize.s40,
                  ),
                  _getSection(AppStrings.arrivals),
                  _getNewArrivalsWidget(homeViewObject.newest),
                  _getSection(AppStrings.bestSellers),
                  _getBestSellerWidget()
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _getNewArrivalsWidget(List<Map<String, dynamic>> newest) {
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
          itemBuilder: (context, index) => LoZaNewArrivalsCard(
            image: newest[index]['productImage'],
            name: newest[index]['name'],
            price: newest[index]['price'],
            width: AppSize.s140.w,
            height: AppSize.s197.h,
            imageWidth: AppSize.s112.h,
            imageHeight: AppSize.s112.h,
          ),
          itemCount: newest.length,
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
          start: AppPadding.p11.w, top: AppSize.s3.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const LoZaBestSellerWidget(
        image: ImageAssets.mask,
        text1: AppStrings.justoGravidaSemper,
        text2: AppStrings.p29_00,
      ),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p90.w,
          top: AppPadding.p9.h,
          bottom: AppPadding.p9.h,
        ),
        child: const LoZaSeparatorWidget(),
      ),
    );
  }
}
