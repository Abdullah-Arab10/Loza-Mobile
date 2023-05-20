import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return DefaultTabController(
      length: AppConstants.lengthOfTabs,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p52.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppPadding.p15.w,
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      ImageAssets.leftArrow,
                      width: AppSize.s26.w,
                      height: AppSize.s26.w,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.lamps,
                      style: Theme.of(context).textTheme.titleSmall,
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s150,
            ),
            const LoZaSeparatorWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppPadding.p9.h,
                start: AppPadding.p15.w,
                end: AppPadding.p15.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.justoGravidaSemper,
                        style: getHeavyStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.fs17.sp),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s170,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.stars,
                            width: AppSize.s17.w,
                            height: AppSize.s17.w,
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s36,
                          ),
                          Text('(323 reviews)',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '24.00',
                    style: getRegularStyle(
                        color: ColorManager.red, fontSize: FontSize.fs18.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s60,
            ),
            Image.asset(
              ImageAssets.justoGravidaSemper,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
              const LoZaSeparatorWidget(),
              TabBar(
                  indicatorColor: ColorManager.black,
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                  unselectedLabelColor:
                      ColorManager.black.withAlpha(AppConstants.withAlpha),
                  labelPadding: EdgeInsetsGeometry.lerp(
                      EdgeInsetsDirectional.zero,
                      EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w, end: AppPadding.p30.w),
                      1),
                  indicatorPadding: EdgeInsetsGeometry.lerp(
                      EdgeInsetsDirectional.zero,
                      EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w, end: AppPadding.p30.w),
                      1)!,
                  isScrollable: true,
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(
                      text: AppStrings.description,
                    ),
                    Tab(
                      text: AppStrings.review,
                    ),
                    Tab(
                      text: AppStrings.additionalInformation,
                    ),
                  ]),
            ]),
            const Expanded(
              child: TabBarView(
                children: [
                  DescriptionPage(),
                  ReviewPage(),
                  AdditionalInformationPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p15.h,
          start: AppPadding.p15.w,
          end: AppPadding.p15.w,
        ),
        child: Column(
          children: [
            Text(
              'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sku:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Categories:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Tags:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Dimensions:',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '545',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Furniture,Accessories',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '#furniture,#table',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '185 x 40 x 62 cm (L x W x H)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppPadding.p18.h,
                bottom: AppPadding.p18.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: AppSize.s38.h,
                      child: LoZaButtonWidget(
                        onPressed: (){},
                        text: 'add to cart',
                        toUpperCase: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  Image.asset(
                    ImageAssets.rectangularArrow,
                    width: AppSize.s40.h,
                    height: AppSize.s40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Review',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class AdditionalInformationPage extends StatelessWidget {
  const AdditionalInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Additional Information',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
