import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';

class TraineeCheckout extends StatelessWidget {

  const TraineeCheckout({
    Key key,
    this.data
  }) : super(key: key);

  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("dd");
    print(data);
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
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 60, 28, 0),
          child: Container(
            height: height*0.65,
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
                priceCard(data["type"], data["name"], data["price"]),
                Spacer(),
                totalCard(data["price"]),
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
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 15,
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
