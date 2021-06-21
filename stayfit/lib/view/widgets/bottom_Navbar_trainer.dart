import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';

class BottomNavbarTrainer extends StatefulWidget {
  @override
  _BottomNavbarTrainerState createState() => _BottomNavbarTrainerState();
}

class _BottomNavbarTrainerState extends State<BottomNavbarTrainer> {
  var bottomBarIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      FirstPage(),
      SecondPage(),
      ThirdPage(),
      FourthPage()
    ];

    return Scaffold(
      extendBody: true,
      body: pages[bottomBarIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 50,
                  offset: Offset(0, -15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                // elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xff30444E),
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
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/icons/NavBar_trainer/User.svg",
                              color: Colors.white,
                            ),
                          )),
                    ),
                    icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/icons/NavBar_trainer/User.svg",
                      ),
                    ),
                    // ignore: deprecated_member_use
                    title: customText(
                        color: bottomBarIndex == 0 ? Colors.black : Colors.grey,
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
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/icons/NavBar_trainer/Instructors.svg",
                              color: Colors.white,
                            ),
                          )),
                    ),
                    icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/icons/NavBar_trainer/Instructors.svg",
                      ),
                    ),
                    // ignore: deprecated_member_use
                    title: customText(
                        color: bottomBarIndex == 1 ? Colors.black : Colors.grey,
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
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/icons/NavBar_trainer/Home.svg",
                              color: Colors.white,
                              height: 22,
                              width: 22,
                            ),
                          )),
                    ),
                    icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/icons/NavBar_trainer/Home.svg",
                        height: 22,
                        width: 22,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    title: customText(
                        color: bottomBarIndex == 2 ? Colors.black : Colors.grey,
                        text: "Huskeliste",
                        size: 12,
                        weight: FontWeight.normal),
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: BoxDecoration(
                          color: bottomBarIndex == 3
                              ? Color(0xff3DD598)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/icons/NavBar_trainer/Notification.svg",
                              color: Colors.white,
                            ),
                          )),
                    ),
                    icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/icons/NavBar_trainer/Notification.svg",
                      ),
                    ),
                    // ignore: deprecated_member_use
                    title: customText(
                        color: bottomBarIndex == 3 ? Colors.black : Colors.grey,
                        text: "Madplan",
                        size: 12,
                        weight: FontWeight.normal),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            )),
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

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
