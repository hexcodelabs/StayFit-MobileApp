import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
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
  var providerDatabase;

  String _userType = "";
  bool loading = false;

  @override
  void initState() {
    super.initState();
    //Initialzing firebase
    providerDatabase = Provider.of<Database>(context, listen: false);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    setState(() {
      loading = true;
    });
    statusForRoute();
  }

  Future<void> statusForRoute() async {
    await Firebase.initializeApp();
    AuthFunctions fbFunctions = new AuthFunctions();
    await fbFunctions.isSignedInCheck().then((value) async {
      setState(() {
        _userType = value;
      });
      if (_userType == "GYM") {
        await load();
      }
      setState(() {
        loading = false;
      });
    });
  }

  load() async {
    var providerAuth = Provider.of<AuthFunctions>(context, listen: false);
    await providerAuth.getUser();
    await providerDatabase.loadUserData(providerAuth.firebaseUser.uid);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGrey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 20),
        child: MainButton(
          width: 70,
          height: height,
          onPressed: () {
            if (!loading) {
              if (_userType == "NOUSER") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OnboardingScreen(),
                  ),
                );
              } else if (_userType == "GYM") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => GYMDrawerHandler()),
                );
              } else if (_userType == "TRAINEE") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TraineeBottomNavHandler(),
                  ),
                );
              }
            }
          },
          text: "",
          suffixIcon: SvgPicture.asset("assets/images/next.svg"),
          loading: loading,
          boxColor: mainGreen,
          shadowColor: mainGreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("assets/logo/weightLiftingImage.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SvgPicture.asset("assets/logo/stayFitName.svg"),
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
          ],
        ),
      ),
    );
  }
}
