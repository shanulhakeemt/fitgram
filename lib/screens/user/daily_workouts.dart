import 'package:fitgram/data/var.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/packages.dart';

class DayWorkouts extends StatefulWidget {
  var workout;
  DayWorkouts({this.day, this.name, this.workout, this.img});

  var day;
  var img;
  var name;

  @override
  State<DayWorkouts> createState() => _DayWorkoutsState();
}

class _DayWorkoutsState extends State<DayWorkouts> {
  var item = [];

  getData() {
    switch (widget.workout) {
      case "arm_package":
        {
          if (item.contains(arm_package)) {
            null;
            break;
          } else {
            item.add(arm_package);
            break;
          }
        }

      default:
        {
          item.add(arm_package);
        }
    }
  }

  @override
  void initState() {
    getData();
    print(item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white60,
                      blurRadius: 1.0,
                    ),
                  ],
                  image: DecorationImage(
                      image: NetworkImage((widget.img.toString())),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 90),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'Day ' + widget.day.toString(),
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 650,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: item[0].length,
                  itemBuilder: (BuildContext context, index) {
                    print(index);
                    return ListTile(
                        subtitle: Text(
                          item[0][index]['times'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        leading: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    actions: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ))
                                    ],
                                    insetPadding: EdgeInsets.only(
                                        bottom: 70,
                                        right: 50,
                                        left: 50,
                                        top: 50),
                                    title: Center(
                                        child: Container(
                                      child: Lottie.asset(
                                          'assets/animations/' +
                                              item[0][index]['anime']
                                                  .toString(),
                                          repeat: true,
                                          reverse: true,
                                          fit: BoxFit.cover),
                                    )),
                                    backgroundColor: Colors.white,
                                    content: Column(
                                      children: [
                                        Text(
                                          item[0][index]['name']
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          profile,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.list,
                            color: Colors.blue,
                          ),
                        ),
                        trailing: Lottie.asset(
                            'assets/animations/' +
                                item[0][index]['anime'].toString().toString(),
                            repeat: true,
                            reverse: true,
                            fit: BoxFit.cover),
                        title: Text(
                          item[0][index]['name'].toString(),
                          style: TextStyle(color: Colors.black),
                        ));
                  }),
            ),
          ],
        ),
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
