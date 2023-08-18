import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_textfield_widget.dart';
import 'package:loza_mobile/presentation/rating/viewmodel/rating_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class RatingView extends StatefulWidget {

  final String image;
  final String name;
  final int id;

  const RatingView({Key? key, required this.image,required this.name,required this.id}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final TextEditingController _ratingController = TextEditingController();
  final AddReviewViewModel _viewModel = instance<AddReviewViewModel>();

  late double rating;

  _bind(){
    _ratingController
        .addListener(() => _viewModel.setReviewName(_ratingController.text));
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
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          color: ColorManager.white,
          child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppPadding.p52.h,
                start: AppPadding.p15.w,
              ),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Builder(builder: (context) {
                          return TextButton(
                            onPressed: () {
                              _viewModel.addReview(widget.id, rating);
                            },
                            child: Text(
                              'post',
                              style: getHeavyStyle(
                                  color: ColorManager.blue,
                                  fontSize: FontSize.fs15.sp),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: getHeavyStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.fs13.sp),
                            ),
                            Text(
                              'rate this app',
                              style: getHeavyStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.fs13.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s30,
                        ),
                        Image.network(
                          '${Constants.baseUrl}${widget.image}',
                          width: AppSize.s60.w,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / AppSize.s30,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        ImageAssets.close,
                        width: AppSize.s26.w,
                        height: AppSize.s26.w,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / AppSize.s30,
                    ),
                  ],
                ),
              ]))),
      Expanded(
        child: Padding(
            padding: EdgeInsets.only(
              left: AppPadding.p32.w,
              right: AppPadding.p32.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  minRating: 1,
                  itemSize: AppSize.s40.w,
                  itemPadding: EdgeInsets.symmetric(horizontal: AppPadding.p6.w),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: ColorManager.black,
                  ),
                  onRatingUpdate: (value) {
                    rating = value;
                  },
                ),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height / AppSize.s30,
                ),
                LoZaTextFieldWidget(
                  controller: _ratingController,
                  label: 'Rating',
                ),
              ],
            )),
      ),
    ]);
  }
}
