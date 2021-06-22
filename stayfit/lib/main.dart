import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/welcome_page.dart';

import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/screens/Trainee/trainee_bottom_nav_handler.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  FireBaseFunctions fbFunctions = new FireBaseFunctions();
  await fbFunctions
      .isSignedIn()
      .then((value) => runApp(OverlaySupport(child: MyApp(value))));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool gymUser = false;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      // home: (gymUser) ? GYMDrawerHandler() : TraineeBottomNavHandler(),
      home: WelcomeScreen(),
    );
  }
}
