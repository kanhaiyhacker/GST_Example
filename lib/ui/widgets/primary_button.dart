import 'package:flutter/material.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Function? action;

  const PrimaryButton({Key? key, @required this.title, @required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          action!();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.appGreenDark)),
        child: Padding(
          padding: AppSizeUtil.paddingHorizontal16Vertical8,
          child: Text(
            title ?? "",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }
}
