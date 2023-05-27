import 'dart:async';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../WelcomeUI.dart';
import '../authenticate/authenticate.dart';
import '../util/background-image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  final String imagePath;
  const SplashScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  Authenticate authenticate=Authenticate();

  LottieBuilder pic() {
    return Lottie.asset(
       widget.imagePath);
  }

  void navigateToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  authenticate.isLogin()),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 11), () => navigateToWelcome());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final mediaQueryData = MediaQuery.of(context);


          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: [
                  SizedBox(height:MediaQuery
                      .of(context)
                      .size
                      .height * 0.14,),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.63,
                    width: double.infinity,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.red,
                //
                //   ),),
                    child: pic(),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.36,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.red,
                    //
                    //   ),),

                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 10000,
                      lineHeight: 33,
                      percent: 1.0,
                      progressColor: Colors.deepPurple,
                      backgroundColor: Colors.deepPurple.shade200,
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }



}

