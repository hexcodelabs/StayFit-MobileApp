import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: mainGreen,
    primaryColorDark: darkgrey,
    // primaryColorLight: lightGrey,
    // accentColor: mainOrange,
    dividerColor: darkgrey,
    fontFamily: 'Gilroy',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  //Colors
  static const Color mainGreen = Color(0xFF40DF9F);
  static const Color mainRed = Color(0xFFFF535B);
  static const Color backgroundGrey = Color(0xFF264E5A);
  static const Color darkgrey = Color(0xFF040405);

  static const Color darkYellow = Color(0xFF625B39);
  static const Color darkRed = Color(0xFF623A42);
  static const Color lightYellow = Color(0xFFFFC542);
  static const Color lightRed = Color(0xFFFF575F);
  static const Color textGrey = Color(0xFF96A7AF);
  static const Color darkGreen = Color(0xFF286053);
  static const Color lightGreen = Color(0xFF3DD598);

  //Text Styles
  static TextStyle topicTS = const TextStyle(
    color: Colors.white,
    fontSize: 42,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
  );

  static TextStyle subTopicTS = const TextStyle(
    color: textGrey,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle textFieldTS = const TextStyle(
    color: textGrey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle subTitleTS = const TextStyle(
    color: textGrey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle subTitleGreenTS = const TextStyle(
    color: mainGreen,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle welcomePageContentTS = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle mainButtonTS = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Gilroy',
  );

  static TextStyle userTypeContainerTS = const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
  );

  static TextStyle dropDownTS = const TextStyle(
    color: AppTheme.textGrey,
    fontFamily: 'Gilroy',
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
}
