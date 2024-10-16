import 'package:flutter/material.dart';

import '../constants/constants.dart';

class IconColum extends StatelessWidget {
  IconColum({this.icon,this.label});
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 20,),
        Text(label!,style: ktext_style)
      ],
    );
  }
}


