import 'package:flutter/material.dart';

import '../../common/loginpage.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.redAccent,
        actions: [IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            return LoginPage();
          }));
        }, icon: Icon(Icons.login))],),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
        child: Center(
          child: ListView(children: [SizedBox(height: 30,),
              ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/q0.jpg',scale: 6,)),
              SizedBox(height: 30,),
              ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/q1.jpg',scale: 6,)),SizedBox(height: 30,),
              ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/q2.jpg',scale: 6,)),
          ],),
        ),
      ),
          )
      )
    );
  }
}
