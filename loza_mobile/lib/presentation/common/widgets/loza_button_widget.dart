import 'package:flutter/material.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';

class LoZaButtonWidget extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? color;
  final bool? toUpperCase;
  final AssetImage? image;

  const LoZaButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.color,
    this.toUpperCase,
    this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorManager.black,
      ),
      child: Text(
        toUpperCase ?? false ? text.toUpperCase() : text,
        style: textStyle ?? Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
