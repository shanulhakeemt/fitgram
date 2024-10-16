import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/data/var.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/eqiuppments.dart';

class StoreProduct extends StatefulWidget {
  String? from;
  String? id;
  StoreProduct({Key? key, this.from, this.id}) : super(key: key);

  @override
  State<StoreProduct> createState() => _StoreProductState();
}

class _StoreProductState extends State<StoreProduct> {
  Future<Map<dynamic, dynamic>> getSingleuser(String id) async {
    DocumentSnapshot value =
        await FirebaseFirestore.instance.collection('store').doc(id).get();
    final data = value.data() as Map<String, dynamic>;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0E0E21),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 30,
            ),
            Icon(Icons.sell),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
            child: Container(
          child: FutureBuilder(
            future: getSingleuser(widget.id.toString()),
            builder: (_, snapshot) {
              final _product = snapshot.data as Map;


              if (snapshot.hasData) {
                getofferprice(double.parse(_product['price'].toString()),
                    double.parse(_product['offer'].toString()));
                return Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 550,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              (_product['imgurl'].toString())),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    fav++;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: (fav % 2 == 0)
                                                      ? Colors.grey
                                                      : Colors.red,
                                                  size: 50,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 250,
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.end,
                                          //   children: [
                                          //
                                          //     Container(
                                          //       height: 30,
                                          //       width: 100,
                                          //       decoration: BoxDecoration(
                                          //           gradient: LinearGradient(colors: [
                                          //             Colors.white70,
                                          //             Colors.white
                                          //           ]),
                                          //           color: Colors.white,
                                          //           boxShadow: const [
                                          //             BoxShadow(
                                          //               color: Colors.blue,
                                          //               blurRadius: 0.4,
                                          //             ),
                                          //           ],
                                          //           borderRadius:
                                          //           BorderRadius.circular(12)),
                                          //       child: Center(
                                          //         child: Text(
                                          //           'Details',
                                          //           style: TextStyle(
                                          //               fontSize: 17,
                                          //               fontWeight: FontWeight.bold,
                                          //               color: Colors.black),
                                          //         ),
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                        ],
                                      )),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10,top: 20),
                                          child: Text(
                                            _product['title'],
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            _product['description'],
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10,top: 20),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children:
                                                  List.generate(5, (index) {
                                                return Icon(Icons.star);
                                              }))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 17, top: 10),
                                          child: Text(
                                            'Lowest price since lanch',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 17, top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${_product['offer']}% off',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 17,
                                              ),
                                              Text(
                                                (mrp.toString()),
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 17,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.currency_rupee),
                                                  Text(
                                                    _product['price'],
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                              ),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  widget.from != "admin"
                      ? Container(
                          height: 90,
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Center(
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 22),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEB1555),
                                ),
                              )),
                            ],
                          ),
                        )
                      : Container(
                          height: 90,
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                child: Center(
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 22),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEB1555),
                                ),
                              )),
                            ],
                          ),
                        )
                ]);
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )),
      ),
    );
  }

  getofferprice(double price, double offer) {
    _offeramt = (price * offer) / 100;

    print(_offeramt);

    mrp = _offeramt + price;
  }

  var _offeramt;
  var mrp;
}
