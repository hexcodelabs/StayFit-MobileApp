import 'package:flutter/cupertino.dart';

Widget myText({text, color, weight, double size, align}) {
  return Text(
    text,
    textAlign: align,
    maxLines: 3,
    style: TextStyle(
        color: color, fontWeight: weight, fontSize: size, fontFamily: "Gilroy"),
  );
}

Widget myContainer({height, width, color, image, radius}) {
  return Stack(
    children: [
      image == null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/placeholders/service-category.png"),
                  )),
            )
          : Container(),
      image != null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  )),
            )
          : Container(),
    ],
  );
}
