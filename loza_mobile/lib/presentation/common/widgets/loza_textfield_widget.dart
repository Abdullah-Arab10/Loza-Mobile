import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';

class LoZaTextFieldWidget extends StatelessWidget {

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final String? error;
  final VoidCallback? suffixPressed;
  final bool? isPassword;
  final IconData? suffix;
  final String? initial;
  final bool? enable;

  const LoZaTextFieldWidget({
    Key? key,
    required this.label,
    required this.error,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed,
    this.enable,
    this.initial
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.fs16.sp),
        cursorColor: ColorManager.black,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          errorText: error,
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.black.withAlpha(100),
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.black,
              width: 1.5,
            ),
          ),
        ),
        initialValue: initial,
        enabled: enable,
      ),
    );
  }
}
