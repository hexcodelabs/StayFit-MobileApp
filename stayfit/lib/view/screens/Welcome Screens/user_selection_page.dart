import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/gym_information_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/trainee_information_page.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import '../../../utils/color.dart';

class UserSelectionScreen extends StatefulWidget {
  UserSelectionScreen({Key key}) : super(key: key);

  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                width: 50,
                height: 50,
                boxColor: mainGreen,
                radius: 12,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Which type\nof a user are\nyou?",
                style: AppTheme.topicTS,
              ),
              SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TraineeInformationScreen(),
                        ),
                      );
                    },
                    child: CustomContainer(
                      width: width * 0.4,
                      height: width * 0.5,
                      boxColor: mainRed,
                      radius: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: width * 0.5 * 0.1),
                            child: Text(
                              "Trainee",
                              style: AppTheme.userTypeContainerTS,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/trainee.svg",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              GymInformationScreen(),
                        ),
                      );
                    },
                    child: CustomContainer(
                      width: width * 0.4,
                      height: width * 0.5,
                      boxColor: mainGreen,
                      radius: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: width * 0.5 * 0.1),
                            child: Text(
                              "GYM",
                              style: AppTheme.userTypeContainerTS,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/gym_instructor.svg",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
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
