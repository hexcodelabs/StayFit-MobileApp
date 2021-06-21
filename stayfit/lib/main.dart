import 'package:flutter/material.dart';
import 'package:stayfit/controller/provider/trainee_provider.dart';
import 'package:provider/provider.dart';

import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/welcome_page.dart';

import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/screens/Trainee/trainee_bottom_nav_handler.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool gymUser = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TraineeProvider(),
        ),
      ],
        child: MaterialApp(
      title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
          // home: (gymUser) ? GYMDrawerHandler() : TraineeBottomNavHandler(),
          home: WelcomeScreen(),
    ));
  }
}
