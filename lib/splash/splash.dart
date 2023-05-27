import 'dart:async';


import 'package:flutter/material.dart';
import 'package:numeris/splash/splashscreen.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  Timer? _timer;



  void navigateToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  const SplashScreen(imagePath: "assets/owl.json")),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => navigateToWelcome());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Image(
          image:AssetImage("assets/splashLogo.png"),
        ),


        // Image(
        // image:AssetImage("assets/splashLogo.png"),
        // ),
      ),
      );
  }
}

