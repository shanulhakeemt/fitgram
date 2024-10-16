
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});
  final IconData? icon;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon),
      onPressed: onPress,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 0.0,
    );
  }
}