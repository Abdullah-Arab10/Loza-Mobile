import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/product_details_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class ProductDetailsView extends StatefulWidget {

  final Product product;

  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  final ProductDetailsViewModel _viewModel = instance<ProductDetailsViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(context, widget.product),
    );
  }

  Widget _getContentWidget(BuildContext context, Product product) {
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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            ImageAssets.leftArrow,
                            width: AppSize.s26.w,
                            height: AppSize.s26.w,
                          ),
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
                            product.name,
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
                              Text('${product.totalRate}',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '\$${product.price}',
                        style: getRegularStyle(
                            color: ColorManager.red, fontSize: FontSize.fs18.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s60,
                ),
                Image.network(
                  '${Constants.baseUrl}${product.productImage}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Stack(alignment: Alignment.bottomCenter, children: [
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
                Expanded(
                  child: TabBarView(
                    children: [
                      DescriptionPage(
                        product.description,
                        product.productDimensions,
                        product.color,
                        product.category,
                      ),
                      const ReviewPage(),
                      const AdditionalInformationPage(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: AppPadding.p18.h,
                    bottom: AppPadding.p18.h,
                    start: AppPadding.p15.w,
                    end: AppPadding.p15.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: AppSize.s38.h,
                          child: LoZaButtonWidget(
                            onPressed: () {
                              _viewModel.showAdditionalDetails(product.name, 4,context);
                            },
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class DescriptionPage extends StatelessWidget {
  final String description;
  final String dimensions;
  final String color;
  final int category;

  const DescriptionPage(this.description, this.dimensions, this.color, this.category,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: AppPadding.p15.h,
            start: AppPadding.p15.w,
            end: AppPadding.p15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
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
                        'Categories:',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Color:',
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
                        '$category',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        color,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        dimensions,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
