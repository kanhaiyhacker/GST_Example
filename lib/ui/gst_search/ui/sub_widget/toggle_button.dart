import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc.dart';
import 'package:gst_app/ui/gst_search/bloc/gst_search_bloc_state.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';
import 'package:gst_app/utility/resources/strings.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

// const double width = 300.0;
const double height = 60.0;
const double gstSearch = -1;
const double gstStatus = 1;
const Color selectedColor = AppColors.appGreenDark;
const Color normalColor = AppColors.white;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color gstSearchColor;
  late Color gstStatusColor;

  @override
  void initState() {
    super.initState();
    xAlign = gstSearch;
    gstSearchColor = selectedColor;
    gstStatusColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      // width: width,
      height: height,
      padding: AppSizeUtil.paddingAll4,
      decoration: const BoxDecoration(
        color: AppColors.appGreenDark,
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: height,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = gstSearch;
                gstSearchColor = selectedColor;

                gstStatusColor = normalColor;
              });
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  kSearchGSTNumber,
                  style: TextStyle(
                    color: gstSearchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = gstStatus;
                gstStatusColor = selectedColor;

                gstSearchColor = normalColor;
              });
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  kGSTReturnStatus,
                  style: TextStyle(
                    color: gstStatusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
