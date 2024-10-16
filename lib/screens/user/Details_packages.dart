import 'dart:math';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/data/var.dart';
import 'package:fitgram/screens/user/credt_card.dart';
import 'package:flutter/material.dart';

import '../../common/loginpage.dart';

class PackageDetails extends StatefulWidget {
  PackageDetails({
this.pack_id,
    this.desc,
    this.name,
    this.img,
    this.day = 60,
    this.price,
    this.workout,
    this.offer,this.salescount,this.rating,this.id,this.email,this.phone,this.user_name

  });

  var pack_id;
  var workout;
  var phone;
  var name;
  var email;
  var id;
  var desc;
  var day;
var offer;
var salescount;
var rating;
  var img;
  var user_name;
  var price;

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {

  @override
  Widget build(BuildContext context) {
    print(widget.workout);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white60,
                        blurRadius: 1.0,
                      ),
                    ],
                    image: DecorationImage(
                        image: NetworkImage((widget.img.toString())),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 90),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: Text(
                                widget.name.toString(),
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'details'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
   Column(children: [
     Container(
       decoration: BoxDecoration(

           boxShadow: [
             BoxShadow(
               color: Colors.white,
               blurRadius: 1.0,
             ),
           ]
       ),
       child:          Padding(
         padding: EdgeInsets.all(20),
         child: Text(
           widget.desc.toString(),
           style: TextStyle(color: Colors.black),
         ),
       ),
     )
   ],),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'validity : '.toUpperCase().toUpperCase() +
                    widget.day.toString() +
                    ' Days',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lowest price since lanch',
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.offer+'% off',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    get(int.parse(widget.price.toString()),
                        int.parse(widget.offer.toString())).toString(),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        color: Colors.black,
                      ),
                      Text(
                       widget.price.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    tr = 2;
                  });
                  // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  //   return PurchasedVerified(
                  //     validity: widget.day,
                  //     img: widget.img,
                  //     name: widget.name,
                  //   );
                  // }));
                  (login_value == 1)
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) {
                          return  CrediCardClass(
                            workout: widget.workout,
img: widget.img,
                                 phone:widget.phone,
                                user_name: widget.user_name,
                                user_id: widget.id,
                                  pack_id: widget.pack_id,
                                   email: widget.email,
                            price: widget.price,
                            name: widget.name,
                            day: widget.day,

                          );
                        }))
                      : showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (ctx) {
                                        return LoginPage();
                                      }));
                                    },
                                    child: Text(
                                      'Go To Loginpage!'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Close'.toUpperCase(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                                insetPadding: EdgeInsets.only(
                                    bottom: 200, right: 50, left: 50, top: 200),
                                title: Center(
                                    child: Text(
                                  'Plz Login First',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                                backgroundColor: Colors.white,
                                content: Text(
                                  'You can only access the features after login your application',
                                  style: TextStyle(color: Colors.black),
                                ));
                          });
                },
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text('BUY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  double get(price,offer){
   var cost=price+(offer/100)*price;
   print(price);
   print(offer);
   print(cost);
    return cost;

  }
}
