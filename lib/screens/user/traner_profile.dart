import 'package:fitgram/common/loginpage.dart';
import 'package:flutter/material.dart.';

import '../../common/purchased_verification.dart';
import '../../data/trainers.dart';
import '../../data/var.dart';
import 'credit_trainer.dart';

class TrainerProf extends StatefulWidget {
  TrainerProf({this.name, this.exp, this.age});
  var spe="ARM";
  var cost=400;
 var name;
 var age;
 var exp;
var profile =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  @override
  State<TrainerProf> createState() => _TrainerProfState();
}

class _TrainerProfState extends State<TrainerProf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 90,
                child: Image.asset(
                    'assets/images/' + trainers[t]['imgurl'].toString()),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(Icons.star);
                  })),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.name.toString().toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Speciality : "+widget.spe.toString()),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Age : " + widget.age.toString())
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Experience : " + widget.exp.toString()),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Price : " + widget.cost.toString())
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(profile),
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    tr=1;
                  });
                  (login_value == 1)
                      ? Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                            print(widget.name);
                          return CrediTrainerClass(
                            tra_name: widget.name,
                            age:widget.age,
                            spe:widget.spe,
                           cost:widget.cost,
                          );
                        }))
                      : showDialog(
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
                                'Plz Login First',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),

                              backgroundColor: Colors.white,
                              content: Text('You can only access the features after login your application',style: TextStyle(color: Colors.black),)
                            );
                          });
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Hire Me',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
