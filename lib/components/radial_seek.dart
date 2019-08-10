import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';

double _thumbPercent = 0.4;

class BuildSeek extends StatefulWidget {
  _RadialState createState() => new _RadialState();
}

class _RadialState extends State<BuildSeek> {
  Widget build(buildRadialSeek) {
    return RadialSeekBar(
      trackColor: Colors.white.withOpacity(.5),
      trackWidth: 2.0,
      progressColor: Colors.white,
      progressWidth: 5.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: Colors.white,
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }
}
