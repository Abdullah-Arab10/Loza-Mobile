import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> loZaToastWidget({
    required String msg,
    required Toast toastLength,
    required ToastGravity gravity,
    required int timeInSecForIosWeb,
    required Color backgroundColor,
    required Color textColor,
    required double fontSize,
}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: timeInSecForIosWeb,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
);
