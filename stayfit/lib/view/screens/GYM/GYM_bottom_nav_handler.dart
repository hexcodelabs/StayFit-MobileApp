import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/view/screens/GYM/add_session.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';

import 'event_card.dart';

class GYMBottomNavHandler extends StatefulWidget {
  @override
  _GYMBottomNavHandlerState createState() => _GYMBottomNavHandlerState();
}

class _GYMBottomNavHandlerState extends State<GYMBottomNavHandler> {
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
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 50,
                    offset: Offset(0, -15),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
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
                                "assets/icons/NavBar_trainer/Home.svg",
                                color: darkGreen,
                              ),
                            )),
                      ),
                      icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icons/NavBar_trainer/Home.svg",
                        ),
                      ),
                      // ignore: deprecated_member_use
                      title: customText(
                          color:
                              bottomBarIndex == 0 ? Colors.black : Colors.grey,
                          text: "Kalender",
                          size: 12,
                          weight: FontWeight.normal),
                      backgroundColor: darkGreen,
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
                                "assets/icons/NavBar_trainer/User.svg",
                                color: darkGreen,
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
                                "assets/icons/NavBar_trainer/Instructors.svg",
                                color: darkGreen,
                                height: 22,
                                width: 22,
                              ),
                            )),
                      ),
                      icon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icons/NavBar_trainer/Instructors.svg",
                          height: 22,
                          width: 22,
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
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        decoration: BoxDecoration(
                            color: bottomBarIndex == 3
                                ? Color(0xff3DD598)
                                : Colors.transparent,
                            shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                "assets/icons/NavBar_trainer/Notification.svg",
                                color: darkGreen,
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
                          color:
                              bottomBarIndex == 3 ? Colors.black : Colors.grey,
                          text: "Madplan",
                          size: 12,
                          weight: FontWeight.normal),
                      backgroundColor: Colors.white,
                    )
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
      backgroundColor: darkGreen,
      body: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 1,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddSession(),
                ),
              );
            },
            child: EventCard(
              eventName: 'Yoga',
              date: 'May 21st',
              likes: 2500,
              imagePath: 'assets/images/p5.png',
              time: '1.00pm - 2.00pm ',
            ),
          ),
          EventCard(
            eventName: 'Body \nBuilding',
            date: 'May 22st',
            likes: 2200,
            imagePath: 'assets/images/gym.jpeg',
            time: '1.00pm - 2.00pm ',
          ),
        ],
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
      backgroundColor: darkGreen,
      body: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
        crossAxisCount: 2,
        children: [
          InstructorCard(
            name: 'John Doe',
            imagePath: 'assets/images/jonny.jpeg',
          ),
          InstructorCard(
            name: 'Danny Fernandaz',
            imagePath: 'assets/images/danny.jpeg',
          ),
          InstructorCard(
            name: 'Shasha Peiris',
            imagePath: 'assets/images/sasha.jpeg',
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: IconButton(
                iconSize: 150,
                color: Colors.white60,
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white24,
              ),
            ),
          ),
        ],
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

class InstructorCard extends StatelessWidget {
  String name;
  String imagePath;

  InstructorCard({this.name, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imagePath),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          )
        ],
      ),
    );
  }
}
