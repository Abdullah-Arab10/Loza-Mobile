import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/app/di.dart';
import 'package:loza_mobile/presentation/common/widgets/loza_separator_widget.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/add_details_viewmodel.dart';
import 'package:loza_mobile/presentation/product_details/viewmodel/product_details_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/constants.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/values_manager.dart';

class AddDetailsView extends StatefulWidget {
  final String name;
  final int userId;

  const AddDetailsView({Key? key, required this.name, required this.userId})
      : super(key: key);

  @override
  State<AddDetailsView> createState() => _AddDetailsViewState();
}

class _AddDetailsViewState extends State<AddDetailsView> {

  // final ProductDetailsViewModel _productDetailsViewModel =
  //     instance<ProductDetailsViewModel>();

  final AddDetailsViewModel _viewModel = instance<AddDetailsViewModel>();

  String? color;
  int? quan;

  _bind() {
    _viewModel.start();
    _viewModel.isPostToCartSuccessfullyStreamController.stream.listen((isPost) {
      if(isPost){
        print(isPost);
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppSize.s10.w,
          bottom: AppSize.s10.w,
          start: AppSize.s15.w,
        ),
        child: const Text('Add color and quantity'),
      ),
      contentPadding: EdgeInsetsDirectional.zero,
      titlePadding: EdgeInsetsDirectional.zero,
      content: SingleChildScrollView(
        child: Column(
          children: [
            const LoZaSeparatorWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppSize.s15.w,
                end: AppSize.s15.w,
              ),
              child: StreamBuilder(
                  stream: _viewModel.outputsChangeColor,
                  builder: (context, snapshot) {
                    color = snapshot.data;
                    var nameOfColor = snapshot.data;
                    return Column(
                      children: List.generate(AppConstants.circleAvatarCount,
                          (index) {
                        return RadioListTile(
                            title: Text(
                              _viewModel.nameOfColors[index],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            secondary: CircleAvatar(
                              radius: AppSize.s14.w,
                              backgroundColor: _viewModel.colors[index],
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsetsDirectional.zero,
                            value: _viewModel.nameOfColors[index],
                            groupValue: nameOfColor,
                            onChanged: (val) {
                              _viewModel.changeColor(val);
                            });
                      }),
                    );
                  }),
            ),
            const LoZaSeparatorWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: AppSize.s7.w,
                bottom: AppSize.s7.w,
                start: AppSize.s15.w,
                end: AppSize.s15.w,
              ),
              child: StreamBuilder(
                  stream: _viewModel.outputsQuantity,
                  builder: (context, snapshot) {
                    quan = snapshot.data;
                    var quantity = snapshot.data;
                    if (quantity != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _viewModel.remove(quantity);
                            },
                            child: CircleAvatar(
                                radius: AppSize.s14.w,
                                backgroundColor: ColorManager.red,
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: ColorManager.white,
                                  ),
                                )),
                          ),
                          Text(
                            '$quantity',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          InkWell(
                            onTap: () {
                              _viewModel.add(quantity);
                            },
                            child: CircleAvatar(
                                radius: AppSize.s14.w,
                                backgroundColor: ColorManager.blue,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: ColorManager.white,
                                  ),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            const LoZaSeparatorWidget(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(AppStrings.cancel,
              style: Theme.of(context).textTheme.titleSmall),
        ),
        ElevatedButton(
          onPressed: () => {
            _viewModel.postToCart(PostToCartObject(widget.userId,
                widget.name, color ?? '', _viewModel.valueOfColor(color), quan ?? 0))
          },
          child: Text(AppStrings.submit,
              style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
