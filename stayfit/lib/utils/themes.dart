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
    fontFamily: 'SFPro',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  //Text Styles
  static TextStyle topicTS = const TextStyle(
    color: Colors.white,
    fontSize: 42,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFPro',
  );

  static TextStyle subTopicTS = const TextStyle(
    color: textGrey,
    fontSize: 22,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle textFieldTS = const TextStyle(
    color: textGrey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle subTitleTS = const TextStyle(
    color: textGrey,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle subTitleGreenTS = const TextStyle(
    color: mainGreen,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle welcomePageContentTS = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle mainButtonTS = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
  );

  static TextStyle userTypeContainerTS = const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFPro',
  );

  static TextStyle dropDownTS = const TextStyle(
    color: textGrey,
    fontFamily: 'SFPro',
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static TextStyle onBoardPageTopicTS = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    fontFamily: "SFPro",
  );

  static TextStyle onBoardPageDescriptionTS = const TextStyle(
    color: textGrey,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 2,
    fontFamily: "SFPro",
  );

  static TextStyle datePickerCancelTS = const TextStyle(
    color: mainRed,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    fontFamily: "SFPro",
  );

  static TextStyle datePickerDoneTS = const TextStyle(
    color: mainGreen,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    fontFamily: "SFPro",
  );

  static TextStyle typePickerTS = const TextStyle(
    color: Colors.white,
    fontFamily: 'SFPro',
    fontSize: 14.00,
    fontWeight: FontWeight.w300,
  );
}
