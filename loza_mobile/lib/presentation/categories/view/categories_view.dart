import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/presentation/categories/viewmodel/categories_viewmodel.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_best_seller_card.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

import '../../common/widgets/loza_separator_widget.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final CategoriesViewModel _viewModel = CategoriesViewModel();

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
    return StreamBuilder(
      stream: _viewModel.outputCategoriesObject,
      builder: (context, snapshot) => Scaffold(
        backgroundColor: ColorManager.white,
        body: _getContentWidget(snapshot.data),
      ),
    );
  }

  Widget _getContentWidget(List<CategoriesObject>? categoriesObject) {
    if (categoriesObject == null) {
      return Container();
    } else {
      return Padding(
          padding: EdgeInsetsDirectional.only(
            top: AppPadding.p52.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.categories,
                        style: Theme.of(context).textTheme.titleSmall,
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
              child: Center(
                child: ListView.builder(
                  padding: EdgeInsetsDirectional.only(
                      start: AppPadding.p11.w, top: AppPadding.p19.h),
                  itemBuilder: (context, index) => Column(
                    children: [
                      LoZaBestSellerWidget(
                          isArrow: categoriesObject[index].isArrow,
                          image: categoriesObject[index].imagePath,
                          text1: categoriesObject[index].text1,
                          text2: categoriesObject[index].text2),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p5.w,
                          top: AppPadding.p9.h,
                          bottom: AppPadding.p9.h,
                        ),
                        child: const LoZaSeparatorWidget(),
                      ),
                    ],
                  ),
                  itemCount: AppConstants.itemCount,
                ),
              ),
            ),
          ]));
    }
  }
}
