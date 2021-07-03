import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/color.dart' as color;
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/view/screens/GYM/add_instructor.dart';
import 'package:stayfit/view/screens/GYM/add_session.dart';
import 'package:stayfit/view/screens/GYM/view_session.dart';
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

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var providerDatabase;

  @override
  Future initState() {
    super.initState();
    providerDatabase = Provider.of<Database>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 1,
        children: [
          if (providerDatabase.gymUser.sessionDocs.length > 0)
            ...providerDatabase.gymUser.sessionDocs.map((session) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ViewSession(session: session),
                    ),
                  );
                },
                child: EventCard(
                  eventName: session.name,
                  date: session.start_timestamp.month.toString() +
                      session.start_timestamp.day.toString(),
                  likes: session.followers.length,
                  imagePath: session.image,
                  time: session.start_timestamp.toString().split(" ")[1],
                ),
              );
            }).toList(),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddSession(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 100,
                    color: color.mainGreen,
                  ),
                ),
              ),
            ),
          )
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

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  var providerDatabase;

  @override
  Future initState() {
    super.initState();
    providerDatabase = Provider.of<Database>(context, listen: false);
  }

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
          ...providerDatabase.gymUser.instructorDocs.map((instructor) {
            return InstructorCard(
              name: instructor.name,
              imagePath: instructor.image,
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: IconButton(
                iconSize: 150,
                color: Colors.white60,
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddInstructor(),
                    ),
                  );
                },
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
                  fit: BoxFit.cover,
                  image: NetworkImage(imagePath),
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
