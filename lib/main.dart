import 'drawScreen.dart';
import 'env.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(DrawApp());

class DrawApp extends StatelessWidget {

  static String _pkg = "kids-coaching-connection-app";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
