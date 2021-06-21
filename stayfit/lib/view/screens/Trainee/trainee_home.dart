import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stayfit/view/screens/Trainee/trainee_subscription.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';

class TraineeHome extends StatefulWidget {
  @override
  _TraineeHomeState createState() => _TraineeHomeState();
}

class _TraineeHomeState extends State<TraineeHome> {
  String name = "Tharaka";
  final ScrollController _contentController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0x0096a7af),
      body: SafeArea(
          child: Container(
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
          padding: const EdgeInsets.fromLTRB(32, 91, 32, 0),
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
                      onPressed: () => {print("Pressed notification")},
                      icon: FaIcon(
                        FontAwesomeIcons.solidBell,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(
                height: 14,
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
                height: 15,
              ),
              Container(
                height: height * 0.65,
                child: Scrollbar(
                    controller: _contentController,
                    isAlwaysShown: false,
                    thickness: 2,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return gymCard(
                              "Colombo Gym", "Weekly progress on dieting", 23,
                              () {
                            Navigator.of(context)
                                .push(pageRoute(TraineeSubscription()));
                          });
//                  return progressCard("It looks like you are on track. Please continue to follow the daily plan.");
                        })),
              )
            ],
          ),
        ),
      )),
    );
  }
}
