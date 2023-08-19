import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaOrderDetailsWidget extends StatelessWidget {
  final int? quan;
  final TextStyle? style;
  final String text;
  final double price;

  const LoZaOrderDetailsWidget(
      {
        Key? key,
        this.quan,
        this.style,
        required this.text,
        required this.price,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        quan != null
            ? Text(
                '$quan',
                style: getRegularStyle(
                    color: ColorManager.blue, fontSize: FontSize.fs20.sp),
              )
            : const SizedBox(),
        SizedBox(
          width: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        Text(
          text,
          style: getRegularStyle(
              color: ColorManager.black.withAlpha(100),
              fontSize: FontSize.fs20.sp),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '\$$price',
              style: style ??
                  getRegularStyle(
                      color: ColorManager.blue, fontSize: FontSize.fs20.sp),
            ),
          ),
        ),
      ],
    );
  }
}
