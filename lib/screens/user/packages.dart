import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitgram/screens/user/Details_packages.dart';
import 'package:fitgram/widgets/mycontainer.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../data/packages.dart';
import '../../data/var.dart';

class PackageScreen extends StatefulWidget {
  PackageScreen({this.from, this.phone, this.email, this.user_name, this.id});
  var from;
  var phone;
  var user_name;
  var email;
  var id;
  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offersController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController validityController = TextEditingController();
  TextEditingController salescountController = TextEditingController();

  TextEditingController stockController = TextEditingController();
  final key = GlobalKey<FormState>();
  var uuid = Uuid();
  var packageid;
  String? valueChoose;

  String? selectedValue;

  List<String>? items = ['chest_package', 'arm_package'];
  @override
  void initState() {
    packageid = uuid.v1();
    super.initState();
  }

  final ImagePicker _picker = ImagePicker(); // For pick Image
  XFile? _image; // For accept Null:-?

  var imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        floatingActionButton: (widget.from == 'admin')
            ? FloatingActionButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Add Products'),
                        content: Container(
                          child: Form(
                              key: key,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Name"),
                                    ),
                                    TextFormField(
                                      controller: typeController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Type"),
                                    ),
                                    TextFormField(
                                      controller: priceController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Price"),
                                    ),
                                    TextFormField(
                                      controller: descriptionController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Description"),
                                    ),
                                    TextFormField(
                                      controller: validityController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Validity"),
                                    ),
                                    TextFormField(
                                      controller: offersController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Offer"),
                                    ),
                                    TextFormField(
                                      controller: salescountController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field Mandatory";
                                        }
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Stock"),
                                    ),
                                    DropdownButtonFormField(
                                        value: selectedValue,
                                        items: items!.map((String item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                              child: Text(item));
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as String?;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: GestureDetector(
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
                                                )):
                                          Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // CircleAvatar(
                                                      //   radius: 45.0,
                                                      //   backgroundImage: NetworkImage(widget.imgurl),
                                                      //   backgroundColor: Colors.transparent,
                                                      // ),

                                                      Icon(
                                                        Icons.upload_file,
                                                        size: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Add'),
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  String fileName = DateTime.now().toString();
                                  var ref = FirebaseStorage.instance
                                      .ref()
                                      .child("products/$fileName");
                                  UploadTask uploadTask =
                                      ref.putFile(File(_image!.path));
                                  uploadTask.then((res) async {
                                    imageurl = (await ref.getDownloadURL()).toString();
                                  }).then((value) => FirebaseFirestore.instance
                                          .collection('packages')
                                          .doc(packageid)
                                          .set({
                                        'packageid': packageid,
                                        'name': nameController.text,
                                        'description':
                                            descriptionController.text,
                                        'price': priceController.text,
                                        'offer': offersController.text,
                                        'validity': validityController.text,
                                        'type': typeController.text,
                                        'imgurl': imageurl,
                                        'status': 1,
                                    'daily_workouts':selectedValue,
                                        'salescount': 0,
                                        'rating': [],
                                        'createdat': DateTime.now()
                                      }).then((value) {
                                        setState(() {
                                          clearData();
                                        });
                                        Navigator.pop(context);
                                      }).catchError((e) => print("Error")));
                                }
                              })
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : null,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: (widget.from == 'admin')
              ? Text('Manage Packages')
              : Text('All Packages'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7*4 CHALLANGE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("packages")
                          .where('status', isEqualTo: 1)
                          .snapshots(),
                      builder: (_, snapshot) {
                        var packages = snapshot.data;

                        if (snapshot.hasData &&
                            snapshot.data!.docs.length == 0) {
                          return Center(
                            child: StyledText(
                              text: "No Users Found",
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: packages!.docs.length,
                              itemBuilder: (_, index) {
                                return PackageContainer(
                                  workout:packages.docs[index]['daily_workouts'] ,
                                  user_name: widget.user_name,
                                  phone: widget.phone,
                                  email: widget.email,
                                  pack_id: widget.id,
                                  type: packages.docs[index]['type'],
                                  price: packages.docs[index]['price'],
                                  validity: packages.docs[index]['validity'],
                                  user_id: packages.docs[index]['packageid'],
                                  description: packages.docs[index]
                                      ['description'],
                                  name: packages.docs[index]['name'],
                                  img: packages.docs[index]['imgurl'],
                                  offer: packages.docs[index]['offer'],
                                  rating: packages.docs[index]['rating'],
                                  salescount: packages.docs[index]
                                      ['salescount'],
                                );
                              });
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: StyledText(
                              text: "Something Went Wrong",
                            ),
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
            )),
      ),
    );
  }

  // add these function at the bottom of the extended class
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

  clearData() {
    packageid = uuid.v1();
    validityController.clear();
    typeController.clear();

    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    offersController.clear();
    _image!.path == null;
    stockController.clear();
  }
}

class PackageContainer extends StatelessWidget {
  PackageContainer({

    this.workout,
    this.img = 'fi1.jpg',
    this.name = 'CHEST',
    this.type = 'BEGINNER',
    this.user_id,
    this.pack_id,
    this.description,
    this.offer,
    this.rating,
    this.salescount,
    this.price = '600',
    this.validity = 60,
    this.user_name,
    this.phone,
    this.email,

  });

  var user_name;
  var workout;
  var email;
  var phone;
  var pack_id;
  var user_id;
  var img;
  var type;
  var name;
  var price;
  var validity;
  String? description;
  String? offer;
  List? rating;
  int? salescount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("Delete Package"),
                title: StyledText(
                  text: "Do You Want to Delete",
                ),
                actions: [
                  StyledContainer(
                      child: Text("Delete"),
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('packages')
                            .doc(user_id)
                            .delete()
                            .then((value) => Navigator.pop(context));
                      })
                ],
              );
            });
      },
      onTap: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {

            return
            PackageDetails(
            workout: workout,
            name: name,
            pack_id: pack_id,
            user_name: name,
            id: user_id,
            email: email,
            phone: phone,
            desc: description,
            offer: offer,
            rating: rating,
            salescount: salescount,
            price: price,
            day: validity,
            img: img,
          );
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
            width: 345,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage((img.toString())), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(left: 140, top: 20),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      name.toString().toUpperCase(),
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      type.toString(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.lock,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          price.toString() + '  RS',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Validity : ' + validity.toString() + '  Days',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 153,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(3, (index) {
                              return Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.blue,
                              );
                            }))
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

