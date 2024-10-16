import 'package:fitgram/widgets/appText.dart';
import 'package:flutter/material.dart';



class AppButton extends StatelessWidget {

  double? height;
  double?width;
  String? btnText;
  Color? btnColor;
  Color? btnTextColor;


  AppButton({Key? key,this.btnColor,required this.btnText,this.btnTextColor,this.height=45,this.width=250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


      height: height,
      width: width,
decoration: BoxDecoration(

  color: btnColor,
  borderRadius: BorderRadius.circular(16.0)
),


      child: Center(child: AppText(btnText,color: btnTextColor,)),
    );
  }
}
