import 'package:flox/colors.dart';
import 'package:flox/components/NameNControls.dart';
import 'package:flutter/material.dart';
import 'package:flox/components/RadialSeekBar.dart';

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
            child: new RaidalDragBar(),
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
