



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numeris/Dice(21,36,46)/Dice.dart';
import 'package:numeris/HalfDouble(60-73)/HalfDouble.dart';
import 'package:numeris/WelcomeUI.dart';
import 'package:numeris/authenticate/login.dart';
import 'package:numeris/authenticate/signup.dart';
import 'package:numeris/cards/19.dart';
import 'package:numeris/cards/20.dart';
import 'package:numeris/circle(1-2,%2028-35)/circles1.dart';
import 'package:numeris/count/44.dart';
import 'package:numeris/count/45.dart';
import 'package:numeris/count/Q15.dart';
import 'package:numeris/count/Q3.dart';
import 'package:numeris/count/Q5.dart';
import 'package:numeris/count/Q6.dart';
import 'package:numeris/double%20(74-77),(89-92)/double.dart';
import 'package:numeris/points(37-42)/points.dart';
import 'package:numeris/report/report.dart';
import 'package:numeris/single%20addition(52-55,78-82)/Addition.dart';
import 'package:numeris/single%20question(7-14),(22-27),(47-51)/beforeafter(7-14).dart';
import 'package:numeris/single%20question(7-14),(22-27),(47-51)/missing(22-27).dart';
import 'package:numeris/single%20question(7-14),(22-27),(47-51)/plusMinus(47-51).dart';
import 'package:numeris/splash/splash.dart';

import 'package:numeris/subtraction(56-59,83-88)/Subtract.dart';

import 'package:firebase_core/firebase_core.dart';

import 'Test/test.dart';
import 'Test/test2.dart';
import 'circle(1-2, 28-35)/circles.dart';
import 'count/43.dart';
import 'count/Q16.dart';
import 'count/Q17.dart';
import 'count/Q18.dart';
import 'count/Q4.dart';



Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
    ));
    return const  MaterialApp(
      color: Colors.white,

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HalfDouble(  childName: 'mush',     )
     // dice page me translate ka question he 
     // "What is the double of
     // report page
     // beforeafter page
     
    );
  }
}


