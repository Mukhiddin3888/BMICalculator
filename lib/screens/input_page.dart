import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzler/calculator_brain.dart';
import '../rectangle.dart';
import '../iconsData.dart';
import '../constants/Constants.dart';
import '../roundedButton.dart';
import '../bottomContainer.dart';
import 'results_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 165;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Rectangle(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    elements: IconsWidget(
                      gender: 'Male',
                      icon: Icon(
                        FontAwesomeIcons.mars,
                        size: kIconSize,
                        color: Colors.white,
                      ),
                    ),
                    colour: selectedGender == Gender.male
                        ? kRectangleBackColorActive
                        : kRectangleBackColorNotActive,
                  ),
                ),
                Expanded(
                  child: Rectangle(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    elements: IconsWidget(
                      gender: 'Female',
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: kIconSize,
                        color: Colors.white,
                      ),
                    ),
                    colour: selectedGender == Gender.female
                        ? kRectangleBackColorActive
                        : kRectangleBackColorNotActive,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Rectangle(
              elements: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
              colour: kRectangleBackColorActive,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Rectangle(
                    colour: kRectangleBackColorActive,
                    elements: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundedButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Rectangle(
                    colour: kRectangleBackColorActive,
                    elements: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundedButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedGender != null) {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                            bmiResult: calc.CalculateBMI(),
                            resultText: calc.getResult(),
                            feedBack: calc.getFeedback())));
              } else {
                Fluttertoast.showToast(
                    msg: "Please choose your Gender",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color(0xFF1D1E33),
                    textColor: Colors.white,
                    fontSize: 14.0);
              }
            },
            child: BottomContainer(
              text: 'CALCULATE',
            ),
          )
        ],
      ),
    ));
  }
}
