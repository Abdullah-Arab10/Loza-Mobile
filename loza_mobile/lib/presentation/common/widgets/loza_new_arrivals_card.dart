import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaNewArrivalsCard extends StatelessWidget {
  const LoZaNewArrivalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
              children: [
            Image.asset(
              ImageAssets.mask,
              width: AppSize.s112.h,
              height: AppSize.s112.h,
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
    );
  }
}
