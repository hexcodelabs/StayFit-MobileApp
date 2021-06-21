import 'package:flutter/material.dart';
import 'package:stayfit/view/screens/GYM/home.dart';
import 'package:stayfit/view/screens/Trainee/bottom_Navbar_trainee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool gymUser = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (gymUser) ? GYMHomePage() : BottomNavbarTrainee(),
    );
  }
}
