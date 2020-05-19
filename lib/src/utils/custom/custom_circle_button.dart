import 'package:flutter/material.dart';

import '../globals.dart';

class CustomCicleButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color bordeColor;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSizeText;
  final IconData icon;
  final Function onTap;

  const CustomCicleButton(
      {Key key,
      this.label = "",
      this.backgroundColor,
      this.textColor = Colors.white,
      this.bordeColor,
      this.height,
      this.width,
      this.borderRadius = 10,
      this.fontSizeText = 12,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: backgroundColor == null ? colorBase : backgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width == null ? mediaQuery(context, 0.13) : width,
            height: height == null ? mediaQuery(context, 0.082) : height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: bordeColor == null ? null : Border.all(color: bordeColor)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon == null ? Container() : Icon(icon, color: Colors.white),
                label == null ? null : Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.bold,
                    fontSize: fontSizeText)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
