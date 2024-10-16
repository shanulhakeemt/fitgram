import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitgram/common/store_product_details.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ManageStore extends StatefulWidget {
  const ManageStore({Key? key}) : super(key: key);

  @override
  State<ManageStore> createState() => _ManageStoreState();
}

class _ManageStoreState extends State<ManageStore> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offersController = TextEditingController();

  TextEditingController stockController = TextEditingController();
  final key = GlobalKey<FormState>();
  var uuid = Uuid();
  var productid;

  @override
  void initState() {
    productid = uuid.v1();
    super.initState();
  }

  final ImagePicker _picker = ImagePicker(); // For pick Image
  XFile? _image; // For accept Null:-?

  var imageurl;
  String? valueChoose;

  String? selectedValue;

  List<String>? items = ['Equippments', 'Accesseries','Protiens'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
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
                              controller: titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Mandatory";
                                }
                              },
                              decoration: InputDecoration(hintText: "Title"),
                            ),
                            TextFormField(
                              controller: descriptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Mandatory";
                                }
                              },
                              decoration:
                                  InputDecoration(hintText: "Description"),
                            ),
                            TextFormField(
                              controller: priceController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Mandatory";
                                }
                              },
                              decoration: InputDecoration(hintText: "Price"),
                            ),
                            TextFormField(
                              controller: offersController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Mandatory";
                                }
                              },
                              decoration: InputDecoration(hintText: "Offers"),
                            ),
                            TextFormField(
                              controller: stockController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Mandatory";
                                }
                              },
                              decoration: InputDecoration(hintText: "Stock"),
                            ),
                            DropdownButtonFormField(
                              hint: Text("Select Catagory"),
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
                        textStyle: Theme.of(context).textTheme.labelLarge,
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
                                  .collection('store')
                                  .doc(productid)
                                  .set({
                                'catagory':selectedValue,
                                'productid': productid,
                                'title': titleController.text,
                                'description': descriptionController.text,
                                'price': priceController.text,
                                'offer': offersController.text,
                                'imgurl': imageurl,
                                'status': 1,
                                'stock': stockController.text,
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
      ),
      appBar: AppBar(
        title: StyledText(
          text: "Store",
          color: Colors.white,
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StyledText(
                  text: "All Products",
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("store")
                        .where('status', isEqualTo: 1)
                        .snapshots(),
                    builder: (_, snapshot) {
                      var users = snapshot.data;
                      if (snapshot.hasData && snapshot.data!.docs.length == 0) {
                        return Center(
                          child: StyledText(
                            text: "No Users Found",
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: users!.docs.length,
                            itemBuilder: (_, index) {
                              return Card(
                                color: Colors.white,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StoreProduct(
                                                  id: users.docs[index]
                                                      ['productid'],
                                                  from: "admin",
                                                )));
                                  },
                                  leading: CircleAvatar(
                                    child: StyledText(
                                      text: (index + 1).toString(),
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    users.docs[index]['title']
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: StyledText(
                                    text: users.docs[index]['price'],
                                    color: Colors.black,
                                  ),
                                ),
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
    productid = uuid.v1();
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    offersController.clear();
    _image!.path == null;
    stockController.clear();
  }
}
