import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';

class TraineeSubscription extends StatefulWidget {
  @override
  _TraineeSubscriptionState createState() => _TraineeSubscriptionState();
}

class _TraineeSubscriptionState extends State<TraineeSubscription> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0x0096a7af),
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
          padding: const EdgeInsets.fromLTRB(32, 91, 32, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Subscription",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              subscriptionCardOne("YOGA", "Colombo Gym", "90.00"),
              SizedBox(
                height: 20,
              ),
//                subscriptionCardTwo("YOGA", "Colombo Gym", "90.00")
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subscriptionCardTwo("Basics", "Colombo Gym", "90.00"),
                  subscriptionCardThree("Schedule", "Colombo Gym", "90.00")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
