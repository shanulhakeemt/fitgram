
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  String? name;
  String? email;

  String? phone;
  String?img;
  UserProfile(
      {Key? key,
        this.phone,
        this.name,
        this.email,
        this.img})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.red.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/'+widget.img.toString()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    child: Column(
                      children: [
                        StyledText(
                          text: widget.name.toString(),
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                        StyledText(
                          text: widget.email.toString(),
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment(0.0, 0.0),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      height: 100,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledText(
                            text: "Phone :",
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          StyledText(
                            text:
                                widget.phone.toString(),

                            fontSize: 22,
                          )
                        ],
                      )),
                )),
            Align(
                alignment: Alignment(-0.7, 0.3),
                child:Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),

                      Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StyledText(
                                text: "Current Trainer     :",
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StyledText(
                                text: 'Not Purchased',
                                fontSize: 18,
                              )
                            ],
                          )),
                      SizedBox(height: 10,),
                      Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StyledText(
                                text: "Current Package  :",
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StyledText(
                                text:'Not Purchased' ,
                                fontSize: 18,
                              )
                            ],
                          )),

                    ],
                  ),
                )
            ),


          ],
        ),
      ),
    );
  }
}
