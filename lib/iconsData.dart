import 'package:flutter/material.dart';
import 'file:///D:/Flutter%20projects/quizzler/lib/constants/Constants.dart';

//style of card

class IconsWidget extends StatelessWidget {
  IconsWidget({@required this.gender, @required this.icon}) {}

  final String gender;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kLabelStyle,
        )
      ],
    );
  }
}
