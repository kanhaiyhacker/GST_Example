import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/ui/gst_search/ui/sub_widget/toggle_button.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizeUtil.paddingHorizontal16Vertical8,
      decoration: const BoxDecoration(
        color: AppColors.appGreen,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSizeUtil.homeHeading),
            bottomRight: Radius.circular(AppSizeUtil.homeHeading)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.white,
                  ))
            ],
          ),
          const SizedBox(height: 5),
          Text(kSelectTypeof, style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 5),
          Text(kGSTNumberSearchTool,
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 20),
          const ToggleButton()
        ],
      ),
    );
  }
}
