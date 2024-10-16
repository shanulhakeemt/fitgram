import 'dart:core';
import 'dart:core';


import 'package:fitgram/Widget/container.dart';
import 'package:fitgram/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../Widget/bootom_button.dart';

class ResultBmi extends StatelessWidget {
 ResultBmi({required this.bmi_result,required this.bmi_result_text,required this.bmi_message});
 final String bmi_result;
 final String bmi_result_text;
 final String bmi_message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATION'),
          ),
          backgroundColor: Color(0xFF0E0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Your Result',
                        style: ktitle_text_style,
                      ),
                    ))),
            Expanded(
                flex: 5,
                child: ReUseContainer(
                  colour: kactive_container_color,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmi_result_text.toUpperCase(),
                        style: kresult_text_style,
                      ),
                      Text(
                        bmi_result,
                        style: kBMI_text_style,
                      ),
                      Text(
                        bmi_message,
                        style: kBody_text_style,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                bottom_title: 'RE-CALCULATE')
          ],
        ));
  }
}
