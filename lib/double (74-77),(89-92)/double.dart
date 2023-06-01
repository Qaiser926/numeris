


import 'dart:async';
import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/report/report.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';

import '../WelcomeUI.dart';
import '../count/Q4.dart';
import '../single addition(52-55,78-82)/Addition.dart';
import '../util/views/countdown-page.dart';
import '../util/views/countdown-page1.dart';






class DoubleAdditionSubtraction extends StatefulWidget {
  final String childName;
  final int num;


  const DoubleAdditionSubtraction({super.key,required this.childName,required this.num});

  @override
  DoubleAdditionSubtractionState createState() => DoubleAdditionSubtractionState();
}

class DoubleAdditionSubtractionState extends State<DoubleAdditionSubtraction> {


  Timer? _timer;

  String answer = '';
  Color _containerColor = ColorManager.button;
  bool check = true;

  int targetIndex = 0;
  Color targetColor = ColorManager.offWhite;

  int i = 0;
  int j=0;


  int numberA=30;
  int numberB=20;
  String userAnswer='?';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();

  }

  void navigate(){
    widget.num==30?
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Addition(childName: widget.childName, number: 20,))): Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Report(childName: widget.childName)));
  }
  void startTimer() {
    // Cancel the existing timer if it's running
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(const Duration(seconds: 40), () {
      // This callback will be called every 40 seconds

        i<=1? checkResultAddition1():checkResultSubtract1();
    });
  }

  Future<void> buttonTapped() async {


    if(i<=1) {
      setState(() {
        checkResultAddition();
      });

      final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);

      if(widget.num==30) {
        i == 0 && userAnswer == (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q74": "1"})
            :
        i == 0 && userAnswer != (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q74": "0"})
            :

        i == 1 && userAnswer == (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q75": "1"})
            :
        i == 1 && userAnswer != (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q75": "0"})
            : null;
      }  if(widget.num==27) {
        i == 0 && userAnswer == (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q89": "1"})
            :
        i == 0 && userAnswer != (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q89": "0"})
            :

        i == 1 && userAnswer == (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q90": "1"})
            :
        i == 1 && userAnswer != (numberA + numberB).toString()
            ? await userCollection.doc(widget.childName).update({"Q90": "0"})
            : null;
      }
    }
    else if (i>=2){
              setState(() {
                checkResultSubtract();
              });

      final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
        if(widget.num==30) {
          i == 2 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q76": "1"})
              :
          i == 2 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q76": "0"})
              :

          i == 3 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q77": "1"})
              :
          i == 3 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q77": "0"})
              : null;
        }
        if(widget.num==27) {
          i == 2 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q91": "1"})
              :
          i == 2 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q91": "0"})
              :

          i == 3 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q92": "1"})
              :
          i == 3 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q92": "0"})
              : null;
        }


    }
  }
  // check if user is correct or not
  void checkResultAddition() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            onClick: () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Next_Question".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: 'Next_Question'.tr,
            onTap: goToNextQuestionAddition,
            icon: Icons.arrow_forward,
          );
        });



  }  void checkResultAddition1() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            onClick:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Time_out!".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: 'Time_out!'.tr,
            onTap: goToNextQuestionAddition,
            icon: Icons.arrow_forward,
          );
        });



  }
  void checkResultSubtract() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            onClick:   () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak(widget.num==27 && i==3? 'Test Completed'.tr:'Next_Question'.tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: widget.num==27 && i==3? 'Test Completed'.tr:'Next_Question'.tr,
            onTap: i==3 ? navigate : goToNextQuestionSubtract,
            icon: Icons.arrow_forward,
          );
        });
  }

  void checkResultSubtract1() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            onClick:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak(widget.num==27 && i==3? 'Test_Completed'.tr:'Time_out!'.tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
            message: widget.num==27 && i==3? 'Test_Completed'.tr:'Time_out!'.tr,
            onTap: i==3 ? navigate : goToNextQuestionSubtract,
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

      userAnswer='?';
      i++;
    });
    Navigator.of(context).pop();

    // reset values

    // create a new question
    numberA = randomNumber.nextInt(60)+20;
    numberB = randomNumber.nextInt(40)+20;
    while(numberA<=numberB)
    {
      numberA = randomNumber.nextInt(80)+20;
    }



  }
  void goToNextQuestionSubtract() {

    // dismiss alert dialog

    setState(() {
      startTimer();

      userAnswer='?';
      i++;
    });
    Navigator.of(context).pop();

    // reset values
    // create a new question
    numberA = randomNumber.nextInt(100)+20;
    numberB = randomNumber.nextInt(60)+20;

    while(numberA<=numberB)
    {
      numberA = randomNumber.nextInt(80)+20;
    }

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
                            SizedBox(height:screenHeight*0.1),


                            Row(
                              children: [
                              // widget.num==30?   CountdownPage1(path: Addition(childName: widget.childName, number: 20,),):
                              //  CountdownPage1(path: Report(childName: widget.childName,)),
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
                      child: Container(
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
                                //     color: ColorManager.green,
                                //     width: 2,
                                //   ),
                                // ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,),

                                    Expanded(
                                      child: GestureDetector(
                                        onTap:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Solve".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
                                        child: Text(
                                          "Solve".tr,
                                          textAlign: TextAlign.center,
                                          style:GoogleFonts.montserrat(textStyle: TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.032, // Change font size
                                            // Change font family
                                            fontWeight: FontWeight.bold, // Change font weight
                                            fontStyle: FontStyle.normal, // Change font style
                                            color: Colors.white, // Change text color
                                          ),
                                          ),),
                                      ),
                                    ),

                                    // SizedBox(height:  MediaQuery
                                    //     .of(context)
                                    //     .size
                                    //     .height * 0.1,),
                                    Expanded(child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: screenWidth*0.025,),
                                        // question
                                        Text(
                                          i <=1  ?  '$numberA   +  $numberB  =  '  :  '$numberA  -  $numberB  =  ',
                                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.032, // Change font size
                                            // Change font family
                                            fontWeight: FontWeight.bold, // Change font weight
                                            fontStyle: FontStyle.normal, // Change font style
                                            color: Colors.white, // Change text color
                                          ),
                                          ),
                                        ),

                                        // answer box
                                        ButtonAnswer(
                                            userAnswer,
                                                () {},
                                            _containerColor

                                        ),
                                      ],
                                    ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: SizedBox()),

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


                            // SizedBox(height: MediaQuery
                            //     .of(context)
                            //     .size
                            //     .height * 0.002,),


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
                                              // if(controllerList[i].text.toString()!='' && i<=3){
                                              setState(() {

                                                buttonTapped();

                                              });
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
          final mediaQueryData = MediaQuery.of(context);


          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;

          return GestureDetector(
            onTap: onPressed,
            child: Container(
              // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.101,
              height: MediaQuery.of(context).size.width * 0.085,
              decoration: BoxDecoration(
                border: Border.all(
                  color: color,
                  width: MediaQuery.of(context).size.width * 0.02,
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
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                    fontSize:  MediaQuery
                        .of(context)
                        .size
                        .width * 0.024, // Change font size
                    // Change font family
                    fontWeight: FontWeight.bold, // Change font weight
                    fontStyle: FontStyle.normal, // Change font style
                    color: Colors.white, // Change text color
                  ),
                  ),
                ),
              ),
            ),

          );
        }
    );}
}


