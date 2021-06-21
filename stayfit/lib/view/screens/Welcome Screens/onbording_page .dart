import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/user_selection_page.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import '../../../utils/color.dart';
import '../../widgets/pageview_container.dart';

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
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.8,
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
                    PageViewContainer(
                      height: height * 0.56,
                      width: width * 0.7,
                      imageBoxColor: mainGreen,
                      image: "assets/images/p1.PNG",
                      topic: "Lorem ipsum dolor dsg",
                      topicTS: AppTheme.onBoardPageTopicTS,
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                      descriptionTS: AppTheme.onBoardPageDescriptionTS,
                    ),
                    PageViewContainer(
                      height: height * 0.56,
                      width: width * 0.7,
                      imageBoxColor: mainGreen,
                      image: "assets/images/p3.PNG",
                      topic: "Lorem ipsum dolor dsg",
                      topicTS: AppTheme.onBoardPageTopicTS,
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                      descriptionTS: AppTheme.onBoardPageDescriptionTS,
                    ),
                    PageViewContainer(
                      height: height * 0.56,
                      width: width * 0.7,
                      imageBoxColor: mainGreen,
                      image: "assets/images/p2.PNG",
                      topic: "Lorem ipsum dolor dsg",
                      topicTS: AppTheme.onBoardPageTopicTS,
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod labore et doloreLorem ipsum dolor sit ame",
                      descriptionTS: AppTheme.onBoardPageDescriptionTS,
                    ),
                  ],
                ),
              ),
              Column(
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
                    height: 15,
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
                    boxColor: mainGreen,
                    shadowColor: mainGreen,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
