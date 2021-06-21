import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';

class TraineeCheckoutPage extends StatefulWidget {
  @override
  _TraineeCheckoutPageState createState() => _TraineeCheckoutPageState();
}

class _TraineeCheckoutPageState extends State<TraineeCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 90, 28, 0),
              child: Container(
                height: height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    priceCard("YOGA", "Colombo Gym", "90.00"),
                    Spacer(),
                    totalCard("180.00"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(48, 68, 78, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 315,
                        height: 58,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                Color.fromRGBO(255, 86, 94, 1), // background
                            onPrimary: Colors.white, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            print("Proceed to Checkout");
                          },
                          child: Text('Proceed to Checkout'),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
