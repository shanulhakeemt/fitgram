import 'package:flutter/material.dart';

class ReUseContainer extends StatelessWidget {
  ReUseContainer({required this.colour, this.cardChild,this.onPress});
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
