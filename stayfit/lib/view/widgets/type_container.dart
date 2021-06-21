import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/utils/color.dart';
import 'package:stayfit/utils/themes.dart';

class TypeContainer extends StatelessWidget {
  const TypeContainer({
    Key key,
    @required this.item,
    this.onTap,
    this.containerColor,
  }) : super(key: key);

  final String item;
  final Function onTap;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: containerColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: Text(
              '$item',
              style: AppTheme.typePickerTS,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[50].withOpacity(0.6),
              ),
              child: Icon(
                Icons.close,
                color: mainRed,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
