import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: StadiumBorder(),
      color: Colors.blueGrey,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
