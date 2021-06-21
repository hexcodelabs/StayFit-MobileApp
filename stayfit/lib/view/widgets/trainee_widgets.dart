import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget progressCard(double width, double height, String msg) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      height: height*0.28,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 86, 94, 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 10),
            child: Container(
              width: 185,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 44,
                        child: Center(
                            child: Icon(
                          Icons.star_border,
                          size: 20,
                          color: Colors.white,
                        )),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.35),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 75,
                        child: Text(
                          "Weekly Progress",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text(
                      msg,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 255, 255, 0.35)),
              child: Center(
                child: GestureDetector(
                  onTap: ()=>{
                    print("Pressed OK")
                  },
                  child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget gymCard(String name, String tagLine, int likes, double width, double height, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        height: height*0.38,
        decoration: BoxDecoration(
            color: Color.fromRGBO(48, 68, 78, 1),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height*0.24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/gym_colombo.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width*0.45,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.solidHeart,
                              size: 12,
                              color: Color.fromRGBO(150, 167, 175, 1)),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            likes == 1
                                ? likes.toString() + " like"
                                : likes.toString() + " likes",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(150, 167, 175, 1)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width*0.75,
                  child: Text(
                    tagLine,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(150, 167, 175, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget subscriptionCardOne(double height,double width, String type, String place, String price) {
  return Container(
    height: height*0.27,
    decoration: BoxDecoration(
        color: Color.fromRGBO(255, 86, 94, 1),
        borderRadius: BorderRadius.all(Radius.circular(25))),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Positioned(
            top: 46,
            left: 106,
            child: Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 70, 79, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 102,
            left: -30,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 70, 79, 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Positioned(
            top: 102,
            left: 194,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 70, 79, 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Positioned(
            top: -8,
            left: 302,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 70, 79, 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Positioned(
            top: 102,
            left: -21,
            child: Container(
              width: 187,
              height: 107,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/card_anim_1.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width*0.7,
                          child: Text(
                            type,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Text("By " + place,
                            style: TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("\$" + price.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget subscriptionCardTwo(double height,double width,String type, String place, String price) {
  return Container(
      width: width*0.4,
      height: height*0.27,
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 213, 152, 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(
              top: 90,
              left: -18,
              child: Container(
                width: 79,
                height: 105,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card_anim_2.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 15, 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:width*0.3,
                              child: Text(
                                type,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style:
                                    TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),
                            Container(
                                width:width*0.3,
                                child: Text(
                              "By " + place,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("\$" + price,
                            style: TextStyle(fontSize: 18, color: Colors.white))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ));
}

Widget subscriptionCardThree(double height,double width, String type, String place, String price) {
  return Container(
      width: width*0.4,
      height: height*0.27,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 197, 66, 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 90,
              child: Container(
                width: 80,
                height: 79,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card_anim_3.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 15, 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:width*0.3,
                              child: Text(
                                type,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style:
                                TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),
                            Container(
                                width:width*0.3,
                                child: Text(
                              "By " + place,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\$" + price,
                            style: TextStyle(fontSize: 18, color: Colors.white))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ));
}

Widget priceCard(String type, String place, String price) {
  return Container(
    child: Row(
      children: [
        Container(
          width: 105,
          height: 125,
          decoration: BoxDecoration(
              color: Color.fromRGBO(237, 241, 250, 1),
              image: DecorationImage(
                image: AssetImage('assets/images/instructor.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        SizedBox(
          width: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type, style: TextStyle(fontSize: 18, color: Colors.white)),
            Text("By " + place,
                style: TextStyle(fontSize: 13, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text("\$" + price,
                style: TextStyle(fontSize: 18, color: Colors.white))
          ],
        )
      ],
    ),
  );
}

Widget totalCard(String price) {
  return Container(
    child: Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 86, 94, 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/free_delivery.svg',
                height: 15,
              ),
              Text("FREE", style: TextStyle(fontSize: 12, color: Colors.white))
            ],
          )),
        ),
        SizedBox(
          width: 56,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total:",
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(150, 167, 175, 1))),
            SizedBox(
              height: 6,
            ),
            Text("\$" + price,
                style: TextStyle(fontSize: 24, color: Colors.white))
          ],
        )
      ],
    ),
  );
}
