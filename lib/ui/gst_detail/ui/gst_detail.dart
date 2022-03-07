import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/ui/base_ui/base_ui.dart';
import 'package:gst_app/ui/gst_detail/bloc/gst_search_bloc.dart';
import 'package:gst_app/ui/gst_detail/bloc/gst_search_bloc_state.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/address_widget.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/card_item.dart';
import 'package:gst_app/ui/gst_detail/ui/sub_widget/header.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/date_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class GSTDetailScreen extends StatefulWidget {
  final GSTDetail detail;

  const GSTDetailScreen(this.detail, {Key? key}) : super(key: key);

  @override
  State<GSTDetailScreen> createState() => _GSTDetailScreenState();
}

class _GSTDetailScreenState extends State<GSTDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BaseUI<GSTSearchDetailCubit, GSTDetailCubitState>(
        onDataLoaded: (data) {
          showDialog(
            builder: (context) => const AlertDialog(
              content: Text("Data loaded"),
            ),
            context: context,
          );
        },
        child: Container(
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
                      Header(widget.detail),
                      AddressWidget(widget.detail),
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
                value: widget.detail.stateJurisdiction,
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              color: AppColors.white,
              child: CardItem(
                label: kCentralJurisdiction,
                value: widget.detail.centralJurisdiction,
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              color: AppColors.white,
              child: CardItem(
                label: kTaxpayerType,
                value: widget.detail.taxPayerType,
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
          value: widget.detail.businessType,
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
              value:
                  DateTimeUtils.getDate(widget.detail.registrationDate ?? ''),
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
        getGSTData();
        // locator<NavigationService>().pop();
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

  void getGSTData() {
    print("get gst data is called");
    FocusScope.of(context).unfocus();
    context.read<GSTSearchDetailCubit>().searchGSTRepository("dfasdf");
  }
}
