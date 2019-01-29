

import 'package:flutter/material.dart';
import 'package:four_chan/homeScreen.dart';


void main(List<String> args) {
  runApp(new MaterialApp(
    home: new HomeScreen(),
    routes: <String, WidgetBuilder> {
      '/HomeScreen': (BuildContext context) => new HomeScreen()
    },
  ));
}
