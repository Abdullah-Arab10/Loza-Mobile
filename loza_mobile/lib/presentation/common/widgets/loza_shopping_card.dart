import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';
import 'package:loza_mobile/presentation/shopping_cart/viewmodel/shopping_cart_viewmodel.dart';

class LoZaShoppingCardWidget extends StatefulWidget {
  final String image;
  final String text1;
  final String text2;

  const LoZaShoppingCardWidget({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  State<LoZaShoppingCardWidget> createState() => _LoZaShoppingCardWidgetState();
}

class _LoZaShoppingCardWidgetState extends State<LoZaShoppingCardWidget> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s7,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
                children: [
              Image.asset(
                widget.image,
                fit: BoxFit.fill,
                width: AppSize.s80.h,
                height: AppSize.s80.h,
              ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: AppSize.s7.w,
                      top: AppSize.s7.w,
                    ),
                    child: CircleAvatar(
                      radius: AppSize.s8.w,
                      backgroundColor: ColorManager.black,
                      child: Text(
                        '$count',
                        textAlign: TextAlign.center,
                        style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.fs11.sp),
                      ),
                    ),
                  ),
            ]),
            SizedBox(
              width: MediaQuery.of(context).size.width / AppSize.s28,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text1,
                    maxLines: AppConstants.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: getHeavyStyle(color: ColorManager.black,fontSize: FontSize.fs16.sp),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s105,
                  ),
                  Text(
                    widget.text2,
                    maxLines: AppConstants.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s105,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppSize.s4_7.w,
                        backgroundColor: ColorManager.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height / AppSize.s105,
                      ),
                      Text(
                        'Black',
                        maxLines: AppConstants.maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: AppPadding.p9.w
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(count <= 4){
                          count ++;
                        }else{
                          count = 1;
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: AppSize.s14.w,
                      backgroundColor: ColorManager.blue,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                          size: AppSize.s22.w,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                            radius: AppSize.s14.w,
                            backgroundColor: ColorManager.red,
                            child: Center(
                              child: SvgPicture.asset(
                                ImageAssets.delete,
                                width: AppSize.s22.w,
                                height: AppSize.s22.w,
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
