import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key key,
    @required this.width,
    @required this.height,
    this.child,
    @required this.boxColor,
    this.radius,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;
  final Color boxColor;
  final double radius;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: GestureDetector(
        child: child,
        onTap: onTap,
      ),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
