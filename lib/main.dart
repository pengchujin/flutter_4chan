import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_chan/homeScreen.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder> {
      '/HomeScreen': (BuildContext context) => new HomeScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
           padding: const EdgeInsets.all(100.0),
           child: new Image.asset('assets/splash.png',),
        ),
        
      ),
    );
  }
}
