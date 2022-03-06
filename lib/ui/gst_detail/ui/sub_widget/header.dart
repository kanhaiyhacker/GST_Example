import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/ui/gst_search/ui/sub_widget/toggle_button.dart';
import 'package:gst_app/ui/widgets/staus_badge.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class Header extends StatelessWidget {
  final GSTDetail detail;

  const Header(this.detail, {Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    locator<NavigationService>().pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  )),
              const SizedBox(width: 5),
              Text(
                kGSTProfile,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            kGSTINOfTheTaxPayer,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 5),
          Text(
            detail.gstNumber ?? '',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 16),
          Text(detail.name ?? '', style: Theme.of(context).textTheme.headline2),
          const SizedBox(height: 10),
          Row(
            children: [
              StatusBadge(detail.status ?? ''),
            ],
          )
        ],
      ),
    );
  }
}
