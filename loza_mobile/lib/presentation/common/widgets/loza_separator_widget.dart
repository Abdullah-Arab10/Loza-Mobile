import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaSeparatorWidget extends StatelessWidget {

  final Color? color;

  const LoZaSeparatorWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s1.h,
      color: color ?? ColorManager.veryLightGrey,
    );
  }
}
