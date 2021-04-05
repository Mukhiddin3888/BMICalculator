import 'package:flutter/material.dart';

//background of rectangle box

class Rectangle extends StatelessWidget {
  Rectangle({@required this.colour, this.elements, this.onPressed}) {}

  final Color colour;
  final Widget elements;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        child: elements,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
