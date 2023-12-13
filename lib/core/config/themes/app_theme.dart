import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
    primaryColor: AppColors.kButtonColor,
    brightness: Brightness.light,
    textTheme: TextTheme(
      // main title
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kTitleColor
      ),

      // sub title
      titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kTitleColor
      ),

      // app button text
      labelLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),

      //body text
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.kFontColor,
      ),

      // caption
      bodySmall:TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kFontColor,
      ),
    ),
  );
}