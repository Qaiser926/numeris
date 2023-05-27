import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Back extends StatefulWidget {
  final String imagePath;
  final Widget path;
  const Back({Key? key, required this.imagePath, required this.path}) : super(key: key);

  @override
  BackState createState() => BackState();
}

class BackState extends State<Back> {
  Timer? _timer;

  LottieBuilder pic() {
    return Lottie.asset(
        widget.imagePath);
  }

  void navigateToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget.path,)
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => navigateToWelcome());
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
                  Container(
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
                    // child: LinearPercentIndicator(
                    //   animation: true,
                    //   animationDuration: 10000,
                    //   lineHeight: 33,
                    //   percent: 1.0,
                    //   progressColor: Colors.deepPurple,
                    //   backgroundColor: Colors.deepPurple.shade200,
                    // ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }



}

