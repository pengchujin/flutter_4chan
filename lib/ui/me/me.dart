import 'package:flutter/material.dart';

class MeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('about'),
      ),
      body: new Container(
        child: new Center(
          child: new Text(
              "Hello fchan!",
              style: new TextStyle(color: Colors.white),
            ),
        ),
        decoration: new BoxDecoration(
            image: new DecorationImage(
                // Load image from assets
                image: new AssetImage('assets/Yotsuba_2.png'),
                // Make the image cover the whole area
                fit: BoxFit.contain)),
      ),
    );
  }
}
