import 'package:bmi_calculator/constantFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'texticon.dart';
import 'reusableCard.dart';
import 'constantFile.dart';
import 'resultfile.dart';
import 'calculatorBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderHeight = 180;
  int sliderWeight = 60;
  int sliderAge = 20;
  // Color maleColor = deActiveColor;
  // Color femaleColor = deActiveColor;
  // void updateColor(Gender genderType) {
  //   if (genderType == Gender.male) {
  //    maleColor = activeColor;
  //    femaleColor = deActiveColor;
  //  }
  //if (genderType == Gender.female) {
  //    maleColor = deActiveColor;
  //   femaleColor = activeColor;
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
            child: Row(children: [
          Expanded(
            child: ReusableCard(
              onPressed: () {
                setState(() {
                  selectGender = Gender.male;
                });
              },
              color: selectGender == Gender.male ? activeColor : deActiveColor,
              cardWidget: const ReuseableTextandIcon(
                  iconData: FontAwesomeIcons.male, label: 'MALE'),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPressed: () {
                setState(() {
                  selectGender = Gender.female;
                });
              },
              color:
                  selectGender == Gender.female ? activeColor : deActiveColor,
              cardWidget: const ReuseableTextandIcon(
                iconData: FontAwesomeIcons.female,
                label: 'FEMALE',
              ),
            ),
          ),
        ])),
        Expanded(
          child: ReusableCard(
            color: const Color(0xFF1D1E33),
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderHeight.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kTextStyle,
                    ),
                  ],
                ),
                Slider(
                    value: sliderHeight.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderHeight = newValue.round();
                      });
                    })
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(children: [
          Expanded(
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WEIGHT',
                    style: kTextStyle,
                  ),
                  Text(
                    sliderWeight.toString(),
                    style: kNumberStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIcon(
                        iconData: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            sliderWeight--;
                          });
                        },
                      ),
                      RoundIcon(
                        iconData: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            sliderWeight++;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'AGE',
                    style: kTextStyle,
                  ),
                  Text(
                    sliderAge.toString(),
                    style: kNumberStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIcon(
                        iconData: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            sliderAge--;
                          });
                        },
                      ),
                      RoundIcon(
                        iconData: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            sliderAge++;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ])),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: sliderHeight, weight: sliderWeight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultScreen()));
          },
          child: Container(
            child: const Center(
              child: Text(
                'Calculate',
                style: kLargeButtonStyle,
              ),
            ),
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
          ),
        ),
      ]),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({
    required this.iconData,
    this.onPress,
  });
  final IconData iconData;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4E5F),
    );
  }
}
