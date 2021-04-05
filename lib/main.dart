import 'package:flutter/material.dart';
import 'package:quizzler/screens/input_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InputPage(),
    theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21)),
  ));
}
