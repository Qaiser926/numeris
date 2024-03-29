


import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeris/count/43.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';

import '../WelcomeUI.dart';
import '../count/Q4.dart';
import '../single addition(52-55,78-82)/Addition.dart';
import '../util/views/countdown-page.dart';
import '../util/views/countdown-page1.dart';



class Points extends StatefulWidget {
  final int numberA;
  final String childName;
  const Points({super.key, required this.numberA, required this.childName});

  @override
  PointsState createState() => PointsState();
}

class PointsState extends State<Points> {



  String answer = '';
  final Color _containerColor = ColorManager.button;
  bool check = true;

  int targetIndex = 0;
  Color targetColor = ColorManager.offWhite;

  int i = 0;
  int j=0;


  Timer? _timer;
  late int number;
  int numberB=20;
  String userAnswer='?';
  List<Positioned> _positionedWidgets = [];





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    number=widget.numberA;
    startTimer();
    initTts();

  }


   late FlutterTts flutterTts;

  // TtsState ttsState = TtsState.stopped;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  initTts() {
    flutterTts = FlutterTts();

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;


    final p = _generatePositionedWidgets(Size(MediaQuery.of(context).size.width*0.5121, MediaQuery.of(context).size.height*0.73));

    setState(() {
      _positionedWidgets=p;
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
  void startTimer() {
    // Cancel the existing timer if it's running
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(const Duration(seconds: 20), () {
      // This callback will be called every 40 seconds
      checkResult();
    });
  }

  void navigate(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Q43(childName: widget.childName)));
  }

  Future<void> buttonTapped() async {
    setState(() {
      checkResultAddition();
    });

    final FirebaseAuth auth = FirebaseAuth.instance;
    final  currentUser = auth.currentUser;
    final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);

    i==0 && userAnswer==number.toString()? await userCollection.doc(widget.childName).update({"Q37": "1"}):
    i==0 && userAnswer!=number.toString()? await userCollection.doc(widget.childName).update({"Q37": "0"}):

    i==1 && userAnswer==number.toString()?await userCollection.doc(widget.childName).update({"Q38": "1"}):
    i==1 && userAnswer!=number.toString()?await userCollection.doc(widget.childName).update({"Q38": "0"}):
    i==2 && userAnswer==number.toString()?await userCollection.doc(widget.childName).update({"Q39": "1"}):
    i==2 && userAnswer!=number.toString()?await userCollection.doc(widget.childName).update({"Q39": "0"}):
    i==3 && userAnswer==number.toString()?await userCollection.doc(widget.childName).update({"Q40": "1"}):
    i==3 && userAnswer!=number.toString()?await userCollection.doc(widget.childName).update({"Q40": "0"}):
    i==4 && userAnswer==number.toString()?await userCollection.doc(widget.childName).update({"Q41": "1"}):
    i==4 && userAnswer!=number.toString()?await userCollection.doc(widget.childName).update({"Q41": "0"}):
    i==5 && userAnswer==number.toString()?await userCollection.doc(widget.childName).update({"Q42": "1"}):
    i==5 && userAnswer!=number.toString()?await userCollection.doc(widget.childName).update({"Q42": "0"}): null;




  }
  // check if user is correct or not
  void checkResultAddition() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
              // text-to-speech
            onClick:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Next_Question".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: 'Next_Question'.tr,
            onTap: i==5 ? navigate : goToNextQuestionAddition,
            icon: Icons.arrow_forward,
          );
        });



  }
  void checkResult() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
               // text-to-speech
            onClick:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Time_out!".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: 'Time_out!'.tr,
            onTap: i==5 ? navigate : goToNextQuestionAddition,
            icon: Icons.arrow_forward,
          );
        });



  }


  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestionAddition() {

    // dismiss alert dialog
    setState(() {
      startTimer();

      i++;
      if(i==1){
        number=12;
      }
      else if(i==2){
        number=20;
      }
      else if(i==3){
        number=40;
      }
      else if(i==4){
        number=35;
      }
      else if(i==5){
        number=25;
      }

      _positionedWidgets= _generatePositionedWidgets( Size(MediaQuery.of(context).size.width*0.5121, MediaQuery.of(context).size.height*0.73));
      userAnswer='?';

    });
    Navigator.of(context).pop();


  }





  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)
      {


        final double screenHeight=MediaQuery
            .of(context)
            .size
            .height;

        final double screenWidth=MediaQuery
            .of(context)
            .size
            .width;

        return SafeArea(
          child: Stack(
            children: [
              const BackgroundImage(imagePath: "assets/new.jpg",),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.0025),
                        child: SizedBox(
                          width: screenWidth*0.003,
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: ColorManager.green,
                          //     width: 2,
                          //   ),
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenWidth*0.01,),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth*0.012,),
                                  ExitButton(Icons.close_outlined, ColorManager.LightRed, onPressed:(){
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Back(imagePath: 'assets/circleIndicator.json', path: Welcome(),)),
                                    );
                                  }),

                                ],
                              ),




                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height:screenHeight*0.08),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                 // CountdownPage1(path: Q43(childName: widget.childName),),
                                SizedBox(width: screenWidth*0.01,)

                              ],
                            ),

                          ],
                        )),
                    // SizedBox(width:MediaQuery
                    //     .of(context)
                    //         .size.width*0.05),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: ColorManager.LightRed,
                        //     width: 2,
                        //   ),
                        // ),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.93,


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.05,),
                            Expanded(
                              flex: 4,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //     color: ColorManager.LightRed,
                                //     width: 2,
                                //   ),
                                // ),
                                padding: EdgeInsets.all( MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: screenHeight*0.01,),



                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: screenWidth*0.01,),
                                        Expanded(
                                          flex: 5,
                                          child: GestureDetector(
                                              // text-to-speech
            onTap:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("How_many_points_do_you_see".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
                                            child: Text(
                                              "How_many_points_do_you_see".tr ,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:  MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.025, // Change font size
                                                fontFamily: 'YourFontName', // Change font family
                                                fontWeight: FontWeight.bold, // Change font weight
                                                fontStyle: FontStyle.normal, // Change font style
                                                color: ColorManager.white, // Change text color
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(width: screenWidth*0.013,),
                                        Expanded(child: ButtonAnswer(userAnswer, () { }, ColorManager.button)),
                                        SizedBox(width: screenWidth*0.025,),

                                      ],
                                    ),

                                    SizedBox(height:  MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.03,),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // SizedBox(width: screenWidth*0.008,),
                                          Expanded(child: SizedBox()),

                                          Expanded(
                                            flex: 18,
                                            child: Container(

                                              // decoration:  BoxDecoration(
                                              //   border: Border.all(
                                              //     color: ColorManager.LightRed,
                                              //     width: 1,
                                              //   ),
                                              //   color: Colors.transparent,
                                              // ),


                                              child: Stack(
                                                  fit: StackFit.expand,
                                                  children:  _positionedWidgets
                                              ),

                                            ),

                                          ),
                                          const Expanded(child: SizedBox()),                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight*0.05,)

                                  ],
                                ),
                              ),
                            ),

                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 1.2,

                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                SizedBox(height: screenHeight*0.07,),

                                Expanded(
                                  child: Container(
                                    // height:330,



                                    // margin: EdgeInsets.fromLTRB(0, 17, 10,0),
                                    // padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context).size.width*0.052/2.8),
                            border: Border.all(width: MediaQuery
                                .of(context).size.width*0.004, color:ColorManager.LightRed),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    KeypadButton('1', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '1';
                                                }
                                                else {
                                                  userAnswer += '1';
                                                }
                                              });
                                            }),
                                            KeypadButton('2', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '2';
                                                }
                                                else {
                                                  userAnswer += '2';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                          children: [
                                            KeypadButton('3', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '3';
                                                }
                                                else {
                                                  userAnswer += '3';
                                                }

                                              });
                                            }),
                                            KeypadButton('4', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '4';
                                                }
                                                else {
                                                  userAnswer += '4';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('5', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '5';
                                                }
                                                else {
                                                  userAnswer += '5';
                                                }

                                              });
                                            }),
                                            KeypadButton('6', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '6';
                                                }
                                                else {
                                                  userAnswer += '6';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('7', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '7';
                                                }
                                                else {
                                                  userAnswer += '7';
                                                }

                                              });
                                            }),
                                            KeypadButton('8', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '8';
                                                }
                                                else {
                                                  userAnswer += '8';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('9', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '9';
                                                }
                                                else {
                                                  userAnswer += '9';
                                                }

                                              });
                                            }),
                                            KeypadButton('0', () {
                                              setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '0';
                                                }
                                                else {
                                                  userAnswer += '0';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ActionButton(Icons.arrow_back, ColorManager.maroon, onPressed: (){
                                              setState(() {
                                                userAnswer='?';
                                              });
                                            }


                                            ),
                                            ActionButton(Icons.check, ColorManager.lightGreen,onPressed: (){
                                              // if(controllerList[i].text.toString()!='' && i<=6){

                                              buttonTapped();



                                              // }




                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight*0.07,),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth*0.05,),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

  }
  List<Positioned> _generatePositionedWidgets(Size containerSize) {
    List<Positioned> positionedWidgets = [];

    for (int i = 0; i < number; i++) {
      final random = Random();
      double top, right;
      do {
        top = random.nextDouble() * (containerSize.height - 80);
        right = random.nextDouble() * (containerSize.width - 80);
      } while (_isOverlapping(top, right, positionedWidgets) ||
          _isTouchingBoundary(top, right, containerSize));

      positionedWidgets.add(Positioned(
        top: top,
        right: right,
        child: SizedBox(
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color:Colors.red,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red.shade300

                ,
                width: 5,
              ),
            ),
          ),
        ),
      ));
    }

    return positionedWidgets;
  }

  bool _isOverlapping(double top, double right, List<Positioned> positionedWidgets) {
    for (int i = 0; i < positionedWidgets.length; i++) {
      final Positioned positioned = positionedWidgets[i];
      final double? otherTop = positioned.top;
      final double? otherRight = positioned.right;
      final double distance = sqrt(pow(top - otherTop!, 2) + pow(right - otherRight!, 2));
      if (distance < MediaQuery.of(context).size.width*0.03013) { // adjust this value to increase or decrease the minimum distance between widgets
        return true;
      }
    }
    return false;
  }

  bool _isTouchingBoundary(double top, double right, Size containerSize) {
    return top <= 0 || right <= 0 || top + 80 >= containerSize.height || right + 80 >= containerSize.width;
  }




}
class KeypadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const KeypadButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;
          return GestureDetector(
            onTap: onPressed,
            child: Container(
              // margin: EdgeInsets.all(1),
              width: MediaQuery
                  .of(context).size.width*0.052,
              height: MediaQuery
                  .of(context).size.width*0.052,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery
                      .of(context).size.width*0.052/4,),
                  // border: Border.all(width: 4, color: ColorManager.LightRed),
                  color: ColorManager.LightRed
              ),
              child: Center(
                child: Text(text, style: TextStyle(fontSize: MediaQuery
                    .of(context).size.width*0.055/2.7,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold
                )),
              ),
            ),
          );
        }
    );
  }
}


