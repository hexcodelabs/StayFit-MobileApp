import 'package:flutter/material.dart';
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/view/screens/GYM/gym_sessions_page.dart';
import 'package:stayfit/view/widgets/drawer.dart';

class GYMHomePage extends StatefulWidget {
  @override
  _GYMHomePageState createState() => _GYMHomePageState();
}

class _GYMHomePageState extends State<GYMHomePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = black;
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          DrawerMenu(
            backgroundColor: backgroundColor,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            slideAnimation: _slideAnimation,
          ),
          GYMSessionsPage(
              backgroundColor: backgroundColor,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTapMenu: () {
                setState(
                  () {
                    if (isCollapsed)
                      _controller.forward();
                    else
                      _controller.reverse();

                    isCollapsed = !isCollapsed;
                  },
                );
              },
              scaleAnimation: _scaleAnimation,
              duration: duration),
        ],
      ),
    );
  }
}
