
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/var.dart';
import '../screens/user/user_home.dart';

class LoginTrainer extends StatefulWidget {
  const LoginTrainer({Key? key}) : super(key: key);

  @override
  State<LoginTrainer> createState() => _LoginTrainerState();
}

class _LoginTrainerState extends State<LoginTrainer> {
  @override
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool? clicked = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(('assets/images/reg1.jpg')),
                  fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 250,),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 100),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a valid email address";
                              }
                            },
                            controller: usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(100)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(100)),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty && value.length < 8) {
                                  return "Enter a valid password";
                                }
                              },
                              controller: passwordController,
                              obscureText: clicked!,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        if (clicked == false) {
                                          setState(() {
                                            clicked = true;
                                          });
                                        } else {
                                          setState(() {
                                            clicked = false;
                                          });
                                        }
                                      },
                                      child: clicked == false
                                          ? Icon(
                                              Icons.visibility,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: Colors.white,
                                            )),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(100)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(100)),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: usernameController.text.trim(),
                                      password: passwordController.text.trim())
                                  .then((value) {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(value.user!.uid)
                                    .get()
                                    .then((value) {
                                  if (value.data()!['usertype'] == "trainer") {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            UserHome()),
                                        (route) => false);
                                  } else if (value.data()!['usertype'] ==
                                      "trainer") {
                                    //
                                  }
                                });
                              });
                            }
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(width: 40,)
                                ,
                                Text('Sign In',style: TextStyle(
                                  fontSize: 30,fontWeight: FontWeight.bold
                                ),),
                              SizedBox(width: 10,),
                                Icon(Icons.arrow_forward,size: 32,)
                              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
  //
  btnlogic() {
    print("czcz");
  }
}
