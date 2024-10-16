
import 'package:fitgram/common/loginpage.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
   load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return

       Scaffold(
         backgroundColor: Colors.white,
            body: SafeArea(child:Container(
              height:double.infinity ,
              width:double.infinity ,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                Image.asset('assets/images/log.png',scale: 1,),
              ],),

            ),),

      );
  }
  Future<void> load()async{
    Future. delayed(Duration(seconds: 5), (){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return LoginPage();})); });

}
}
