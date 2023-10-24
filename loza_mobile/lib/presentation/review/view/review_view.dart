import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_review_card_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';
import 'package:loza_mobile/presentation/review/viewmodel/review_viewmodel.dart';

class ReviewView extends StatefulWidget {

  final int productId;

  const ReviewView({Key? key,required this.productId}) : super(key: key);

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  final ReviewViewModel _viewModel = instance<ReviewViewModel>();

  _bind(){
    _viewModel.getReview(widget.productId);
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
      body: SafeArea(child: _getContentWidget()),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<ReviewViewObject>(
        stream: _viewModel.outputReviewData,
        builder: (context, snapshot) {
          var reviews = snapshot.data;
          if (reviews != null) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                  top: AppPadding.p52.h,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: AppPadding.p15.w,
                            end: AppPadding.p15.w,
                            bottom: AppPadding.p15.h),
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
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w,
                        ),
                        child: Text(
                          AppStrings.reviews,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      const LoZaSeparatorWidget(),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsetsDirectional.only(
                            start: AppPadding.p11.w,
                            top: AppSize.s11.h,
                          ),
                          itemBuilder: (context, index) => LoZaReviewCardWidget(
                            name: reviews.userReview[index]['userName'],
                            rate: reviews.userReview[index]['rate'],
                            review: reviews.userReview[index]['rreviews'],
                          ),
                          itemCount: reviews.userReview.length,
                          separatorBuilder: (BuildContext context, int index) => Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: AppPadding.p60.w,
                              top: AppPadding.p9.h,
                              bottom: AppPadding.p9.h,
                            ),
                            child: const LoZaSeparatorWidget(),
                          ),
                        ),
                      ),
                    ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
