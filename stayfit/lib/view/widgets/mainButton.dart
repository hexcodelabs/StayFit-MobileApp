import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/utils/themes.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.width,
    @required this.height,
    @required this.onPressed,
    @required this.text,
    this.loading = false,
    this.suffixIcon,
    this.prefixIcon,
    this.boxColor,
    this.shadowColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Function onPressed;
  final String text;
  final bool loading;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Color boxColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 58,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor.withOpacity(0.06),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prefixIcon != null ? prefixIcon : Container(),
                  prefixIcon != null
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  Text(
                    text,
                    style: AppTheme.mainButtonTS,
                  ),
                  suffixIcon != null
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  suffixIcon != null ? suffixIcon : Container(),
                ],
              ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: boxColor,
        textColor: Colors.white,
        onPressed: loading ? () {} : onPressed,
      ),
    );
  }
}
