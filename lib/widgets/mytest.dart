
import 'package:flutter/material.dart';
class StyledText extends StatelessWidget {
   String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextStyle? style;

  StyledText({
    this.style,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}