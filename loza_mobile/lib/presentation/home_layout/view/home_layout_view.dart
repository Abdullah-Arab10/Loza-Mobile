import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_best_seller_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_some_widgets.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_new_arrivals_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/view/product_details_view.dart';
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
  final HomeLayoutViewModel _viewModel = instance<HomeLayoutViewModel>();

  _bind() {
    _viewModel.start();
  }

  _bind2() {
        _viewModel.productDetailsStreamController.stream.listen((product) {
          initProductDetailsModule();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsView(product: product),
            ),
          );
        });
  }

  @override
  void initState() {
    _bind();
    _bind2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        drawer: getDrawerWidget(context),
        body: _getContentWidget());
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
                                      AppStrings.blackFridays.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      AppStrings.saleUp.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    Text(
                                      AppStrings.to70Off.tr(),
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
                                          text: AppStrings.shopNow.tr(),
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
                  getSection(AppStrings.arrivals.tr()),
                  _getNewArrivalsWidget(homeViewObject.newest),
                  getSection(AppStrings.bestSellers.tr()),
                  //_getBestSellerWidget()
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _getNewArrivalsWidget(List<Map<String, dynamic>> newest) {
    return StreamBuilder<Map<int, bool>>(
        stream: _viewModel.outputFavoriteData,
        builder: (context, snapshot) {
          var favorite = snapshot.data;
          if (favorite != null) {
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
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      _viewModel.getProductDetails(newest[index]['id']);
                    },
                    child: Stack(alignment: Alignment.topRight, children: [
                      LoZaNewArrivalsCard(
                        userId: 4,
                        productId: newest[index]['id'],
                        image: newest[index]['productImage'],
                        name: newest[index]['name'],
                        price: newest[index]['price'],
                        width: AppSize.s140.w,
                        height: AppSize.s197.h,
                        imageWidth: AppSize.s112.h,
                        imageHeight: AppSize.s112.h,
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: AppPadding.p10.w,
                            end: AppPadding.p10.w,
                          ),
                          child: InkWell(
                            onTap: () {
                              _viewModel.postFavorite(newest[index]['id']);
                            },
                            child: favorite[newest[index]['id']] == true
                                ? Icon(
                                    Icons.favorite,
                                    size: AppSize.s18.w,
                                    color: ColorManager.black,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: AppSize.s18.w,
                                    color: ColorManager.black,
                                  ),
                          )),
                    ]),
                  ),
                  itemCount: newest.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: AppSize.s6.w,
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _getBestSellerWidget() {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
          start: AppPadding.p11.w, top: AppSize.s3.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => LoZaBestSellerWidget(
        image: ImageAssets.mask,
        text1: AppStrings.justoGravidaSemper.tr(),
        text2: 29.0,
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}