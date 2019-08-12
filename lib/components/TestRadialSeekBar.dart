import 'package:flox/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';

double _thumbPercent = 0;

class RaidalDragBar extends StatefulWidget {
  _RadialState createState() => new _RadialState();
}

class _RadialState extends State<RaidalDragBar> {
  Widget build(buildRadialSeek) {
    return RadialSeekBar(
      trackColor: primaryPink,
      trackWidth: 2.0,
      progressColor: primaryPurple,
      progressWidth: 4.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: accentPurple,
        diameter: 15.0,
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