class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton(this.icon, this.color, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery
          .of(context).size.width*0.053,
      height: MediaQuery
          .of(context).size.width*0.053,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: color , // Change border color
        //    // Change border width
        // ),
        shape: BoxShape.circle,
        color: color,
      ),
      child: IconButton(
        icon: Icon(icon, color: ColorManager.white, size: MediaQuery
            .of(context).size.width* 0.052/2 ,),
        onPressed: onPressed,
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const ExitButton(this.icon, this.color, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          return GestureDetector(
            onTap: onPressed,
            child: Container(

              width: MediaQuery.of(context).size.width * 0.045,
              height: MediaQuery.of(context).size.width * 0.045,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: Colors.red.shade500 , // Change border color
                //    // Change border width
                // ),
                color: color,
              ),
              child: Center(
                child: IconButton(
                  icon: Center(child: Icon(icon, color: Colors.white,size: MediaQuery.of(context).size.width * 0.025)),
                  onPressed: onPressed,
                ),
              ),
            ),
          );
        }
    );}
}
class ButtonAnswer extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ButtonAnswer(this.text, this.onPressed, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {


          return GestureDetector(
            onTap: onPressed,
            child: Container(
              // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.080,
              height: MediaQuery.of(context).size.width * 0.078,
              decoration: BoxDecoration(
                border: Border.all(
                  color: color,

                ),
                color:  color ,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.027,
                    fontFamily: 'YourFontName',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color:  ColorManager.white,
                  ),
                ),
              ),
            ),

          );
        }
    );}
}



