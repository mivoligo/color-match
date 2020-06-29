import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback buttonOnTap;
  final IconData buttonIcon;

  CustomButton({
    Key key,
    this.buttonColor,
    this.buttonOnTap,
    this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: buttonColor,
      child: InkWell(
        splashColor: Colors.white54,
        onTap: buttonOnTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            buttonIcon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
