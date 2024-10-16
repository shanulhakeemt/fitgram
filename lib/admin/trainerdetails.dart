
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/widgets/mycontainer.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';

class TrainerDetails extends StatefulWidget {
  String? name;
  String? email;
  int?status;

  String? phone;

  String? uid;
  String? exp;
  String? age;
  String? img;
  TrainerDetails(
      {Key? key,
      this.phone,
      this.uid,
      this.name,
      this.email,
      this.age,
        this.status,
      this.exp,
      this.img})
      : super(key: key);

  @override
  State<TrainerDetails> createState() => _TrainerDetailsState();
}

class _TrainerDetailsState extends State<TrainerDetails> {
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
                    backgroundImage: NetworkImage(widget.img.toString()),
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
                            text: "Experience:",
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          StyledText(
                            text: "${
                                widget.exp.toString()
                            } Yrs",
                            fontSize: 22,
                          )
                        ],
                      )),
                )),
            Align(
              alignment: Alignment(-0.5, 0.3),
              child:Container(
                height: 180,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    StyledText(
                      text: "Contact Info",
                      fontSize: 22,
                    ),
                    SizedBox(height: 20,),

                    Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StyledText(
                              text: "Email:",
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            StyledText(
                              text: widget.email.toString(),
                              fontSize: 22,
                            )
                          ],
                        )),
                    Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StyledText(
                              text: "Phone:",
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            StyledText(
                              text: widget.phone.toString(),
                              fontSize: 22,
                            )
                          ],
                        )),

                  ],
                ),
              )
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: StyledContainer(

                    borderRadius: BorderRadius.circular(15),
                    width: 250,
                    height: 45,
                    color: widget.status==1?Colors.green:Colors.red,
                    onTap: () {

                      widget.status==1?

                      FirebaseFirestore.instance.collection('users').doc(widget.uid).update({

                        'status':0

                      }):

                      FirebaseFirestore.instance.collection('users').doc(widget.uid).update({

                        'status':1

                      });

                    },
                    child: StyledText(
                      color: Colors.white,
                      text: widget.status==0?"Approve":"Already Aproved",
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
