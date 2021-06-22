import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/gymview_container.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';
import '../../../utils/color.dart';
import '../../widgets/pageview_container.dart';

class GymSelectPage extends StatefulWidget {
  GymSelectPage({Key key}) : super(key: key);

  @override
  _GymSelectPageState createState() => _GymSelectPageState();
}

class _GymSelectPageState extends State<GymSelectPage> {
  int check = 0;
  String gymName = "Colombo Gym";

  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.8, keepPage: true);

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

  List<List<String>> _gymClasses = [
    ["assets/images/p5.png","YOGA", "May 21st ","1.00 pm - 2.00 pm", "GymID"],
    ["assets/images/p4.png","POGA", "May 21st ","1.00 pm - 2.00 pm", "GymID"],
    ["assets/images/p3.PNG","GOGA", "May 21st ","1.00 pm - 2.00 pm", "GymID"],
  ];

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
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 40, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      gymName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomContainer(
                        width: 50,
                        height: 50,
                        boxColor: mainGreen,
                        radius: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height,
                child: PageView(
                  controller: pageController,
                  reverse: false,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      check = index;
                    });
                  },
                  children: _gymClasses.map<Widget>(
                    (event) => GymViewContainer(
                      height: height * 0.76,
                      width: width * 0.75,
                      imageBoxColor: mainGreen,
                      topic: event[1],
                      image: event[0],
                      day:event[2],
                      time:event[3],
                      topicTS: AppTheme.onBoardPageTopicTS,
                      descriptionTS: AppTheme.onBoardPageDescriptionTS,
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
