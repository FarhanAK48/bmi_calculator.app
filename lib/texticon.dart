import 'package:bmi_calculator/constantFile.dart';
import 'package:flutter/material.dart';
import 'constantFile.dart';

class ReuseableTextandIcon extends StatelessWidget {
  const ReuseableTextandIcon({
    required this.iconData,
    this.label,
  });
  final IconData iconData;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        iconData,
        size: 25,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(label!, style: kTextStyle),
    ]);
  }
}
