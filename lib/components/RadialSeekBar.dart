import 'dart:math';

import 'package:flox/colors.dart';
import 'package:flox/songs.dart';
import 'package:flutter/material.dart';
import 'package:fluttery/gestures.dart';
import 'package:flox/components/CircleClipper.dart';

class RaidalDragBar extends StatefulWidget {
  final double seekPercent;
  RaidalDragBar({
    this.seekPercent = 0,
  });
  @override
  _RaidalDragBarState createState() => _RaidalDragBarState();
}

class _RaidalDragBarState extends State<RaidalDragBar> {
  double _seekPercent = 0.1;
  PolarCoord _startDragCoord;
  double _startDragPercent;
  double _currentDragPercent;

  @override
  void initState() {
    super.initState();
    _seekPercent = widget.seekPercent;
  }

  @override
  void didUpdateWidget(RaidalDragBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _seekPercent = widget.seekPercent;
  }

  void _onDragStart(PolarCoord coord) {
    _startDragCoord = coord;
    _startDragPercent = _seekPercent;
  }

  void _onDragUpdate(PolarCoord coord) {
    final dragAngle = coord.angle - _startDragCoord.angle;
    final dragPercent = dragAngle / (2 * pi);
    setState(() {
      _currentDragPercent = (_startDragPercent + dragPercent) % 1;
    });
  }

  void _onDragEnd() {
    setState(() {
      _seekPercent = _currentDragPercent;
      _currentDragPercent = null;
      _startDragCoord = null;
      _startDragPercent = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RadialDragGestureDetector(
      onRadialDragStart: _onDragStart,
      onRadialDragUpdate: _onDragUpdate,
      onRadialDragEnd: _onDragEnd,
      child: new Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: new Center(
          child: new Container(
            width: 230,
            height: 230,
            child: new RadialSeekBar(
              trackColor: primaryPink.withOpacity(.65),
              progressPercent: _currentDragPercent ?? _seekPercent,
              thumbPosition: _currentDragPercent ?? _seekPercent,
              thumbColor: accentPurple,
              innerPadding: const EdgeInsets.all(10),
              child: new ClipOval(
                clipper: new CircleClipper(),
                child: new Image.network(
                  demoPlaylist.songs[0].albumArtUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
  final EdgeInsets innerPadding;
  final EdgeInsets outerPadding;
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
    this.outerPadding = const EdgeInsets.all(0),
    this.innerPadding = const EdgeInsets.all(0),
    this.child,
  });

  @override
  _SeekBarState createState() => new _SeekBarState();
}

class _SeekBarState extends State<RadialSeekBar> {
  EdgeInsets _insetsForPainter() {
    final outerThickness = max(
          widget.trackWidth,
          max(widget.progressWidth, widget.thumbSize),
        ) /
        2;
    return new EdgeInsets.all(outerThickness);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: widget.outerPadding,
      child: new CustomPaint(
        foregroundPainter: new RadialSeekBarPainter(
          trackWidth: widget.trackWidth,
          trackColor: widget.trackColor,
          progressWidth: widget.progressWidth,
          progressColor: widget.progressColor,
          progressPercent: widget.progressPercent,
          thumbSize: widget.thumbSize,
          thumbColor: widget.thumbColor,
          thumbPosition: widget.thumbPosition,
        ),
        child: new Padding(
          padding: _insetsForPainter() + widget.innerPadding,
          child: widget.child,
        ),
      ),
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
    final outerThickness = max(trackWidth, max(progressWidth, thumbSize));
    Size contrainedSize = new Size(
      size.width - outerThickness,
      size.height - outerThickness,
    );

    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(contrainedSize.height, contrainedSize.width) / 2;

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

    //Paint thumb
    final thumbAngle = 2 * pi * thumbPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * radius;
    final thumbY = sin(thumbAngle) * radius;
    final thumbCenter = new Offset(thumbX, thumbY) + center;
    final thumbRadius = thumbSize / 2;
    canvas.drawCircle(
      thumbCenter,
      thumbRadius,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
