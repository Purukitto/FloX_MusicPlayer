import 'package:flox/colors.dart';
import 'package:flox/songs.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flox/components/NameNControls.dart';

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
                child: new RadialSeekBar(
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
    this.trackWidth = 3,
    this.trackColor = primaryPink,
    this.progressWidth = 5,
    this.progressColor = primaryPurple,
    this.progressPercent = 0,
    this.thumbSize = 10,
    this.thumbColor = primaryPurple,
    this.thumbPosition = 0,
    this.child,
  });

  @override
  _SeekBarState createState() => new _SeekBarState();
}

class _SeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new RadialSeekBarPainter(
        trackWidth: widget.trackWidth,
        trackColor: widget.trackColor,
        progressWidth: widget.progressWidth,
        progressColor: widget.progressColor,
        progressPercent: widget.progressPercent,
        thumbSize: widget.thumbSize,
        thumbColor: widget.thumbColor,
        thumbPosition: widget.thumbPosition,
      ),
      child: widget.child,
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final double trackWidth;
  final Paint trackPaint;
  final double progressWidth;
  final double progressPercent;
  final Paint progressPaint;
  final double thumbSize;
  final Paint thumbPaint;
  final double thumbPosition;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required trackColor,
    @required this.progressWidth,
    @required progressColor,
    @required this.progressPercent,
    @required this.thumbSize,
    @required thumbColor,
    @required this.thumbPosition,
  })  : trackPaint = new Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        progressPaint = new Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round,
        thumbPaint = new Paint()
          ..color = thumbColor
          ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(size.height, size.width) / 2;

    //Paint track
    canvas.drawCircle(
      center,
      radius,
      trackPaint,
    );

    //Paint Progress
    final progressAngle = 2 * pi * progressPercent;
    canvas.drawArc(
      new Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
