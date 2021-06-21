import 'package:flutter/material.dart';

Route pageRoute(page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Widget customText({text, color, weight, double size, align}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
        color: color, fontWeight: weight, fontSize: size),
  );
}



