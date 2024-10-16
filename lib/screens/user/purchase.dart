import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:uuid/uuid.dart';

class OrderPageSecond extends StatefulWidget {
  var paymentdata;
  var unitprice;
  var productname;

  var offers;
  var totalsales;
  var manuf;
  var stock;
  String? productid;
  String? nurseryid;
  var orderid;
  var totalamount;
  var ordercount;
  String? userid;

  String? username;
  String? userphone;
  String? useremail;
  String? useraddress;
  String? userpin;
  String? userimgurl;

  OrderPageSecond({
    Key? key,
    this.paymentdata,
    this.username,
    this.useraddress,
    this.useremail,
    this.userphone,
    this.userimgurl,
    this.userpin,
    this.userid,
    this.orderid,
    this.totalamount,
    this.ordercount,
    this.totalsales,
    this.productid,
    this.nurseryid,
    this.stock,
    this.manuf,
    this.unitprice,
    this.productname,
    this.offers,
  }) : super(key: key);
  @override
  State<OrderPageSecond> createState() => _OrderPageSecondState();
}

class _OrderPageSecondState extends State<OrderPageSecond> {
  var uuid = Uuid();
  var paymentid;
  var _paymentdata;
  @override
  void initState() {
    _paymentdata=widget.paymentdata;

    print(_paymentdata);
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    paymentid = uuid.v1();

    print(widget.stock);
    print(widget.ordercount);
    print(widget.totalsales);
    super.initState();
  }

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: !useBackgroundImage
              ? const DecorationImage(
            image: ExactAssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          )
              : null,
          color: Colors.red
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
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
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
                          if (formKey.currentState!.validate()) {

                            int i;


                            print(_paymentdata);

                            var len=_paymentdata.length;
                            for (i=0;i<len;i++) {
                              print(paymentid);
                              print('OrderId:${_paymentdata[i]['orderid']}');
                              //print(paymentid);
                              FirebaseFirestore.instance
                                  .collection('payments')
                                  .doc(paymentid)
                                  .set({
                                'paymentid': paymentid,
                                'nurseryid': _paymentdata[i]['nurseryid'],
                                'orderid': _paymentdata[i]['orderid'],
                                'userid': _paymentdata[i]['userid'],
                                'orderamount': _paymentdata[i]['totalamount'],
                                'createdat': DateTime.now(),
                                'statusmessasge': "Success",
                                'status': 1,
                                'cardnumber': cardNumber,
                                'cardholder': cardHolderName,
                              }



                              );
                              FirebaseFirestore.instance
                                  .collection('orders')
                                  .doc(_paymentdata[i]['orderid'].toString())
                                  .update({
                                'deliveymessage': "pending",
                                'status': 1,
                                'paymentstatus': 1,
                              });


                              FirebaseFirestore.instance
                                  .collection('plants')
                                  .doc(_paymentdata[i]['productid'])
                                  .update({
                                'stock': FieldValue.increment(-int.parse(_paymentdata[i]['orderquantity'].toString())) ,
                                'salescount':FieldValue.increment(int.parse(_paymentdata[i]['orderquantity'].toString()))


                              });


                              paymentid=uuid.v1();




                            }
                            print('HOrrrrrr');





                            // FirebaseFirestore.instance
                            //     .collection('payments')
                            //     .doc(paymentid)
                            //     .set({
                            //   'paymentid': paymentid,
                            //   'nurseryid': widget.nurseryid,
                            //   'orderid': widget.orderid,
                            //   'userid': widget.userid,
                            //   'orderamount': widget.totalamount,
                            //   'createdat': DateTime.now(),
                            //   'statusmessasge': "Success",
                            //   'status': 1,
                            //   'cardnumber': cardNumber,
                            //   'cardholder': cardHolderName,
                            // }).then((value) {
                            //   FirebaseFirestore.instance
                            //       .collection('orders')
                            //       .doc(widget.orderid)
                            //       .update({
                            //     'deliveymessage': "pending",
                            //     'status': 1,
                            //     'paymentstatus': 1,
                            //   }).then((value) {
                            //     FirebaseFirestore.instance
                            //         .collection('plants')
                            //         .doc(widget.productid)
                            //         .update({
                            //       'stock': int.parse(widget.stock.toString()) -
                            //           int.parse(widget.ordercount.toString()),
                            //       'salescount': int.parse(
                            //               widget.totalsales.toString()) +
                            //           int.parse(widget.ordercount.toString())
                            //     }).then((value) {
                            //
                            //     });
                            //     print(widget.userid);
                            //     print(widget.username);
                            //     print(widget.useremail);
                            //     print(widget.stock);
                            //   });
                            // });
                          } else {
                            print('invalid!');
                          }
                        },
                      ),
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