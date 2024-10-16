
import 'package:fitgram/screens/user/daily_workouts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/packages.dart';
import '../../data/var.dart';

class DailyWorkouts extends StatefulWidget {
  var workout;
  DailyWorkouts({this.day, this.workout,this.name, this.img});
 var day;
  var img;
  var name;

  @override
  State<DailyWorkouts> createState() => _DailyWorkoutsState();
}

class _DailyWorkoutsState extends State<DailyWorkouts> {
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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

                      image: NetworkImage((widget.img.toString())), fit: BoxFit.cover)

              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 90),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 20,
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
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.day.toString() + ' Days Challange',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),











            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 500,
                width: double.infinity,
                child: GridView.builder(
                    itemCount:widget.day=90,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return DayWorkouts(
                              workout: widget.workout,
                              img: widget.img,
                              name: widget.name,
                              day: index + 1,
                            );
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                fontSize: 29, fontWeight: FontWeight.bold,color: Colors.black),
                          )),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
