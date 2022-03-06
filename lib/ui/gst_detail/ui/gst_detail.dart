import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/service/route_service/locator.dart';
import 'package:gst_app/service/route_service/navigation_service.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/address_widget.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/card_item.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/header.dart';
import 'package:gst_app/ui/widgets/primary_button.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/date_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class GSTDetailScreen extends StatelessWidget {
  final GSTDetail detail;

  const GSTDetailScreen(this.detail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: AppSizeUtil.paddingAll4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Header(detail),
                    AddressWidget(detail),
                    _taxPayerDetails(),
                    _businessType(),
                    _registrationTime(),
                  ],
                ),
              ),
            ),
            _bottomButton(context)
          ],
        ),
      ),
    );
  }

  Padding _taxPayerDetails() {
    return Padding(
      padding: AppSizeUtil.paddingHorizontal10Vertical8,
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              color: AppColors.white,
              child: CardItem(
                label: kStateJurisdiction,
                value: detail.stateJurisdiction,
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              color: AppColors.white,
              child: CardItem(
                label: kCentralJurisdiction,
                value: detail.centralJurisdiction,
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              color: AppColors.white,
              child: CardItem(
                label: kTaxpayerType,
                value: detail.taxPayerType,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _businessType() {
    return Padding(
      padding: AppSizeUtil.paddingHorizontal10Vertical8,
      child: Card(
        elevation: 0,
        color: AppColors.white,
        child: CardItem(
          label: kConstitutionOfBusiness,
          value: detail.businessType,
        ),
      ),
    );
  }

  Padding _registrationTime() {
    return Padding(
      padding: AppSizeUtil.paddingHorizontal10Vertical8,
      child: Card(
        elevation: 0,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardItem(
              label: kDateOfRegistration,
              value: DateTimeUtils.getDate(detail.registrationDate ?? ''),
            ),
            const CardItem(
              label: kDateOfCancellation,
              value: '..',
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().pop();
      },
      child: Container(
        color: AppColors.appGreenDark,
        padding: AppSizeUtil.paddingHorizontal16Vertical16,
        child: Center(
          child: Text(
            kGSTReturnStatus,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
