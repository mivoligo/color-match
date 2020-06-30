import 'dart:math';

import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  String pageTitle = 'Match the colors';
  String newColorsButtonTitle = 'New color';
  String answerButtonTitle = 'Show answer';

  Color backgroundColor = Colors.grey[100];

  Color _targetColor = Colors.pink;
  Color get targetColor => _targetColor;
  void setTargetColor() {
    _targetColor = Color.fromARGB(
        255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
  }

  String colorName;

  Random _random = Random();
  int _red = 128;
  int _green = 128;
  int _blue = 128;

  get red => _red;
  set red(value) {
    _red = value.toInt();
    notifyListeners();
  }

  get green => _green;
  set green(value) {
    _green = value.toInt();
    notifyListeners();
  }

  get blue => _blue;
  set blue(value) {
    _blue = value.toInt();
    notifyListeners();
  }

  get changableColor => Color.fromARGB(255, _red, _green, _blue);

  get isMatch => targetColor == changableColor;

  void showAnswer() {
    red = _targetColor.red;
    green = _targetColor.green;
    blue = _targetColor.blue;
  }

  void newColors() {
    setTargetColor();
    notifyListeners();
  }

  void colorToString() {
    String _r = _targetColor.red.toRadixString(16).padLeft(2, '0');
    String _g = _targetColor.green.toRadixString(16).padLeft(2, '0');
    String _b = _targetColor.blue.toRadixString(16).padLeft(2, '0');
    colorName = '#$_r$_g$_b';
  }
}
