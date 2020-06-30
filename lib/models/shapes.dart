import 'dart:math';

import 'package:flutter/material.dart';

class RandomShapes extends ChangeNotifier {
  final List _shapeList = [
    Icons.accessibility,
    Icons.android,
    Icons.bookmark,
    Icons.face,
    Icons.favorite,
    Icons.grade,
    Icons.home,
    Icons.hourglass_full,
    Icons.label,
    Icons.pan_tool,
    Icons.pets,
    Icons.question_answer,
    Icons.settings,
    Icons.shopping_cart,
    Icons.shopping_basket,
    Icons.thumb_up,
    Icons.verified_user,
    Icons.work,
    Icons.radio,
    Icons.videocam,
    Icons.email,
    Icons.weekend,
    Icons.network_wifi,
    Icons.cloud,
    Icons.brightness_1,
    Icons.camera,
    Icons.broken_image,
    Icons.photo_camera,
    Icons.remove_red_eye,
    Icons.directions_boat,
    Icons.directions_car,
    Icons.local_florist,
    Icons.adb,
    Icons.free_breakfast,
    Icons.notifications,
    Icons.cake,
    Icons.casino,
  ];

  final _random = Random();

  IconData _shape = Icons.bookmark;
  IconData get shape => _shape;
//  set shape(value) {
//    _shape = value;
//    notifyListeners();
//  }

  void randomShape() {
    _shape = _shapeList[_random.nextInt(_shapeList.length)];
    notifyListeners();
  }
}
