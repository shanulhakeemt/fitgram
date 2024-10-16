
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgram/data/var.dart';
import 'package:fitgram/screens/user/welcomUser.dart';
import 'package:flutter/material.dart';


class UserReg extends StatefulWidget {
 UserReg({Key? key}) : super(key: key);

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(('assets/images/reg.jpg')),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a valid email address";
                            }
                          },
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.white,),
                              hintText: "Name",
                              fillColor: Colors.transparent,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty || value.length != 10) {
                              return "Enter a valid phone number";
                            }
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone,color: Colors.white,),
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Phone",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a valid email address";
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email,color: Colors.white,),
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.length < 8) {
                              return "Enter a valid password";
                            }
                          },
                          controller: passController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password,color: Colors.white,),
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please confirm the password";
                            }
                          },
                          controller: confirmPassController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password,color: Colors.white,),
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                login_value=1;
                              });
                              if (_formKey.currentState!.validate()) {
                                _firebaseRegistration(context);
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                  onPressed: () {
setState(() {
  login_value=1;
});
                                    if (_formKey.currentState!.validate()) {
                                      _firebaseRegistration(context);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 25,
                                  )))
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }

  _firebaseRegistration(BuildContext context) {
    print("Hello");
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim())
        .then((value) {
      print("am here");

      FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set({
        'uid': value.user!.uid,
        'name': nameController.text,
        'email': value.user!.email,
        'password': passController.text,
        'status': 1,
        'phone': phoneController.text,
        'usertype': "user",
        'createdat': DateTime.now(),
      }).then((value) {
        return

          //Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return WelcomeUser(

          //   name: nameController.text,
          //  phone: phoneController.text,
          //  );}));

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (ctx) {
                return WelcomeUser(
                  name: nameController.text,
                  phone: phoneController.text,
                );
              }));
      });
    });
  }










}
