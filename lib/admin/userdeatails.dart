import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';



class UserDetails extends StatefulWidget {

  String? id;

  UserDetails({Key? key,this.id}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {


  Future<Map<dynamic, dynamic>> getSingleuser(String id) async {
    DocumentSnapshot value = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get();
    final data = value.data() as Map<String, dynamic>;
    return data;
  }

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: StyledText(text: "User Details",color: Colors.white,),
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
          future: getSingleuser(widget.id.toString()),
          builder: (_,snapshot){
            final _user = snapshot.data as Map;
            print(_user);


            if(snapshot.hasError){

              return Center(
                child: StyledText(text: "Something Went Wrong",),
              );
            }

            if(snapshot.hasData){


              return Center(child: Container(
                height: 100,
                child:  Column(
                children: [

                  StyledText(text:_user['name'].toString().toUpperCase(),style:TextStyle(
                    fontWeight: FontWeight.bold
                        ,
                    fontSize:20
                  ),color: Colors.black,),
                  SizedBox(height: 4,),
                  StyledText(text:_user['email'],color: Colors.black,),


                ],
              ),),);
            }



            return Center(
              child: CircularProgressIndicator(),
            );

          },
        ),
      ),
    );
  }
}
