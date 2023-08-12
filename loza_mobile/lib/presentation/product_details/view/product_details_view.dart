import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/product_details_viewmodel.dart';
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
  final ProductDetailsViewModel _viewModel =
      instance<ProductDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    Product productObject = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(productObject),
    );
  }

  Widget _getContentWidget(Product productObject) {
    return  DefaultTabController(
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
                                //Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                ImageAssets.leftArrow,
                                width: AppSize.s26.w,
                                height: AppSize.s26.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s30,
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
                            width:
                                MediaQuery.of(context).size.width / AppSize.s30,
                          ),
                          SvgPicture.asset(
                            ImageAssets.favouriteIcon,
                            width: AppSize.s26.w,
                            height: AppSize.s26.w,
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s30,
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
                                productObject.name,
                                style: getHeavyStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.fs17.sp),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppSize.s170,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.stars,
                                    width: AppSize.s17.w,
                                    height: AppSize.s17.w,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        AppSize.s36,
                                  ),
                                  Text('${productObject.totalRate}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '\$${productObject.price}',
                            style: getRegularStyle(
                                color: ColorManager.red,
                                fontSize: FontSize.fs18.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    Image.asset(
                      productObject.productImage,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Stack(alignment: Alignment.bottomCenter, children: [
                      const LoZaSeparatorWidget(),
                      TabBar(
                          indicatorColor: ColorManager.black,
                          labelStyle: Theme.of(context).textTheme.titleLarge,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.titleSmall,
                          unselectedLabelColor: ColorManager.black
                              .withAlpha(AppConstants.withAlpha),
                          labelPadding: EdgeInsetsGeometry.lerp(
                              EdgeInsetsDirectional.zero,
                              EdgeInsetsDirectional.only(
                                  start: AppPadding.p15.w,
                                  end: AppPadding.p30.w),
                              1),
                          indicatorPadding: EdgeInsetsGeometry.lerp(
                              EdgeInsetsDirectional.zero,
                              EdgeInsetsDirectional.only(
                                  start: AppPadding.p15.w,
                                  end: AppPadding.p30.w),
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
                              productObject.description,
                              productObject.category,
                              productObject.color),
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
                                  _viewModel.showAdditionalDetails(context);
                                },
                                text: 'add to cart',
                                toUpperCase: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s30,
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
  String description;
  int category;
  String color;

  DescriptionPage(this.description, this.category, this.color, {Key? key})
      : super(key: key);

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
                      '185 x 40 x 62 cm (L x W x H)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
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
