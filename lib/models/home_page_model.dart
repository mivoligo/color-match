import 'dart:math';

import 'package:flutter/material.dart';

class HomePageModel {
  String pageTitle = 'Match the color';
  String newColorsButtonTitle = 'New colour'.toUpperCase();
  String answerButtonTitle = 'Show answer'.toUpperCase();

  Color backgroundColor = Colors.grey[100];

  Color targetColor;

  String colorName;

  Random _random = Random();
  int _red = 128;
  int _green = 128;
  int _blue = 128;

  get red => _red;
  set red(value) {
    _red = value.toInt();
//    notifyListeners();
  }

  get green => _green;
  set green(value) {
    _green = value.toInt();
//    notifyListeners();
  }

  get blue => _blue;
  set blue(value) {
    _blue = value.toInt();
//    notifyListeners();
  }

  get changableColor => Color.fromARGB(255, _red, _green, _blue);

  get isMatch => targetColor == changableColor;

  void showAnswer() {
    red = targetColor.red;
    green = targetColor.green;
    blue = targetColor.blue;
  }

  void setTargetColor() {
    targetColor = Color.fromARGB(
        255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
  }

  void newColors() {
    setTargetColor();
//    notifyListeners();
  }

  void colorToString() {
    String _r = targetColor.red.toRadixString(16).padLeft(2, '0');
    String _g = targetColor.green.toRadixString(16).padLeft(2, '0');
    String _b = targetColor.blue.toRadixString(16).padLeft(2, '0');
    colorName = '#$_r$_g$_b';
  }
}
