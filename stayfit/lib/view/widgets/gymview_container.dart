import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GymViewContainer extends StatelessWidget {
  const GymViewContainer({
    Key key,
    @required this.height,
    @required this.width,
    this.image,
    this.imageBoxColor,
    this.topic,
    this.topicTS,
    this.description,
    this.descriptionTS,
    this.day,
    this.time
  }) : super(key: key);

  final double height;
  final double width;
  final String image;
  final Color imageBoxColor;
  final String topic;
  final TextStyle topicTS;
  final String description;
  final TextStyle descriptionTS;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 40.0, left: 17.0, bottom: 15, right: 17.0),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: imageBoxColor,
              gradient: new LinearGradient(
                colors: [
                  Color.fromRGBO(38, 76, 88, 1),
                  Color.fromRGBO(34, 52, 60, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: imageBoxColor,
              gradient: new LinearGradient(
                colors: [Colors.transparent, Color.fromRGBO(34, 52, 60, 1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 17.0, bottom: 5, right: 17.0),
                  child: Text(
                    topic,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 17.0, bottom: 5.0, right: 17.0),
                  child: Text(
                    day,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 17.0, bottom: 40.0, right: 17.0),
                  child: Text(
                    time,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
