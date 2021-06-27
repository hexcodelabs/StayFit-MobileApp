import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/view/screens/Trainee/trainee_checkout.dart';
import 'package:stayfit/view/screens/Trainee/trainee_favourites_page.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';

class TraineeHomePage extends StatelessWidget {
  final String name = "Tharaka";
  final ScrollController _contentController = ScrollController();
  final bool showReportCard = true;
  final gymList = [
    {
      'name': "Colomo Gym",
      "likes": 23,
      "tagLine": "Weekly progress on dieting"
    },
    {'name': "Horana Gym", "likes": 2, "tagLine": "Weekly progress on health"},
    {'name': "Bandaragama Gym", "likes": 50, "tagLine": "Best of the best"}
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0x0096a7af),
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
                      "Hii " + name + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        print("Pressed notification");
                        AuthFunctions fbFunctions = new AuthFunctions();
                        await fbFunctions.signOut();
                        
                      },
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(201, 208, 219, 1))),
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
                        itemCount: gymList.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return showReportCard && index == 0
                              ? progressCard(width, height,
                                  "It looks like you are on track. Please continue to follow your daily plan.")
                              : gymCard(
                                  gymList[index - 1]['name'],
                                  gymList[index - 1]['tagLine'],
                                  gymList[index - 1]['likes'],
                                  width,
                                  height, () {
                                  Navigator.of(context)
                                      .push(pageRoute(TraineeCheckout()));
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
