import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'input_page.dart';

import 'constantFile.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    required this.bmiResult,
    required this.resultText,
    required this.interPretation,
  });

  final String bmiResult;
  final String resultText;
  final String interPretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  'Your Result',
                  style: kTitleStyle2,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Normal',
                    style: kNormalStyle,
                  ),
                  Text(
                    '18.3',
                    style: kNmbrStyle,
                  ),
                  Text(
                    'BMI is Low Should have to work more',
                    style: kBmiStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultScreen()));
              },
              child: Container(
                child: const Center(
                  child: Text(
                    'ReCalculate',
                    style: kLargeButtonStyle,
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}
