import 'package:flutter/material.dart';

import '../data/student_details.dart';
import '../data/trainers.dart';
class TrainerProfile extends StatelessWidget {
  String? name;
  String? email;

  String? phone;
  String? uid;
  String?exp;
  String?age;
  String?img;
  TrainerProfile({Key? key, this.phone, this.uid, this.name, this.email,this.age,this.exp,this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width:double.infinity,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My students'),
        ),
        drawer: Drawer(
          child: Column(
            children:[
              SizedBox(height: 40,),
              CircleAvatar(

              radius:50,
              backgroundColor: Colors.tealAccent.shade200,
            ),
              SizedBox(height:20 ,),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  Text('Name           :'),
                ],
              ),
              SizedBox(height:20 ,),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  Text('Age               :'),
                ],
              ),
              SizedBox(height:20 ,),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  Text('Phone No     :'),
                ],
              ),
              SizedBox(height:20 ,),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  Text('Specialised  : '),
                ],
              ),
              SizedBox(height:20 ,),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  Text('Experience   : '),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children:[ Container(
                  height:90 ,
                  width:250 ,
                  decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 1),
                      ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.tealAccent
                  ),
                ),
                  Positioned(
                    top: 15,
                 left: 19,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total Fees      :'

                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text(
                                'Pending Fees :'
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]

              )
            ]
          )
        ),
        body: SafeArea( child:Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    onChanged: (value) {

                    },
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
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: students.length,
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
                                  onTap: (){

                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(left: 20,top: 20),
                                      height: 140,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors: [Colors.teal.shade200, Colors.white],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              students[index]['name'].toString().toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 2,),
                                            Text(
                                              "AGE : " +
                                                  students[index]['age']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "PACKAGE : " +
                                                  students[index]['pack']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text("Ph : "+
                                              students[index]['ph'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 6,),
                                            Row(
                                              children: [
                                                Stack(
                                                    children:[
                                                      InkWell(
                                                        onTap: (){

                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              boxShadow:  [
                                                                BoxShadow(
                                                                  color: Colors.black,
                                                                  blurRadius: 1.0,
                                                                ),
                                                              ],
                                                              borderRadius: BorderRadius.circular(9),
                                                              color: Colors.teal.shade200
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 6,
                                                        left: 12,
                                                        child: Text("Statistics",style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14,
                                                        ),),
                                                      )

                                                    ]
                                                ),
                                                SizedBox(width: 11,),
                                                Stack(
                                                    children:[
                                                      InkWell(
                                                        onTap: (){

                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 85,
                                                          decoration: BoxDecoration(
                                                              boxShadow:  [
                                                                BoxShadow(
                                                                  color: Colors.black,
                                                                  blurRadius: 1.0,
                                                                ),
                                                              ],
                                                              borderRadius: BorderRadius.circular(9),
                                                              color: Colors.teal.shade200
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 6,
                                                        left: 12,
                                                        child: Text("Give Tasks",style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14,
                                                        ),),
                                                      )

                                                    ]
                                                ),
                                                SizedBox(width: 11,),
                                                Stack(
                                                    children:[
                                                      InkWell(
                                                        onTap: (){

                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 130,
                                                          decoration: BoxDecoration(
                                                              boxShadow:  [
                                                                BoxShadow(
                                                                  color: Colors.black,
                                                                  blurRadius: 1.0,
                                                                ),
                                                              ],
                                                              borderRadius: BorderRadius.circular(9),
                                                              color: Colors.teal.shade200
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 6,
                                                        left: 12,
                                                        child: Text("Change Diet Plan",style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14,
                                                        ),),
                                                      )

                                                    ]
                                                ),
                                              ],
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
                                    onTap: (){
                                    },
                                    child:CircleAvatar(
                                      radius: 50,
                                    )
                                  ))
                            ]));
                      }),
                )
              ],
            ),
          ),
        ),


        ),
      ),
    );
  }
}
