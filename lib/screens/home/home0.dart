
import 'package:fitgram/common/loginpage.dart';
import 'package:fitgram/screens/home/home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Store();
                      }));
                    },
                    child: Center(
                      child: Container(
                        height: 250,
                        width: 350,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 100),
                                  child: Text('Store',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white
                                  ),),
                                ),
                                height: 200,
                                width: 325,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.redAccent,Colors.white12,]),
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              right: 1,
                              child:Image.asset(
                                'assets/images/ff0.png',scale:2,
                              )
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 60,),
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return LoginPage();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/f1.jpg',
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
