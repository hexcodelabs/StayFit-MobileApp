import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
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
  bool processingAuth = false;

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
      body: processingAuth
          ? LinearProgressIndicator(
              color: lightGreen,
              backgroundColor: darkGreen,
            )
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
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
                      onPressed: () async {
                        
                        //Executing google signin when clicking the button
                        final provider =
                            Provider.of<AuthFunctions>(context, listen: false);

                        //executing google signin
                        await provider.googleLogIn();
                        
                        setState(() {
                          processingAuth = true;
                        });
                        await provider.getUser().then((uid) {
                          print(widget.userType +" " +provider.firebaseUser.uid);
                          if(provider.firebaseUser.uid!=null){
                            setState(() {
                              processingAuth = false;
                            });
                          }
                        });

                        if (!processingAuth) {
                          if (widget.userType == "GYM") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      GymInformationScreen()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TraineeInformationScreen(),
                              ),
                            );
                          }
                        } else {
                          setState(() {
                            processingAuth = false;
                          });
                          showSimpleNotification(Text("Error! Signing in"),
                              background: Colors.red);
                        }
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
