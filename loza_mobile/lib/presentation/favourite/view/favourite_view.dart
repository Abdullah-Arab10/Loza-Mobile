import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loza_mobile/app/app_prefs.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_best_seller_card.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/favourite/viewmodel/favourite_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  final FavouriteViewModel _viewModel = instance<FavouriteViewModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() async {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _getContentWidget());
  }

  Widget _getContentWidget() {
    return StreamBuilder<FavouriteViewObject>(
        stream: _viewModel.outputFavouriteData,
        builder: (context, snapshot) {
          var favouriteViewObject = snapshot.data;
          if (favouriteViewObject != null) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: AppPadding.p52.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: AppPadding.p15.w,
                              end: AppPadding.p15.w,
                              bottom: AppPadding.p15.h),
                          child: SvgPicture.asset(
                            ImageAssets.close,
                            width: AppSize.s26.w,
                            height: AppSize.s26.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: AppPadding.p15.w,
                        ),
                        child: Text(
                          AppStrings.favouriteList,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      const LoZaSeparatorWidget(),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s60,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      _getShoppingCardsWidget(
                          favouriteViewObject.userFavourite),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _getShoppingCardsWidget(List<Map<String, dynamic>> userCart) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
        start: AppPadding.p11.w,
        end: AppPadding.p11.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Stack(
        children: [
          LoZaBestSellerWidget(
            image: userCart[index]['productImage'],
            text1: userCart[index]['name'],
            text2: userCart[index]['price'],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: AppPadding.p10.w,
                ),
                child: InkWell(
                  onTap: () {
                    _viewModel.postFavorite(userCart[index]['id']);
                  },
                  child: userCart[index]['isFavorite'] == true
                      ? Icon(
                          Icons.favorite,
                          size: AppSize.s18.w,
                          color: ColorManager.black,
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: AppSize.s18.w,
                          color: ColorManager.black,
                        ),
                )),
          ),
        ],
      ),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPadding.p100.w,
          top: AppPadding.p9.h,
          bottom: AppPadding.p9.h,
        ),
        child: const LoZaSeparatorWidget(),
      ),
      itemCount: userCart.length,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
