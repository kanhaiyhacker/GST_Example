import 'package:flutter/material.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizeUtil.paddingHorizontal16Vertical8,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizeUtil.homeHeading),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 5,
            backgroundColor: AppColors.appGreen,
          ),
          const SizedBox(width: 5),
          Text(
            status.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.appGreen),
          )
        ],
      ),
    );
  }
}
