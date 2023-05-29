import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_button_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_field_of_options_widget.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/filters/viewmodel/filters_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/assets_manager.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  final FiltersViewModel _viewModel = FiltersViewModel();



  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {

    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppPadding.p52.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
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
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              AppStrings.filters,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          const LoZaSeparatorWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s60,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppPadding.p15.w,
            ),
            child: Text(
              AppStrings.filterByPrice,
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.fs17.sp),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          StreamBuilder(
            stream: _viewModel.outPutRangeValue,
            builder: (context, snapshot) {
              var rangeValue = snapshot.data;
              if (rangeValue != null) {
                return Column(
                children: [
                  SizedBox(
                    height: AppSize.s30.w,
                    child: RangeSlider(
                        values: rangeValue,
                        min: FiltersViewModel.min,
                        max: FiltersViewModel.max,
                        onChanged: (rangeVal) {
                          _viewModel.onRangeChange(rangeVal);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: AppPadding.p18.w,
                      end: AppPadding.p18.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${rangeValue.start.round()}',
                          style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.fs15.sp),
                        ),
                        Text(
                          '\$${rangeValue.end.round()}',
                          style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.fs15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          StreamBuilder(
            stream: _viewModel.outPutSelectedBrands,
            builder: (context, snapshot) {
              var selectedBrands = snapshot.data;
              if (selectedBrands != null) {
                return LoZaFieldOfOptionsWidget(
                    text: AppStrings.brand,
                    items: selectedBrands,
                    onTap: (){
                      _viewModel.showSelectedBrand(context, _viewModel.brands);
                    }
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          StreamBuilder(
            stream: _viewModel.outPutSelectedCategories,
            builder: (context, snapshot) {
              var selectedCategories = snapshot.data;
              if (selectedCategories != null) {
                return LoZaFieldOfOptionsWidget(
                    text: AppStrings.categories,
                    items: selectedCategories,
                    onTap: (){
                      _viewModel.showSelectedCategories(context, _viewModel.categories);
                    }
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppSize.s15.w,
            ),
            child: Text(
              AppStrings.colors,
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.fs17.sp),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s40,
          ),
          StreamBuilder(
            stream: _viewModel.outPutSelectedColor,
            builder: (context, snapshot) {
              return Row(
                children: List.generate(AppConstants.circleAvatarCount, (index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: AppSize.s15.w,
                  ),
                    child: Stack(
                      alignment: Alignment.center,
                      children : [
                        InkWell(
                          onTap: (){
                            _viewModel.changeColor(index);
                          },
                          child: CircleAvatar(
                            radius: AppSize.s14.w,
                            backgroundColor: _viewModel.colors[index],
                          ),
                        ),
                        _viewModel.isSelected == index ? SvgPicture.asset(
                          ImageAssets.hollowCircle,
                          width: AppSize.s35.w,
                          height:  AppSize.s35.w,
                        ) : const SizedBox(),
                      ],
                    ),
                  );
                }),
              );
            }
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: AppSize.s80.h,
                child: LoZaButtonWidget(
                  text: AppStrings.apply,
                  toUpperCase: true,
                  onPressed: (){},
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}


