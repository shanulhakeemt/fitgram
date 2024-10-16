
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgram/Trainers/trainer_first_page.dart';
import 'package:fitgram/Trainers/trainers_login.dart';
import 'package:fitgram/admin/adminhome.dart';
import 'package:fitgram/constants/images.dart';
import 'package:fitgram/screens/user/user_register.dart';
import 'package:fitgram/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../Trainers/trainer_register.dart';
import '../constants/colors.dart';
import '../data/var.dart';
import '../screens/user/user_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: Container(
color: Colors.white,
        child: Container(

            padding: EdgeInsets.only(bottom: 30),
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Form(
                    key: _formKey,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 110),
                                child: Image.asset(
                                  'assets/images/${lo}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 60),
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
                                      fillColor: Colors.transparent,
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(100)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(100)),
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 8) {
                                        return "Enter a valid password";
                                      }
                                    },
                                    controller: passwordController,
                                    obscureText: clicked!,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Colors.black,
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
                                                    color: Colors.black,
                                                  )
                                                : Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.white,
                                                  )),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(100)),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(100)),
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  )),
                              SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (usernameController.text ==
                                            "admin@gmail.com" &&
                                        passwordController.text.trim() ==
                                            "12345678") {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminHomePage()),
                                          (route) => false);
                                    } else {
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: usernameController.text
                                                  .trim(),
                                              password: passwordController.text
                                                  .trim())
                                          .then((value) {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(value.user!.uid)
                                            .get()
                                            .then((value) {
                                          if (value.data()!['usertype'] ==
                                              "user") {
                                            setState(() {
                                              login_value = 1;
                                            });
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserHome(
                                                          uid: value
                                                              .data()!['uid'],
                                                          email: value
                                                              .data()!['email'],
                                                          name: value
                                                              .data()!['name'],
                                                          phone: value
                                                              .data()!['phone'],
                                                        )),
                                                (route) => false);
                                          } else if (value
                                                      .data()!['usertype'] ==
                                                  "trainer" &&
                                              value.data()!['status'] == 1) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TrainerProfile(
                                                          uid: value
                                                              .data()!['uid'],
                                                          email: value
                                                              .data()!['email'],
                                                          name: value
                                                              .data()!['name'],
                                                          phone: value
                                                              .data()!['phone'],
                                                          age: value
                                                              .data()!['age'],
                                                          exp: value.data()![
                                                              'experience'],
                                                          img: value.data()![
                                                              'imgurl'],
                                                        )),
                                                (route) => false);

                                            //
                                          }
                                        });
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 140,
                              ),
                              AppText(
                                'Not a member',
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UserReg()));
                                  },
                                  child: AppText(
                                    'Register',
                                    fw: FontWeight.w400,
                                    size: 18,
                                    color: Colors.blue,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginTrainer()));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 50,
                                                child: Lottie.asset(
                                                  'assets/animations/a5.json',
                                                  repeat: true,
                                                  reverse: true,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'LOGIN',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Trainer',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 1.0,
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterTrainer()));
                                        },
                                        child: Container(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 50,
                                                  child: Lottie.asset(
                                                    'assets/animations/p2.json',
                                                    repeat: true,
                                                    reverse: true,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'REGISTER',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Trainer',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1.0,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 1.0,
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            login_value = 0;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserHome()));
                                        },
                                        child: Container(
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 50,
                                                  child: Lottie.asset(
                                                    'assets/animations/w1.json',
                                                    repeat: true,
                                                    reverse: true,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'GUEST',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1.0,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 1.0,
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
  //

  btnlogic() {
    print("czcz");
  }
}
