import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaShoppingCardWidget extends StatefulWidget {
  final String image;
  final String text1;
  final double text2;
  final String colorName;
  final int colorNum;
  final int? quan;

  const LoZaShoppingCardWidget({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.colorName,
    required this.colorNum,
    this.quan,
  }) : super(key: key);

  @override
  State<LoZaShoppingCardWidget> createState() => _LoZaShoppingCardWidgetState();
}

class _LoZaShoppingCardWidgetState extends State<LoZaShoppingCardWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
              children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                '${Constants.baseUrl}${widget.image}',
                fit: BoxFit.fill,
                width: AppSize.s80.h,
                height: AppSize.s80.h,

              ),
            ),
                widget.quan != null ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: AppSize.s7.w,
                    top: AppSize.s7.w,
                  ),
                  child: CircleAvatar(
                    radius: AppSize.s10.w,
                    backgroundColor: ColorManager.black,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                         '${widget.quan}',
                        style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.fs12.sp),
                      ),
                    ),
                  ),
                ) : const SizedBox(),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s20,
          ),
          Column(
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
                '\$${widget.text2}',
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
                    backgroundColor: Color(widget.colorNum),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / AppSize.s105,
                  ),
                  Text(
                    widget.colorName,
                    maxLines: AppConstants.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: AppPadding.p9.w
                ),
                child: InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: AppSize.s26.w,
                      backgroundColor: ColorManager.red,
                      child: Center(
                        child: SvgPicture.asset(
                          ImageAssets.delete,
                          width: AppSize.s30.w,
                          height: AppSize.s30.w,
                        ),
                      )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
