import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress,@required this.bottom_title});
  final VoidCallback? onPress;
  final String? bottom_title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
            child:Padding(
              padding: EdgeInsets.only(bottom: 10),
              child:  Text(
                bottom_title!,
                style:
                klarge_button_text_style,
              ),
            )
        ),
        color: kbottom_container_color,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottom_container_height,
      ),
    );
  }
}