
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/admin/trainerdetails.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';


class ViewAllTrainers extends StatefulWidget {
  const ViewAllTrainers({Key? key}) : super(key: key);

  @override
  State<ViewAllTrainers> createState() => _ViewAllTrainersState();

}

class _ViewAllTrainersState extends State<ViewAllTrainers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText(text: "All Users",color: Colors.white,),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(
              children: [

                StyledText(text: "All Users"),

                Container(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(

                    stream: FirebaseFirestore.instance.collection("users").where('usertype',isEqualTo: 'trainer').snapshots(),

                    builder: (_,snapshot){

                      var users=snapshot.data;

                      if(snapshot.hasData && snapshot.data!.docs.length==0){

                        return  Center(
                          child: StyledText(text: "No Users Found",),
                        );
                      }

                      if(snapshot.hasData){
                        return ListView.builder(

                            itemCount: users!.docs.length,
                            itemBuilder: (_,index){

                              return Card(
                                color: Colors.white,
                                child: ListTile(
                                  onTap: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainerDetails(

                                      uid: users.docs[index]['uid'],
                                      status: users.docs[index]['status'],
                                      name: users.docs[index]['name'],
                                     email  : users.docs[index]['email'],
                                      img: users.docs[index]['imgurl'],
                                     phone: users.docs[index]['phone'],
                                      exp: users.docs[index]['experience'],
                                      age: users.docs[index]['age'],

                                    )));
                                  },
                                  leading: CircleAvatar(
                                    child: StyledText(text: (index+1).toString(),color: Colors.white,),
                                  ),
                                  title: StyledText(text: users.docs[index]['name'],color: Colors.black,),
                                  subtitle: StyledText(text: users.docs[index]['email'],color: Colors.black,),
                                ),
                              );
                            });

                      }

                      if(snapshot.hasError){

                        return Center(
                          child: StyledText(text: "Something Went Wrong",),
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
