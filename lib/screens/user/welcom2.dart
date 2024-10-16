
import 'package:fitgram/common/bmi/bmi0.dart';
import 'package:fitgram/screens/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomBMI extends StatefulWidget {
 WelcomBMI({this.phone,this.name});
 String?phone;
 String?name;

  @override
  State<WelcomBMI> createState() => _WelcomBMIState();
}

class _WelcomBMIState extends State<WelcomBMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
            ),
            Stack(
              children: [
                Container(

                  height: 380,
                  width: double.infinity,
                ),
                Positioned(
                    child: Container(
                  child: Lottie.asset('assets/animations/guy.json',
                      repeat: true, reverse: true, fit: BoxFit.cover),
                )),
                Positioned(
                    right: 0,
                    child: Container(
                        height: 180,
                        width: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(('assets/images/_con.png')),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hey ,'+widget.name.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'Whats your BMI ?',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )))
              ],
            ),
            SizedBox(height: 10,),
           InkWell(
             onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return BM();

                }));
             },
             child:  Container(
               height: 60,
               width: 300,
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

                 child: Text(
                     'calculate your bmi'.toUpperCase(),
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.blue,
                         fontSize: 20)

                 ),
               ),

             ),
           ), SizedBox(height: 100,),

        InkWell(onTap: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (ctx) {
                return UserHome(
                  name: widget.name,
                  phone: widget.phone,
                );
              }));
        },
        child:     Container(
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
        ),)
          ],
        ),
      ),
    );
  }
}
