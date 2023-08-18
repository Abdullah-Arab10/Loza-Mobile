import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/app/constants.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class LoZaNewArrivalsCard extends StatelessWidget {

  final int userId;
  final int productId;
  final String image;
  final String name;
  final double price;
  final double width;
  final double height;
  final double imageWidth;
  final double imageHeight;
  const LoZaNewArrivalsCard({
    Key? key,
    required this.userId,
    required this.productId,
    required this.image,
    required this.name,
    required this.price,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                width: double.infinity,
                color: ColorManager.veryLightGrey,
                child: Image.network(
                  '${Constants.baseUrl}$image',
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s70,
            ),
            Text(
              name,
              maxLines: AppConstants.maxLines,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '$price',
              maxLines: AppConstants.maxLines,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
