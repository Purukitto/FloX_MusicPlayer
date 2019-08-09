import 'package:flox/colors.dart';
import 'package:flox/songs.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flox/NameNControls.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: primaryBlack,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          color: primaryPink,
          onPressed: () {},
        ),
        title: new Text(""),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            color: primaryPink,
            onPressed: () {},
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          //Seek Bar
          new Expanded(
            child: new Center(
                child: new Container(
              width: 150,
              height: 150,
              child: new ClipOval(
                clipper: new CircleClipper(),
                child: new Image.network(
                  demoPlaylist.songs[2].albumArtUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),

          // Song info
          new NameNControls(),
          //Visualiser
          new Container(
            width: double.infinity,
            height: 175,
          )
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
