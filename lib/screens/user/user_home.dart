
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/common/bmi/bmi0.dart';
import 'package:fitgram/constants/constants.dart';
import 'package:fitgram/data/packages.dart';
import 'package:fitgram/screens/user/packages.dart';
import 'package:fitgram/screens/user/traineeList.dart';
import 'package:fitgram/screens/user/traner_profile.dart';
import 'package:fitgram/screens/user/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/loginpage.dart';
import '../../common/store.dart';
import '../../data/trainers.dart';
import '../../data/var.dart';
import '../../widgets/mytest.dart';
import '../home/home0.dart';

class UserHome extends StatefulWidget {
  String? name;
  String? email;

  String? phone;
  String? uid;
  UserHome({Key? key, this.phone, this.uid, this.name, this.email})
      : super(key: key);



  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _s = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: _s,
            onTap: (inx) {
              setState(() {
                _s = inx;
              });
              if (inx == 0) {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return LoginPage();
                }));
              }
              if (inx == 1) {
                (login_value==1) ?Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return UserProfile(
                    img: 'face.jpg',
                    name: widget.name,
                    email: widget.email,
                    phone: widget.phone,

                  );
                })):showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                          actions: [
                            InkWell(onTap: (){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return LoginPage(

                                );
                              }));

                            },child:   Text(
                              'Go To Loginpage!'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),),
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
                                'Plz think,You are a guest',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),

                          backgroundColor: Colors.white,
                          content: Text('So you can only visit your profile  after login your application',style: TextStyle(color: Colors.black),)
                      );
                    });






              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  label: 'Settings'),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 30),
                      child: Text(
                        (login_value == 1)
                            ? 'Welcome ${widget.name} ' + use
                            : 'Fitness its a Way of Life',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: (login_value == 1)
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/images/face.jpg'),
                            )
                          : null,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Store0();
                      }));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                'SHOP NOW',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              SizedBox(
                                width: 189,
                              ),
                              Text(
                                'Best offers on\nall Fitness\nEqiuppments',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ],
                      ),
                      width: 325,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(('assets/images/fi1.jpg')),
                              fit: BoxFit.cover)),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Our Trainers",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return TraineeList();
                        }));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
              Container(
                height: 135,

                child:   StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where('usertype', isEqualTo: 'trainer')
                    .snapshots(),
                builder: (_, snapshot) {
                  var users = snapshot.data;

                  if (snapshot.hasData &&
                      snapshot.data!.docs.length == 0) {
                    return Center(
                      child: StyledText(
                        text: "No Users Found",
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: users!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(

                            height: 200,
                            width: 350,
                            //  color: Colors.red,

                            child: Stack(children: [
                              Positioned(
                                bottom: 10,
                                right: 0,
                                left: 35,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      t = index;
                                    });
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (ctx) {
                                          return TrainerProf(
                                            name: users.docs[index]['name']
                                                .toString(),
                                            age: users.docs[index]['age']
                                                .toString(),
                                            exp: users.docs[index]
                                            ['experience'],
                                          );
                                        }));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(left: 20,top: 15),
                                      height: 110,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors: [

                                            Colors
                                                .tealAccent.shade700,

                                            Colors.white
                                          ],
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              users.docs[index]['name']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Age : " +
                                                  users.docs[index]['age']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Experience : " +
                                                  users.docs[index]
                                                  ['experience']
                                                      .toString() +
                                                  ' Yrs',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              trainers[index]['Cost']
                                                  .toString() +
                                                  " Rs",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Positioned(
                                  top: 1,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        t = index;
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) {
                                                return TrainerProf();
                                              }));
                                    },
                                    child: Container(
                                        child: Image.asset(
                                            'assets/images/' +
                                                trainers[index]['imgurl']
                                                    .toString()),
                                        height: 130,
                                        width: 190,
                                        decoration: const BoxDecoration(

                                          //color: Colors.purple,
                                        )),
                                  )),
                            ]),
                          );
                        });
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: StyledText(
                        text: "Something Went Wrong",
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),),
                Stack(children: [
                  Container(
                    width: 325,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1.0,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            kinactive_container_color,
                            kactive_container_color
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: (x == 0) ? Colors.blue : Colors.green),
                  ),
                  Positioned(
                    top: 25,
                    left: 26,
                    child: Row(
                      children: [
                        Text(
                          "NOTHING WILL WORK \nUNLESS YOU DO",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Stack(children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(9),
                                  color: kinactive_container_color),
                            ),
                          ),
                          Positioned(
                            top: 6,
                            left: 9,
                            child: Text(
                              (x == 1) ? "Join Now" : "Shop Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ])
                      ],
                    ),
                  )
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Our Packages",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return TraineeList();
                        }));
                      },
                      child: InkWell(
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return PackageScreen(
                               user_name:widget.name,
                                id:widget.uid,
                                email:widget.email,
                                phone:widget.phone

                              );
                            }));
                          }),
                    ),
                  ],
                ),
                Container(
                  height: 130,
                  width: 387,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: packages.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 100,
                            width: 387,
                            child: Stack(children: [
                              Positioned(
                                top: 10,
                                right: 30,
                                left: 30,
                                child: InkWell(
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20),
                                      height: 100,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            kactive_container_color,
                                            Colors.black45
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                packages[index]['type']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            packages[index]['name'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                packages[index]['Cost']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 29,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              Positioned(
                                  right: 30,
                                  child: InkWell(
                                    child: Container(
                                        child: Image.asset(
                                          'assets/images/' +
                                              trainers[index]['imgurl']
                                                  .toString(),
                                          scale: 7,
                                        ),
                                        decoration: const BoxDecoration(

                                            //color: Colors.purple,
                                            )),
                                  ))
                            ]));
                      }),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return BM();
                        }));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kbottom_container_color,
                        ),
                        child: Center(
                          child: Text(
                            'CALCULATE YOUR BMI',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
          ),
        ));
  }
}
