import 'package:flutter/material.dart';
import 'package:stayfit/view/screens/GYM/instructors.dart';
import 'view/screens/GYM/home.dart';

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
      home: Instructors(),
    );
  }
}
