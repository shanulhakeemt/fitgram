import 'package:fitgram/common/purchased_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CrediTrainerClass extends StatefulWidget {
  CrediTrainerClass(
      {Key? key,
      this.tra_name,
      this.user_id=1,
      this.email='f',
      this.phone='12',
      this.user_name='23',
      this.tra_id='23',
      this.age=12,
      this.cost,
      this.spe})
      : super(key: key);
  var tra_id;
  var tra_name;
  var user_id;
  var email;
  var phone;
  var user_name;
  var cost;
  var spe;
  var age;

  @override
  State<CrediTrainerClass> createState() => _CrediTrainerClassState();
}

class _CrediTrainerClassState extends State<CrediTrainerClass> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final _formKey = GlobalKey<FormState>();

  var uuid = Uuid();
  var order_id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    order_id = uuid.v1();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tra_name);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Axis Bank',
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Colors.blueGrey,
                backgroundImage:
                    useBackgroundImage ? 'assets/images/card_bg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: _formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.white,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     const Text(
                      //       'Glassmorphism',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 18,
                      //       ),
                      //     ),
                      //     Switch(
                      //       value: useGlassMorphism,
                      //       inactiveTrackColor: Colors.grey,
                      //       activeColor: Colors.white,
                      //       activeTrackColor: Colors.green,
                      //       onChanged: (bool value) => setState(() {
                      //         useGlassMorphism = value;
                      //       }),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     const Text(
                      //       'Card Image',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 18,
                      //       ),
                      //     ),
                      //     Switch(
                      //       value: useBackgroundImage,
                      //       inactiveTrackColor: Colors.grey,
                      //       activeColor: Colors.white,
                      //       activeTrackColor: Colors.green,
                      //       onChanged: (bool value) => setState(() {
                      //         useBackgroundImage = value;
                      //       }),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseFirestore.instance
                                  .collection('trainer_packages')
                                  .doc(order_id)
                                  .set({
                                'order_id': order_id,
                                'email': widget.email,
                                'user_id': widget.user_id,
                                'user_name': widget.user_name,
                                'trainer_name': widget.tra_name,
                                'package_id': widget.tra_id,
                                'price': widget.cost,
                                'phone': widget.phone,
                                'status': 1,
                                'created_at': DateTime.now()
                              }).then((value) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (ctx) {
                                      print(widget.tra_name);
                                  return PurchasedVerified(
                                    name: widget.tra_name,
                                  );
                                }));
                              });

                              ;
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (_formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
