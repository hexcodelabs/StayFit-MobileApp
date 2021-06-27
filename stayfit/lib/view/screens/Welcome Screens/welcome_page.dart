import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/screens/Trainee/trainee_bottom_nav_handler.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/onbording_page%20.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import '../../../utils/color.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _userType = "";

  @override
  void initState() {
    super.initState();
    //Initialzing firebase
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    statusForRoute();
  }

  Future<void> statusForRoute() async {
    await Firebase.initializeApp();
    AuthFunctions fbFunctions = new AuthFunctions();
    await fbFunctions.isSignedInCheck().then((value) {
      setState(() {
        _userType = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGrey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: MainButton(
          width: width * 0.7,
          height: height,
          onPressed: () {
            if (_userType == "NOUSER") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => OnboardingScreen(),
                ),
              );
            }
            else if(_userType=="GYM"){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => GYMDrawerHandler()),
              );
            }
            else if(_userType=="TRAINEE"){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TraineeBottomNavHandler(),
                ),
              );
            }
          },
          text: "Next",
          suffixIcon: SvgPicture.asset("assets/images/next.svg"),
          boxColor: mainGreen,
          shadowColor: mainGreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
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
                "Welcome",
                style: AppTheme.topicTS,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: width * 0.7,
                child: Text(
                  "Text messages are used for personal, family, business and social purposes. Governmental and non-governmental organizations use text messaging for communication between colleagues. In the 2010s, the sending of short informal messages ",
                  style: AppTheme.welcomePageContentTS,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
