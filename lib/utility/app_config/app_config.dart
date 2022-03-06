import 'package:flutter/material.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';

final AppThemeData = ThemeData(
    primaryColor: AppColors.appGreen,
    primaryColorDark: AppColors.appGreenDark,
    primaryColorLight: AppColors.appGreen,
    canvasColor: AppColors.background,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: AppSizeUtil.heading1,
          color: AppColors.white,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: AppSizeUtil.heading2,
          color: AppColors.white,
          fontWeight: FontWeight.w700),
      headline3:
          TextStyle(fontSize: AppSizeUtil.heading2, color: AppColors.white),
      subtitle1: TextStyle(
          fontSize: AppSizeUtil.heading3, color: AppColors.subtitleText),
      subtitle2: TextStyle(
          fontSize: AppSizeUtil.subTitle2, color: AppColors.subtitleText),
      button: TextStyle(color: AppColors.white),
      bodyText1: TextStyle(
          fontSize: AppSizeUtil.body1,
          color: AppColors.black,
          fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
        fontSize: AppSizeUtil.body2,
        color: AppColors.subtitleText,
      ),
    ));
