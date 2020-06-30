import 'package:color_match/models/home_page_model.dart';
import 'package:color_match/models/shapes.dart';
import 'package:color_match/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageModel()),
        ChangeNotifierProvider(create: (_) => RandomShapes()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Match',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Ubuntu'),
      home: HomePage(),
    );
  }
}
