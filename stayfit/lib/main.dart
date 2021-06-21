import 'package:flutter/material.dart';
import 'package:stayfit/view/screens/GYM/home.dart';
import 'package:stayfit/view/widgets/bottom_Navbar_trainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavbarTrainer(),
    );
  }
}
