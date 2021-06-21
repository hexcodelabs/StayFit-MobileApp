import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/sharedWidgets.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/user_selection_page.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/mainButton.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int check = 0;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: height * 0.83,
                child: PageView(
                  controller: pageController,
                  reverse: false,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      check = index;
                    });
                  },
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: myContainer(
                                  height: height * 0.56,
                                  width: width * 0.7,
                                  image: "assets/images/p1.PNG",
                                  color: Colors.blue,
                                  radius: 20.0),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            myText(
                              text: "Lorem ipsum dolor",
                              size: 20,
                              color: Colors.white,
                              weight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppTheme.textGrey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 2,
                                  fontFamily: "Gilroy"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: myContainer(
                                  height: height * 0.56,
                                  width: width * 0.7,
                                  image: "assets/images/p3.PNG",
                                  color: Colors.blue,
                                  radius: 20.0),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            myText(
                              text: "Lorem ipsum dolor",
                              size: 20,
                              color: Colors.white,
                              weight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppTheme.textGrey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 2,
                                  fontFamily: "Gilroy"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: myContainer(
                                  height: height * 0.56,
                                  width: width * 0.7,
                                  image: "assets/images/p2.PNG",
                                  color: Colors.blue,
                                  radius: 20.0),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            myText(
                              text: "Lorem ipsum dolor",
                              size: 20,
                              color: Colors.white,
                              weight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppTheme.textGrey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 2,
                                  fontFamily: "Gilroy"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                // bottom: 10,
                // left: dSize.width*0.25,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 7,
                            width: check == 0 ? 25 : 10,
                            decoration: BoxDecoration(
                                color: check == 0
                                    ? Color.fromRGBO(48, 48, 48, 1)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 7,
                            width: check == 1 ? 25 : 10,
                            decoration: BoxDecoration(
                                color: check == 1
                                    ? Color.fromRGBO(48, 48, 48, 1)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 7,
                            width: check == 2 ? 25 : 10,
                            decoration: BoxDecoration(
                                color: check == 2
                                    ? Color.fromRGBO(48, 48, 48, 1)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MainButton(
                        width: width * 0.7,
                        height: height,
                        onPressed: () {
                          setState(() {
                            check = check + 1;
                          });
                          if (check == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserSelectionScreen(),
                              ),
                            );
                            check = 2;
                          }
                          pageController.animateToPage(
                            check,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                        text: "Next",
                        suffixIcon: SvgPicture.asset("assets/images/next.svg"),
                        boxColor: AppTheme.mainGreen,
                        shadowColor: AppTheme.mainGreen,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
