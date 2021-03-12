import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/styles/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Lora',
    primaryColor: AppColors.primaryColorLight,
    primaryColorBrightness: Brightness.light,
    backgroundColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.textPrimaryColorLight,
    accentColor: AppColors.accentColor,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryColorLight,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryColorLight,
      ),
      headline6: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
      headline5: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
      headline2: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.buttonColorLight),
    buttonColor: AppColors.buttonColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.red,
        selectedItemColor: Colors.deepOrange,
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        unselectedItemColor: Colors.black,
        elevation: 10.0,
        selectedIconTheme: IconThemeData(size: 30)),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Lora',
    primaryColor: AppColors.primaryColorDark,
    primaryColorBrightness: Brightness.dark,
    backgroundColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.primaryColorDark,
    accentColor: AppColors.accentColor,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimaryColorDark,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimaryColorDark,
      ),
      headline6: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
      headline5: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
      headline2: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColorDark,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.buttonColorLight),
    buttonColor: AppColors.buttonColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: Colors.white,
      elevation: 10.0,
      selectedIconTheme: IconThemeData(size: 30),
      backgroundColor: Color(0xFF242424),
    ),
  );
}
