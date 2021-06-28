import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/utils/color.dart';
import 'package:stayfit/view/screens/Trainee/trainee_checkout.dart';
import 'package:stayfit/view/screens/Trainee/trainee_favourites_page.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/welcome_page.dart';
import 'package:stayfit/view/screens/Trainee/trainee_gym_selection_page.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';
import 'package:stayfit/controller/databaseController.dart';

class TraineeHomePage extends StatefulWidget {
  @override
  _TraineeHomePageState createState() => _TraineeHomePageState();
}

class _TraineeHomePageState extends State<TraineeHomePage> {
  String name = "aaaddadad";
  final ScrollController _contentController = ScrollController();

  final bool showReportCard = true;

  @override
  void initState() {
    super.initState();
    var providerDatabase = Provider.of<Database>(context, listen: false);
    var providerAuth = Provider.of<AuthFunctions>(context, listen: false);
    providerAuth.getUserDetails();
    providerDatabase.getGymUsers();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var providerDatabase = Provider.of<Database>(context);
    var providerAuth = Provider.of<AuthFunctions>(context);

    return !providerDatabase.getGymUsersFetchStatus
        ? Scaffold(
      backgroundColor: backgroundGrey,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            'assets/images/loading.gif',
          ),
        ),
      ),
    )
        : Scaffold(
      backgroundColor: backgroundGrey,
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Color.fromRGBO(38, 76, 88, 1),
                    Color.fromRGBO(34, 52, 60, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 60, 32, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Hii " + providerAuth.userDetails["name"] + "!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                            onPressed: () => {print("Pressed notification")},
                            icon: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(201, 208, 219, 1),
                          ),
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Search Gym',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(201, 208, 219, 1))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.65,
                      child: Scrollbar(
                          controller: _contentController,
                          isAlwaysShown: false,
                          thickness: 2,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: providerDatabase.getGymList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return gymCard(
                                        providerDatabase.getGymList[index]
                                            ['name'],
                                        providerDatabase.getGymList[index]
                                            ['tag_line'],
                                        providerDatabase.getGymList[index]
                                            ['likes'],
                                        width,
                                        height, () {
                                  Navigator.of(context)
                                            .push(pageRoute(GymSelectPage(index:index)));

                                      });
                              })),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

//showReportCard && index == 0
//? progressCard(width, height,
//"It looks like you are on track. Please continue to follow your daily plan.")
//: