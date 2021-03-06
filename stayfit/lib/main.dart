import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';


import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/welcome_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(OverlaySupport(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Database(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthFunctions(),
          ),
        ],
        child: MaterialApp(
      title: 'Stayfit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: WelcomeScreen(),
    ));
  }
}
