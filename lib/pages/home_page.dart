import 'package:color_match/models/home_page_model.dart';
import 'package:color_match/widgets/color_setter.dart';
import 'package:color_match/widgets/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.select((HomePageModel p) => p.pageTitle)),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return Flex(
          direction: orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Preview(),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ButtonBar(),
                    ColorSetter(
                      color: Colors.red,
                      minusOnPressed: null,
                      plusOnPressed: null,
                      sliderValue: 100,
                      onChanged: null,
                    ),
                    ColorSetter(
                      color: Colors.green,
                      minusOnPressed: null,
                      plusOnPressed: null,
                      sliderValue: 100,
                      onChanged: null,
                    ),
                    ColorSetter(
                      color: Colors.blue,
                      minusOnPressed: null,
                      plusOnPressed: null,
                      sliderValue: 100,
                      onChanged: null,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
