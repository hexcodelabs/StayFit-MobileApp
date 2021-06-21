import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/gym_information_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/trainee_information_page.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import '../../../utils/color.dart';

class LoginScreen extends StatefulWidget {
  String userType;
  LoginScreen({
    @required this.userType,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                height: 28,
              ),
              Text(
                "Welcome!",
                style: AppTheme.topicTS,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign in to continue",
                style: AppTheme.subTopicTS,
              ),
              SizedBox(
                height: 80,
              ),
              MainButton(
                width: width - 60,
                height: height,
                onPressed: () {
                  print(widget.userType);
                  (widget.userType == "GYM")
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GymInformationScreen()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TraineeInformationScreen(),
                          ),
                        );
                },
                text: "Sign up with Google",
                prefixIcon: SvgPicture.asset(
                  "assets/images/icons8-google (1).svg",
                  color: Colors.white,
                  height: 15,
                ),
                boxColor: mainGreen,
                shadowColor: mainGreen,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTheme.subTitleTS,
                  ),
                  Text(
                    "Log in",
                    style: AppTheme.subTitleGreenTS,
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
