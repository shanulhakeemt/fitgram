
import 'package:fitgram/screens/user/user_home.dart';
import 'package:fitgram/screens/user/workout_schedule.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/var.dart';

class PurchasedVerified extends StatefulWidget {
  PurchasedVerified({this.validity, this.name, this.workout,this.img,this.user_name,this.pack_id,this.user_id,this.price,this.email,this.phone});
  var validity;
  var img;
  var name;
  var phone;
  var workout;
  var user_id;
  var user_name;
  var pack_id;
  var price;
  var email;

  @override
  State<PurchasedVerified> createState() => _PurchasedVerifiedState();

}

class _PurchasedVerifiedState extends State<PurchasedVerified> {
  @override
  Widget build(BuildContext context) {
    print(widget.workout);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: Lottie.asset('assets/animations/p1.json',
                  repeat: true, reverse: true, fit: BoxFit.cover),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 47, right: 47),
              child: Text(
                'you are purchased '.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 47, right: 47),
              child: Text(
                widget.name.toString().toUpperCase() + ' package'.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                //   return (widget.from!=1)?DailyWorkouts(
                //     validity: widget.validity,
                //     img: widget.img,
                //     name: widget.name,
                //   ):UserHome();
                // }));
                        Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                      return (tr==2)?DailyWorkouts(
workout: widget.workout,
                      day: widget.validity,
                             img: widget.img,
                             name: widget.name,
                      ):UserHome();
                    }));
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
                  child: Text('Got it',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20)),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
