import 'package:color_match/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ColorSetter extends StatelessWidget {
  @required
  final Color color;
  final double sliderMin;
  final double sliderMax;
  @required
  final double sliderValue;
  @required
  final ValueChanged<double> onChanged;
  @required
  final VoidCallback minusOnPressed;
  @required
  final VoidCallback plusOnPressed;

  ColorSetter({
    Key key,
    this.color,
    this.sliderMin = 0.0,
    this.sliderMax = 255.0,
    this.sliderValue,
    this.onChanged,
    this.minusOnPressed,
    this.plusOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          CustomIconButton(
            buttonColor: sliderValue == sliderMin ? Colors.grey[300] : color,
            buttonIcon: Icons.remove,
            buttonOnTap: sliderValue == sliderMin ? null : minusOnPressed,
          ),
          Expanded(
            child: Slider(
              activeColor: color,
              inactiveColor: color,
              min: sliderMin,
              max: sliderMax,
              value: sliderValue,
              onChanged: onChanged,
            ),
          ),
          CustomIconButton(
            buttonColor: sliderValue == sliderMax ? Colors.grey[300] : color,
            buttonIcon: Icons.add,
            buttonOnTap: sliderValue == sliderMax ? null : plusOnPressed,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
