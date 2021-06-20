import 'package:flutter/material.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/gym_information_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/login_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/trainee_information_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/user_selection_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: WelcomeScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
