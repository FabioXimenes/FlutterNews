import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.black;

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Lora',
    primaryColor: kPrimaryColor,
    backgroundColor: Colors.white,
    accentColor: Colors.deepOrange[300],
    textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: kPrimaryColor),
      subtitle2: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: kPrimaryColor),
      headline6: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: kPrimaryColor),
      headline5: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: kPrimaryColor),
      headline4: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
      headline3: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: kPrimaryColor),
      headline2: TextStyle(
          fontSize: 26, fontWeight: FontWeight.bold, color: kPrimaryColor),
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: kPrimaryColor),
    ),
    iconTheme: IconThemeData(color: kPrimaryColor),
    buttonColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.red,
      selectedItemColor: Colors.deepOrange,
      // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      unselectedItemColor: Colors.black,
      elevation: 10.0,
      selectedIconTheme: IconThemeData(size: 30)
    ),
  );
}
