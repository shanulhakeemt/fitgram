import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/common/store_product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/eqiuppments.dart';
import '../data/var.dart';
import '../widgets/mytest.dart';

class Store0 extends StatefulWidget {
  const Store0({Key? key}) : super(key: key);
  @override
  State<Store0> createState() => _Store0State();
}

class _Store0State extends State<Store0> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage(('assets/images/q0.jpg')),
                        fit: BoxFit.cover)),


              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Equippments',
                    ),
                    Tab(
                      text: 'Accesseries',
                    ),
                    Tab(
                      text: 'Protiens',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                        height: 400,
                        child:StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("store")
                              .where('status', isEqualTo: 1)
                              .snapshots(),
                          builder: (_, snapshot) {
                            var store = snapshot.data;

                            if (snapshot.hasData &&
                                snapshot.data!.docs.length == 0) {
                              return Center(
                                child: StyledText(
                                  text: "No Users Found",
                                ),
                              );
                            }
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  itemCount: store!.docs.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    print(store.docs[index]['title'].toString());
                                    return Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10,top: 5),
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              st = index;
                                            });

                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (ctx) {
                                                  return StoreProduct();
                                                }));
                                          },
                                          child: Container(
                                            child: SingleChildScrollView(child: Column(
                                              children:[
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child:  Image.network(store.docs[index]['imgurl'].toString(),height: 150,)
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(Eqps[1]['name']),
                                                      SizedBox(
                                                        width: 9,
                                                      ),
                                                      Icon(
                                                        Icons.currency_rupee,
                                                        size: 14,
                                                      ),
                                                      Text(
                                                        '1001',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.green),
                                                      )
                                                    ],
                                                  ),
                                                  width: 120,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                ),
                                              ],
                                            ),),
                                          )),
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
                        )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          e = 1;
                        });
                      },
                      child: Container(
                          height: 400,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("store")
                                .where('status', isEqualTo: 1)
                                .snapshots(),
                            builder: (_, snapshot) {
                              var store = snapshot.data;

                              if (snapshot.hasData &&
                                  snapshot.data!.docs.length == 0) {
                                return Center(
                                  child: StyledText(
                                    text: "No Users Found",
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    itemCount: store!.docs.length,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 15,
                                    ),
                                    itemBuilder: (context, index) {
                                      print(store.docs[index]['title'].toString());
                                      return Padding(
                                        padding: EdgeInsets.only(left: 10, right: 10,top: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                st = index;
                                              });

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (ctx) {
                                                    return StoreProduct();
                                                  }));
                                            },
                                            child: Container(
                                              child: SingleChildScrollView(child: Column(
                                                children:[
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      child:  Image.network(store.docs[index]['imgurl'].toString(),height: 150,)
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(Eqps[1]['name']),
                                                        SizedBox(
                                                          width: 9,
                                                        ),
                                                        Icon(
                                                          Icons.currency_rupee,
                                                          size: 14,
                                                        ),
                                                        Text(
                                                          '1001',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.green),
                                                        )
                                                      ],
                                                    ),
                                                    width: 120,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blueGrey,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                  ),
                                                ],
                                              ),),
                                            )),
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
                    ),
                    Container(
                        height: 400,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("store")
                              .where('status', isEqualTo: 1)
                              .snapshots(),
                          builder: (_, snapshot) {
                            var store = snapshot.data;

                            if (snapshot.hasData &&
                                snapshot.data!.docs.length == 0) {
                              return Center(
                                child: StyledText(
                                  text: "No Users Found",
                                ),
                              );
                            }
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  itemCount: store!.docs.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    print(store.docs[index]['title'].toString());
                                    return Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10,top: 5),
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              st = index;
                                            });

                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (ctx) {
                                                  return StoreProduct();
                                                }));
                                          },
                                          child: Container(
                                            child: SingleChildScrollView(child: Column(
                                              children:[
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child:  Image.network(store.docs[index]['imgurl'].toString(),height: 150,)
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(Eqps[1]['name']),
                                                      SizedBox(
                                                        width: 9,
                                                      ),
                                                      Icon(
                                                        Icons.currency_rupee,
                                                        size: 14,
                                                      ),
                                                      Text(
                                                        '1001',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.green),
                                                      )
                                                    ],
                                                  ),
                                                  width: 120,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                ),
                                              ],
                                            ),),
                                          )),
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
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

void pass(int x) {}
