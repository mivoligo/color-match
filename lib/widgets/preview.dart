import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Preview extends StatelessWidget {
  final Color targetColor;
  final Color changableColor;
  final IconData iconData;

  Preview({
    Key key,
    this.targetColor,
    this.changableColor,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerSize =
        min(max(width, height) / 2, min(width, height)) - kToolbarHeight;
    double iconSize = containerSize * 0.7;
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: (containerSize - iconSize) / 2,
                  right: -(iconSize / 2),
                  child: PlayAnimation<double>(
                    tween: Tween(begin: iconSize * 2 / 3, end: iconSize),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    builder: (_, __, value) {
                      return Icon(
                        iconData,
                        size: value,
                        color: targetColor,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: (containerSize - iconSize) / 2,
                  left: -(iconSize / 2),
                  child: PlayAnimation<double>(
                    tween: Tween(begin: iconSize * 2 / 3, end: iconSize),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    builder: (_, __, value) {
                      return Icon(
                        iconData,
                        size: value,
                        color: changableColor,
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
