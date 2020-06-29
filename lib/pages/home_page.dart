import 'package:color_match/models/home_page_model.dart';
import 'package:color_match/widgets/color_setter.dart';
import 'package:color_match/widgets/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final _homePageModel = Provider.of<HomePageModel>(context, listen: false);
    print('rebuilding');
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
