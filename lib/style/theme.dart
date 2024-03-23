import 'package:flutter/material.dart';

import 'appcolors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLightColor,
        primary: AppColors.primaryLightColor ,
        secondary: AppColors.SecondaryLightColor ,
       tertiary: AppColors.SecondaryLightColor
    ),


    useMaterial3: false,



    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 25 ,
        color: Colors.black
      ),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14 ,
          color: AppColors.smalltexttitlecolor,
      ),
        labelMedium: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w600,
        fontSize: 14
    )
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryLightColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    ),

  );

}