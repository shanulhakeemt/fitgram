
import 'package:firebase_core/firebase_core.dart';
import 'package:fitgram/firebase_options.dart';
import 'package:fitgram/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'common/bmi/bmi0.dart';
import 'common/store.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitnessApp',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E0E21),
        scaffoldBackgroundColor: Color(0xFF0E0E21),
      ),
      home:Splash(),
      routes: {
        'bmi1':(context)=>Splash(),
      },
    );
  }
}
