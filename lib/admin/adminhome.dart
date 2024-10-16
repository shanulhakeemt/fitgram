
import 'package:fitgram/admin/managestore.dart';
import 'package:fitgram/admin/viealltrainers.dart';
import 'package:fitgram/admin/viewall%20users.dart';
import 'package:fitgram/common/loginpage.dart';
import 'package:fitgram/screens/user/packages.dart';
import 'package:fitgram/widgets/mycontainer.dart';
import 'package:fitgram/widgets/mytest.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
        title: StyledText(
          text: "Admin Home",
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: StyledContainer(
                    child: StyledText(
                      text: "View All Users",
                      color: Colors.white,
                    ),
                    height: 150,
                    width: 350,
                    color: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllUsers()));
                    }),
              ),
              SizedBox(
                width: 12,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: StyledContainer(
                    child: StyledText(
                      text: "View All Trainers",
                      color: Colors.white,
                    ),
                    height: 150,
                    width: 350,
                    color: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllTrainers()));
                    }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                child: StyledContainer(
                    child: StyledText(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      text: "Manage Store",
                      color: Colors.white,
                    ),
                    height: 150,
                    width: 350,
                    color: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManageStore()));
                    }),
              ),
              SizedBox(
                width: 12,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: StyledContainer(
                    child: StyledText(
                      text: "Manage packages",
                      color: Colors.white,
                    ),
                    height: 150,
                    width: 350,
                    color: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PackageScreen(
                                    from: 'admin',
                                  )));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
