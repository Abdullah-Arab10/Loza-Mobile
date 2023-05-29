import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loza_mobile/presentation/filters/viewmodel/multi_select_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/colors_manager.dart';
import 'package:loza_mobile/presentation/resources/font_manager.dart';
import 'package:loza_mobile/presentation/resources/strings_manager.dart';
import 'package:loza_mobile/presentation/resources/styles_manager.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final MultiSelectViewModel _viewModel = MultiSelectViewModel();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.selectBrand),
      content: SingleChildScrollView(
        child: StreamBuilder(
            stream: _viewModel.outPutIsSelected,
            builder: (context, snapshot) {
              var items = snapshot.data;
              if(items != null){
                return ListBody(
                  children: widget.items.map((item) {
                    return CheckboxListTile(
                      value: items.contains(item),
                      title: Text(
                          item,
                          style: Theme.of(context).textTheme.titleSmall,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) =>
                          _viewModel.itemChange(item, isChecked!),
                    );
                  }).toList(),
                );}else{
                return Container();
              }
            }
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _viewModel.cancel(context),
          child: Text(
              AppStrings.cancel,
            style: getRegularStyle(
                color: ColorManager.black,
              fontSize: FontSize.fs14.sp,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _viewModel.submit(context),
          child: Text(
            AppStrings.submit,
            style: getRegularStyle(
              color: ColorManager.white,
              fontSize: FontSize.fs14.sp,
            ),
          ),
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