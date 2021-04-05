import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.icon, @required this.onPress}) {}
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RawMaterialButton(
        shape: CircleBorder(),
        onPressed: () {
          onPress();
        },
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
