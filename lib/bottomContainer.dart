import 'package:flutter/material.dart';
import 'package:quizzler/screens/input_page.dart';
import 'constants/Constants.dart';
import 'calculator_brain.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({@required this.text}) {}

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: kTextStyleCalculate,
        ),
      ),
      margin: EdgeInsets.only(top: 16.0),
      color: Color(0xFFEB1555),
      height: 66.0,
    );
  }
}
