import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaBestSellerWidget extends StatelessWidget {
  const LoZaBestSellerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s9,
      child: Card(
        child: Row(
          children: [
            Image.asset(
              ImageAssets.chair,
              width: AppSize.s70.h,
              height: AppSize.s70.h,
            ),
            SizedBox(width: MediaQuery.of(context).size.width / AppSize.s28,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.houndstoothSideZipper,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s105,
                ),
                Text(
                  AppStrings.p29_00,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
