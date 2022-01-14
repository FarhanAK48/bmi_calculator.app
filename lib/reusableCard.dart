import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.color,
    this.cardWidget,
    this.onPressed,
  });
  final Color color;
  final Widget? cardWidget;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: cardWidget,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
