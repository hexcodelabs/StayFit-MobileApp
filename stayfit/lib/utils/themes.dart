import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';

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
    color: textGrey,
    fontFamily: 'Gilroy',
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static TextStyle onBoardPageTopicTS = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    fontFamily: "Gilroy",
  );

  static TextStyle onBoardPageDescriptionTS = const TextStyle(
    color: textGrey,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 2,
    fontFamily: "Gilroy",
  );
}
