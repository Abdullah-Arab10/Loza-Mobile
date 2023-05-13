import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/material_colors_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.white,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: buildMaterialColor(ColorManager.black)),
    primaryColorLight: ColorManager.lightGrey,
    primaryColorDark: ColorManager.grey,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.grey1,
    // ripple effect color

    // cardView theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s0),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s0,
        shadowColor: ColorManager.grey,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.fs17, color: ColorManager.black)),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.black,
        splashColor: ColorManager.grey1),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.fs15),
      backgroundColor: ColorManager.black,
      disabledBackgroundColor: ColorManager.black.withAlpha(100),
    )),

    textTheme: TextTheme(
      labelLarge: getBlackStyle(color: ColorManager.black, fontSize: FontSize.fs25.sp),
        displayLarge:
            getBlackStyle(color: ColorManager.black, fontSize: FontSize.fs33.sp),
        displayMedium:
            getHeavyStyle(color: ColorManager.black, fontSize: FontSize.fs24.sp),
        headlineLarge:
            getHeavyStyle(color: ColorManager.darkGrey, fontSize: FontSize.fs16.sp),
        headlineMedium: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs14.sp),
        titleMedium:
            getHeavyStyle(color: ColorManager.white, fontSize: FontSize.fs15.sp),
        titleSmall:
            getHeavyStyle(color: ColorManager.black, fontSize: FontSize.fs15.sp),
        bodyLarge: getBookStyle(color: ColorManager.black.withAlpha(100),fontSize: FontSize.fs13.sp),
        bodySmall: getRegularStyle(color: ColorManager.black,fontSize: FontSize.fs16.sp),
        bodyMedium:
            getBookStyle(color: ColorManager.black, fontSize: FontSize.fs16.sp),
        labelSmall:
            getBlackStyle(color: ColorManager.black, fontSize: FontSize.fs12.sp),
        labelMedium:  getRegularStyle(color: ColorManager.black.withAlpha(100),fontSize: FontSize.fs16.sp),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getBookStyle(color: ColorManager.grey, fontSize: FontSize.fs17),
      // label style
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.fs17),
      errorStyle: getRegularStyle(color: ColorManager.red),
    ),
  );
}
