import 'package:flutter/material.dart';


class StyledContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final BorderRadius borderRadius;
  final void Function() onTap;
  final String? img;

  StyledContainer({
    required this.child,
    this.width=250,
    this.height=45,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    required this.onTap,
    this.img='fi1.jpg'
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(('assets/images/'+img.toString())),
                fit: BoxFit.cover)),
        child:Center(
          child: child,
        ),
      ),
    );
  }
}