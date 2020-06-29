import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match the color'),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[],
      ),
    );
  }
}
