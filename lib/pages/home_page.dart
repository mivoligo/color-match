import 'package:color_match/models/home_page_model.dart';
import 'package:color_match/models/shapes.dart';
import 'package:color_match/widgets/color_setter.dart';
import 'package:color_match/widgets/custom_text_button.dart';
import 'package:color_match/widgets/preview.dart';
import 'package:color_match/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homePageModel = Provider.of<HomePageModel>(context, listen: false);
    final _shapeModel = Provider.of<RandomShapes>(context, listen: false);
    _homePageModel.setTargetColor();
//    print('rebuilding');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(_homePageModel.pageTitle),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        // Flex widget simplifies creating landscape and portrait layout
        return Flex(
          direction: orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Consumer2<HomePageModel, RandomShapes>(
                builder: (_, homePageModel, randomShapesModel, __) {
                  if (homePageModel.isMatch) {
                    homePageModel.colorToString();
                    return Result(
                      resultColor: homePageModel.targetColor,
                      iconData: randomShapesModel.shape,
                      colorName: homePageModel.colorName,
                    );
                  }
                  return Preview(
                    targetColor: homePageModel.targetColor,
                    iconData: randomShapesModel.shape,
                    changableColor: homePageModel.changableColor,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        CustomTextButton(
                          text: _homePageModel.newColorsButtonTitle,
                          onPressed: () {
                            _homePageModel.newColors();
                            _shapeModel.randomShape();
                          },
                        ),
                        CustomTextButton(
                          text: _homePageModel.answerButtonTitle,
                          onPressed: () {
                            _homePageModel.showAnswer();
                          },
                        ),
                      ],
                    ),
                    Consumer<HomePageModel>(
                      builder: (_, model, __) => ColorSetter(
                        color: Colors.red,
                        minusOnPressed: () => model.red--,
                        plusOnPressed: () => model.red++,
                        sliderValue: model.red.toDouble(),
                        onChanged: (value) => model.red = value,
                      ),
                    ),
                    Consumer<HomePageModel>(
                      builder: (_, model, __) => ColorSetter(
                        color: Colors.green,
                        minusOnPressed: () => model.green--,
                        plusOnPressed: () => model.green++,
                        sliderValue: model.green.toDouble(),
                        onChanged: (value) => model.green = value,
                      ),
                    ),
                    Consumer<HomePageModel>(
                      builder: (_, model, __) => ColorSetter(
                        color: Colors.blue,
                        minusOnPressed: () => model.blue--,
                        plusOnPressed: () => model.blue++,
                        sliderValue: model.blue.toDouble(),
                        onChanged: (value) => model.blue = value,
                      ),
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
