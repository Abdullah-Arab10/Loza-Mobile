import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaReviewCardWidget extends StatelessWidget {

  final String name;
  final double rate;
  final String review;

  const LoZaReviewCardWidget({
    Key? key,
    required this.name,
    required this.rate,
    required this.review
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: AppSize.s22.w,
                backgroundImage: const AssetImage(
                  ImageAssets.userPic,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '2 hours ago',
                      style: getBookStyle(
                          color: ColorManager.black
                              .withAlpha(AppConstants.withAlpha),
                          fontSize: FontSize.fs11.sp),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s100,
                    ),
                    Row(
                      children: [
                        Text(
                          '$rate',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SvgPicture.asset(
                          ImageAssets.starOfRating,
                        ),
                      ],
                    ),
                    Text(
                      review,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / AppSize.s122,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
