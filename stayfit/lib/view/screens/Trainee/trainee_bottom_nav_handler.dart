import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/view/screens/Trainee/trainee_favourites_page.dart';
import 'package:stayfit/view/screens/Trainee/trainee_home_page.dart';
import 'package:stayfit/view/screens/Trainee/trainee_useredit_page.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';

class TraineeBottomNavHandler extends StatefulWidget {
  @override
  _TraineeBottomNavHandlerState createState() =>
      _TraineeBottomNavHandlerState();
}

class _TraineeBottomNavHandlerState extends State<TraineeBottomNavHandler> {
  var bottomBarIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      TraineeFavouritesPage(),
      TraineeHomePage(),
      TraineeEditPage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[bottomBarIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 50,
                    offset: Offset(0, -25),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  // elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: darkGreen,
                  currentIndex: bottomBarIndex,
                  onTap: (index) async {
                    setState(() {
                      bottomBarIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        decoration: BoxDecoration(
                            color: bottomBarIndex == 0
                                ? Color(0xff3DD598)
                                : Colors.transparent,
                            shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                "assets/icons/NavBar_trainee/favourite.svg",
                                color: darkGreen,
                              ),
                            )),
                      ),
                      icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icons/NavBar_trainee/favourite.svg",
                        ),
                      ),
                      // ignore: deprecated_member_use
                      title: customText(
                          color:
                              bottomBarIndex == 0 ? Colors.black : Colors.grey,
                          text: "Kalender",
                          size: 12,
                          weight: FontWeight.normal),
                      backgroundColor: Color(0xff30444E),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        decoration: BoxDecoration(
                            color: bottomBarIndex == 1
                                ? Color(0xff3DD598)
                                : Colors.transparent,
                            shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                "assets/icons/NavBar_trainee/Home.svg",
                                color: darkGreen,
                              ),
                            )),
                      ),
                      icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icons/NavBar_trainee/Home.svg",
                        ),
                      ),
                      // ignore: deprecated_member_use
                      title: customText(
                          color:
                              bottomBarIndex == 1 ? Colors.black : Colors.grey,
                          text: "Beskeder",
                          size: 12,
                          weight: FontWeight.normal),
                      backgroundColor: Colors.white,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        decoration: BoxDecoration(
                            color: bottomBarIndex == 2
                                ? Color(0xff3DD598)
                                : Colors.transparent,
                            shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                "assets/icons/NavBar_trainee/User.svg",
                                color: darkGreen,
                              ),
                            )),
                      ),
                      icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icons/NavBar_trainee/User.svg",
                        ),
                      ),
                      // ignore: deprecated_member_use
                      title: customText(
                          color:
                              bottomBarIndex == 2 ? Colors.black : Colors.grey,
                          text: "Huskeliste",
                          size: 12,
                          weight: FontWeight.normal),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.green,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
