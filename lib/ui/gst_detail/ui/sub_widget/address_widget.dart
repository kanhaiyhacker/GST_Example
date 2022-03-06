import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/card_item.dart';
import 'package:gst_app/ui/widgets/advance_line.dart';
import 'package:gst_app/ui/widgets/line.dart';
import 'package:gst_app/ui/widgets/staus_badge.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class AddressWidget extends StatelessWidget {
  final GSTDetail detail;

  const AddressWidget(this.detail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSizeUtil.marginHorizontal10Vertical8,
      child: Card(
        elevation: 0,
        child: Places(),
      ),
    );
  }

  Widget roundIcon(IconData icon) {
    return CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.appGreenLight,
        child: Icon(
          icon,
          color: AppColors.appGreenDark,
        ));
  }

  Widget Places() {
    return LayoutBuilder(builder: (context, builder) {
      return Padding(
        padding: AppSizeUtil.paddingAll4,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(height: 120, child: verticalLines()),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardItem(
                          label: kPrincipalAddress, value: detail.address ?? ""),
                      const SizedBox(height: 16),
                      CardItem(
                          label: kAdditionalPlace,
                          value: detail.additionalPlace ?? "")
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    });
  }

  Widget verticalLines() {
    return Column(
      children: <Widget>[
        roundIcon(Icons.location_on_rounded),
        Expanded(
          child: AdvancedLine(
            direction: Axis.vertical,
            line: SolidLine(),
          ),
        ),
        roundIcon(Icons.house),
      ],
    );
  }
}
