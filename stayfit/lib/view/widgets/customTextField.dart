import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/utils/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.height,
    @required this.width,
    this.controller,
    this.obscureText = false,
    this.suffix,
    this.hintText,
    this.prefixIcon,
    this.prefixBoxColor,
    this.phoneNumberPrefix,
    this.keyboardType = TextInputType.text,
    this.dropDown,
  }) : super(key: key);

  final double height;
  final double width;
  final TextEditingController controller;
  final bool obscureText;
  final Widget suffix;
  final String hintText;
  final Widget prefixIcon;
  final Color prefixBoxColor;
  final Widget phoneNumberPrefix;
  final TextInputType keyboardType;
  final Widget dropDown;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: width,
        height: 54,
        child: TextField(
          style: AppTheme.textFieldTS,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: dropDown != null ? true : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTheme.textFieldTS,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: phoneNumberPrefix != null
                    ? 106
                    : dropDown != null
                        ? width * 0.8
                        : 38,
                height: 54,
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 48,
                      decoration: BoxDecoration(
                        color: prefixBoxColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: prefixIcon,
                    ),
                    phoneNumberPrefix != null ? phoneNumberPrefix : Container(),
                    dropDown != null ? dropDown : Container(),
                  ],
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20,
            ),
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}