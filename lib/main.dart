import 'package:flutter/material.dart';
import 'package:flox/app.dart';
import 'package:flox/themes.dart';

void main() => runApp(new MyMaterialApp());

class MyMaterialApp extends StatefulWidget {
  @override
  MyMaterialAppState createState() {
    return new MyMaterialAppState();
  }
}

class MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new MyApp());
  }
}
