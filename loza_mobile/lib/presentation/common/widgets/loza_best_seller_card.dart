import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaBestSellerWidget extends StatelessWidget {
  final bool? isArrow;
  final String image;
  final String text1;
  final String text2;

  const LoZaBestSellerWidget({
    Key? key,
    this.isArrow = false,
    required this.image,
    required this.text1,
    required this.text2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s9,
      child: InkWell(
        onTap: (){},
        child: Card(
          child: Row(
            children: [
              Image.asset(
               image,
                width: AppSize.s70.h,
                height: AppSize.s70.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s28,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s105,
                  ),
                  Text(
                    text2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              if (isArrow!)
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            end: AppPadding.p15.w,
                          ),
                          child: SvgPicture.asset(ImageAssets.arrow),
                        )))
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
