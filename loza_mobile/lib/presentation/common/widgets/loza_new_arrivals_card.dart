import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaNewArrivalsCard extends StatelessWidget {

  final double width;
  final double height;
  final double imageWidth;
  final double imageHeight;

  const LoZaNewArrivalsCard({
    Key? key,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
                children: [
              Container(
                width: double.infinity,
                color: ColorManager.veryLightGrey,
                child: Image.asset(
                  ImageAssets.mask,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(
                  top: AppPadding.p9.w,
                  end: AppPadding.p9.w,
                ),
                child: SvgPicture.asset(ImageAssets.heart),
              )
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s70,
            ),
            Text(
             AppStrings.nancyChair,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              AppStrings.p29_00,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
