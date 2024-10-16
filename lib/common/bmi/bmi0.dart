
import 'package:fitgram/common/bmi/bmi_result.dart';
import 'package:fitgram/common/bmi/brain_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Widget/bootom_button.dart';
import '../../Widget/container.dart';
import '../../Widget/icon.dart';
import '../../Widget/round_icon.dart';
import '../../constants/constants.dart';

enum Gender { male, female }

class BM extends StatefulWidget {
  const BM({Key? key}) : super(key: key);

  @override
  State<BM> createState() => _BMState();
}

class _BMState extends State<BM> {
  int height = 180;
  int weight = 60;
  int age = 18;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0E0E21),
            title: Center(child: Text('BMI Calculation'.toUpperCase())),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReUseContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kactive_container_color
                          : kinactive_container_color,
                      cardChild: IconColum(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUseContainer(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kactive_container_color
                            : kinactive_container_color,
                        cardChild: IconColum(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        )),
                  ),
                ],
              )),
              Expanded(
                child: ReUseContainer(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: ktext_style,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: knumber_text_style),
                          Text(
                            'cm',
                            style: ktext_style,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayColor: Color(0x29EB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                            min: 120,
                            max: 220,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                  colour: kactive_container_color,
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReUseContainer(
                      colour: kactive_container_color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: ktext_style,
                          ),
                          Text(
                            weight.toString(),
                            style: knumber_text_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUseContainer(
                      colour: kactive_container_color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: ktext_style,
                          ),
                          Text(
                            age.toString(),
                            style: knumber_text_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              BottomButton(bottom_title: 'CALCULATE',onPress: (){

                BmiBrain calc=new BmiBrain(height: height, weight: weight);

                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ResultBmi(bmi_result: calc.calculateBmi(), bmi_result_text:calc.getResult(), bmi_message: calc.getMessage());
                }));
              },)
            ],
          )),
    );
  }
}


