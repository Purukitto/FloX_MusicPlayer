import 'package:flox/colors.dart';
import 'package:flox/songs.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flox/components/NameNControls.dart';
import 'package:flox/components/radial_seek.dart';

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
                child: BuildSeek(
                  child: new ClipOval(
                    clipper: new CircleClipper(),
                    child: new Image.network(
                      demoPlaylist.songs[2].albumArtUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Song info
          new NameNControls(),
          //Visualiser
          new Container(
            width: double.infinity,
            height: 175,
          ),
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

/*

class RadialSeekBar extends StatefulWidget {
  final double trackWidth;
  final Color trackColor;
  final double progressWidth;
  final Color progressColor;
  final double progressPercent;
  final double thumbSize;
  final Color thumbColor;
  final double thumbPosition;
  final Widget child;

  RadialSeekBar({
    this.trackWidth =3,
    this.trackColor = Colors.grey,
    this.progressWidth= 5,
    this.progressColor=primaryBlack,
    this.progressPercent=0,
    this.thumbSize=10,
    this.thumbColor=primaryBlack,
    this.thumbPosition=0,
    this.child,
  })

  @override
  _SeekBarState createState() => new _SeekBarState();
}

class _SeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new RadialSeekBar(),
    );
  }
}
*/
