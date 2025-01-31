import 'package:flutter/material.dart';
import 'package:kfc_project/dimensions.dart';
import 'colors.dart';

class AppTheme {
  static const String fontFamilyBold = "National2Bold";
  static const String fontFamilyRegular = "nationalregular";
  //light text
  static const TextTheme lightTextTheme = TextTheme(
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.lightText),
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.lightText),
      bodySmall: TextStyle(
          fontFamily: fontFamilyRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.lightText),
      headlineLarge: TextStyle(
          fontSize: 21, fontWeight: FontWeight.w700, color: AppColor.lightText),
      headlineMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.lightText),
      headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.lightText));
  //dark text
  static const TextTheme darkTextTheme = TextTheme(
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.darkText),
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.darkText),
      bodySmall: TextStyle(
          fontFamily: fontFamilyRegular,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.darkText),
      headlineLarge: TextStyle(
          fontSize: 21, fontWeight: FontWeight.w700, color: AppColor.darkText),
      headlineMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.darkText),
      headlineSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.darkText));

//Light theme
  static final ThemeData lightTheme = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          filled: true, fillColor: AppColor.lightTextFieldColor),
      fontFamily: fontFamilyBold,
      textTheme: lightTextTheme,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.brandColor, primary: AppColor.brandColor),
      primaryColor: AppColor.brandColor,
      scaffoldBackgroundColor: AppColor.lightBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimension.borderRadiusSmall)),
              backgroundColor: AppColor.brandColor,
              foregroundColor: AppColor.lightButtonTextColor)),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.lightAppBarBackground,
          foregroundColor: AppColor.lightText),
      drawerTheme: const DrawerThemeData(
          backgroundColor: AppColor.lightDrawerBackground),
      cardTheme: const CardTheme(color: AppColor.lightCardColor),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: lightTextTheme.headlineMedium,
              backgroundColor: AppColor.lightButtonBackgroundColor,
              foregroundColor: AppColor.lightButtonTextColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimension.borderRadiusSmall)))));

//Dark theme
  static final ThemeData darkTheme = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppColor.darkTextFieldColor, filled: true),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.brandColor,
          primary: AppColor.brandColor,
          brightness: Brightness.dark),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: darkTextTheme.headlineMedium,
              backgroundColor: AppColor.darkButtonBackgroundColor,
              foregroundColor: AppColor.darkButtonTextColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimension.borderRadiusSmall)))),
      fontFamily: fontFamilyBold,
      textTheme: darkTextTheme,
      brightness: Brightness.dark,
      primaryColor: AppColor.brandColor,
      scaffoldBackgroundColor: AppColor.darkBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.brandColor,
              foregroundColor: AppColor.darkButtonTextColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimension.borderRadiusSmall)))),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.darkAppBarBackground,
          foregroundColor: AppColor.darkText),
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColor.darkDrawerBackground),
      cardTheme: const CardTheme(color: AppColor.darkCardColor));
}
