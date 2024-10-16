
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/common/loginpage.dart';
import 'package:fitgram/screens/user/traner_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../data/trainers.dart';
import '../../data/var.dart';
import '../../widgets/mytest.dart';

class TraineeList extends StatefulWidget {
  const TraineeList({Key? key}) : super(key: key);

  @override
  State<TraineeList> createState() => _TraineeListState();
}

class _TraineeListState extends State<TraineeList> {
  TextEditingController _textEditingController = TextEditingController();
  int _selinx = 0;
  int _sinx = -1;
  int _x = -1;
  void pass(inx) {
    setState(() {
      _x = inx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selinx,
        onTap: (inx) {
          setState(() {
            _selinx = inx;
          });
          if (inx == 0) {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return LoginPage();
            }));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text(
          'Trainers',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    onChanged: (value) {},
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.teal.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                    height: 590,
                    width: 400,
                    child: StreamBuilder<QuerySnapshot>(
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
                              scrollDirection: Axis.vertical,
                              itemCount: users!.docs.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height: 200,
                                  width: 350,
                                  //  color: Colors.red,

                                  child: Stack(children: [
                                    Positioned(
                                      bottom: 10,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            t = index;
                                          });
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (ctx) {
                                                print(       users.docs[index]['name']
                                                    .toString());
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
                                            padding: EdgeInsets.all(30),
                                            height: 120,
                                            width: 350,
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 1.0,
                                                ),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  _sinx == index
                                                      ? Colors
                                                          .tealAccent.shade700
                                                      : Colors.teal.shade200,
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
                                        right: 5,
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
                                              height: 190,
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
