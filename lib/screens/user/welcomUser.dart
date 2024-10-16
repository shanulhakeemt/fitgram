
import 'package:fitgram/screens/user/welcom2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeUser extends StatefulWidget {
  WelcomeUser({this.name,this.phone});
  final String? name;
  final String? phone;

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'Hello '+widget.name!,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: Lottie.asset('assets/animations/w1.json',
                  repeat: true, reverse: true, fit: BoxFit.cover),
            ),
            SizedBox(
              height: 160,
            ),
          Padding(padding: EdgeInsets.only(left: 80,right: 80),child:   Text(
            'welcome to our'.toUpperCase(),
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),),
            Text(
              'fitness world'.toUpperCase(),
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                      return WelcomBMI(
                        name: widget.name,
                        phone: widget.phone,
                      );
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
                    child: Text('Lets Go',
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
    );
  }
}
