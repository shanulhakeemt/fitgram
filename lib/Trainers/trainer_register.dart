import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class RegisterTrainer extends StatefulWidget {
  const RegisterTrainer({Key? key}) : super(key: key);

  @override
  State<RegisterTrainer> createState() => _RegisterTrainerState();

}

class _RegisterTrainerState extends State<RegisterTrainer> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController expController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  final ImagePicker _picker = ImagePicker(); // For pick Image
  XFile? _image; // For accept Null:-?

  var imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(('assets/images/reg1.jpg')),
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
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                         Center(
                           child:  CircleAvatar(

                             backgroundColor: Colors.white70,
                             radius: 50,
                             child:  GestureDetector(
                               onTap: () {
                                 setState(() {
                                   showimage();
                                 });
                               },
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 color: Colors.transparent,
                                 child: _image != null
                                     ? ClipRRect(
                                     child: Image.file(
                                       File(_image!.path),
                                       fit: BoxFit.cover,
                                     ))
                                     : Container(
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.center,
                                     children: [
                                       // CircleAvatar(
                                       //   radius: 45.0,
                                       //   backgroundImage: NetworkImage(widget.imgurl),
                                       //   backgroundColor: Colors.transparent,
                                       // ),

                                       Icon(
                                         Icons.image,
                                         size: 20,
                                         color: Colors.black,
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ), SizedBox(
                            width: 5,
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 20,top: 20),
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your name";
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person,color: Colors.white,),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(100)),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                            ),
                          ))

                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(
                              right: 20, top: 20),
                            child: Padding(padding: EdgeInsets.only(top: 7),child: TextFormField(
                              controller: ageController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your age";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.numbers,color: Colors.white,),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: "Age",
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(100)),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                            ),),
                          )),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only( right: 20,top: 30),
                            child: TextFormField(
                              controller: expController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your experience";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.numbers,color: Colors.white,),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: "Experience",
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(100)),
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                            ),
                          ))

                        ],
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
                                  borderSide: BorderSide(
                                      color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(
                                      color: Colors.white))),
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
                                  borderSide: BorderSide(
                                      color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(
                                      color: Colors.white))),
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
                                  borderSide: BorderSide(
                                      color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(
                                      color: Colors.white))),
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
                                  borderSide: BorderSide(
                                      color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  borderSide: BorderSide(
                                      color: Colors.white))),
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
                          Text(
                            'Upload',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password: passController.text.trim())
                                          .then((value) {

                                        var uid=value.user!.uid;
                                        var email=value.user!.email;

                                        String fileName = DateTime.now().toString();
                                        var ref = FirebaseStorage.instance
                                            .ref()
                                            .child("trainers/$fileName");
                                        UploadTask uploadTask =
                                        ref.putFile(File(_image!.path));

                                        uploadTask.then((res) async {
                                          imageurl = (await ref.getDownloadURL()).toString();
                                        }).then((value) {


                                          FirebaseFirestore.instance.collection('users').doc(uid).set({
                                            'uid': uid,
                                            'name': nameController.text,
                                            'experience':expController.text,
                                            'age':ageController.text,
                                            'phone':phoneController.text,
                                            'email': email,
                                            'imgurl':imageurl,
                                            'password': passController.text,
                                            'status': 0,
                                            'usertype': "trainer",
                                            'createdat': DateTime.now(),
                                          }).then((value) =>
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(content: Text("Success"))));
                                        });





                                      });
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

  }


  _imagefromgallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _imagefromcamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
    });
  }

  showimage() {
    showModalBottomSheet(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.pink,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _imagefromcamera();
                          },
                          icon: Icon(Icons.camera_alt_rounded,
                              color: Colors.white),
                          iconSize: 20,
                          splashRadius: 40,
                        ),
                      ),
                      Text("Camera"),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.purple,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _imagefromgallery();
                          },
                          icon: Icon(Icons.photo),
                          color: Colors.white,
                          iconSize: 20,
                          splashRadius: 40,
                        ),
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
