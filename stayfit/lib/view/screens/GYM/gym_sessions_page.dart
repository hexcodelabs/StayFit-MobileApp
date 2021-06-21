import 'package:flutter/material.dart';
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/view/screens/GYM/bottom_Navbar_trainer.dart';

class GYMSessionsPage extends StatelessWidget {
  final Color backgroundColor;
  final bool isCollapsed;
  final double screenWidth;
  final double screenHeight;
  final Function onTapMenu;
  final Animation scaleAnimation;
  final Duration duration;

  const GYMSessionsPage({
    @required this.backgroundColor,
    @required this.isCollapsed,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.onTapMenu,
    @required this.scaleAnimation,
    @required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.7 * screenWidth,
      right: isCollapsed ? 0 : -0.6 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          elevation: 8,
          color: green80,
          child: Container(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MainAppBar(
                  onTapMenuBtn: onTapMenu,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: BottomNavbarTrainer(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget {
  final Function onTapMenuBtn;
  const MainAppBar({@required this.onTapMenuBtn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: Icon(
              Icons.menu,
              color: white,
            ),
            onPressed: onTapMenuBtn),
      ],
    );
  }
}
