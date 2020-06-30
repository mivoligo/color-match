import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Result extends StatelessWidget {
  final Color resultColor;
  final IconData iconData;
  final String colorName;

  Result({
    Key key,
    this.resultColor,
    this.iconData,
    this.colorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerSize =
        min(max(width, height) * 0.5, min(width, height)) - kToolbarHeight;
    double iconSize = containerSize * 0.7;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: (containerSize - iconSize) / 2,
            child: PlayAnimation<double>(
              tween: Tween(begin: iconSize, end: iconSize * 2 / 3),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              builder: (_, __, value) {
                return Icon(
                  iconData,
                  size: value,
                  color: resultColor,
                );
              },
            ),
          ),
          Positioned(
            top: iconSize,
            child: PlayAnimation<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              builder: (_, __, value) {
                return Opacity(
                  opacity: value,
                  child: Text(
                    colorName,
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: iconSize / 6,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
