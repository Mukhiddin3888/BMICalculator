import 'package:flutter/material.dart';
import 'package:quizzler/constants/Constants.dart';
import '../rectangle.dart';
import '../bottomContainer.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.feedBack}) {}

  final String bmiResult;
  final String resultText;
  final String feedBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: Rectangle(
              colour: kRectangleBackColorActive,
              elements: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kLabelStyleGreen,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    bmiResult,
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text('Normal BMI range:', style: kLabelStyle),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text('18.25 - 25 kg/m2', style: kLabelStyleWhite),
                  SizedBox(
                    height: 36.0,
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(feedBack, style: kLabelStyle),
                  )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomContainer(
              text: 'RE-CALCULATE',
            ),
          )
        ],
      ),
    );
  }
}
