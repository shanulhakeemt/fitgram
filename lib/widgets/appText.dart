import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String? data;
  double? size;
  Color? color;
  FontWeight? fw;
  TextAlign? align;

  AppText(this.data,
      {Key? key,
      this.align = TextAlign.left,
      this.size = 16.0,
      this.color = Colors.black,
      this.fw = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      textAlign: align,
      style: TextStyle(color: color, fontSize: size, fontWeight: fw),
    );
  }
}
