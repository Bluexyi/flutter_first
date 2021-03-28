import 'package:flutter/material.dart';
import 'package:orange_valley_caa/pages/home_page.dart';

void main() {
  runApp(OrangeValleyApp());
}

class OrangeValleyApp extends StatefulWidget {
  @override
  _OrangeValleyAppState createState() => _OrangeValleyAppState();
}

class _OrangeValleyAppState extends State<OrangeValleyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}