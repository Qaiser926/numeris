


import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/single%20addition(52-55,78-82)/Addition.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';


import '../WelcomeUI.dart';
import '../count/Q4.dart';
import '../subtraction(56-59,83-88)/Subtract.dart';
import '../util/views/countdown-page.dart';
import '../util/views/countdown-page1.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;






class PlusMinus extends StatefulWidget {

  final String childName;

  const PlusMinus({super.key, required this.childName});

  @override
  PlusMinusState createState() => PlusMinusState();
}

class PlusMinusState extends State<PlusMinus> {



  String answer = '';
  final Color _containerColor = ColorManager.button;

  String question = 'What_is_the_answer_to_one_plus_5'.tr;
  String question1 = 'What_is_the_answer_to_5_plus_4'.tr;
  String question2 = 'answer_to_eight_minus'.tr;
  String question3 = 'add_to_5_make_eight'.tr;
  String question4 = 'what_plus_two_is_seven'.tr;

  int i = 0;
  int j=0;


  int numberA=1;
  int numberB=5;
  Timer? _timer;

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


  void startTimer() {
    // Cancel the existing timer if it's running
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(const Duration(seconds: 40), ()  {
      // This callback will be called every 40 seconds
      checkResult1();
    });
  }


  void navigate(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Addition(childName: widget.childName, number: 10,)));
  }

  Future<void> buttonTapped() async {
    setState(()  {
      j++;
      checkResult();
    });
      final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
      i==0 && userAnswer==(numberA+numberB).toString()? await userCollection.doc(widget.childName).update({"Q47": "1"}):
      i==0 && userAnswer!=(numberA+numberB).toString()? await userCollection.doc(widget.childName).update({"Q47": "0"}):

      i==1 && userAnswer==(numberA+numberB).toString()?await userCollection.doc(widget.childName).update({"Q48": "1"}):
      i==1 && userAnswer!=(numberA+numberB).toString()?await userCollection.doc(widget.childName).update({"Q48": "0"}):
      i==2 && userAnswer==(numberA-numberB).toString()?await userCollection.doc(widget.childName).update({"Q49": "1"}):
      i==2 && userAnswer!=(numberA-numberB).toString()?await userCollection.doc(widget.childName).update({"Q49": "0"}):
      i==3 && userAnswer=="3"?await userCollection.doc(widget.childName).update({"Q50": "1"}):
      i==3 && userAnswer!="3"?await userCollection.doc(widget.childName).update({"Q50": "0"}):
      i==4 && userAnswer=="5"?await userCollection.doc(widget.childName).update({"Q51": "1"}):
      i==4 && userAnswer!="5"?await userCollection.doc(widget.childName).update({"Q51": "0"}):

    null;




  }

  // check if user is correct or not
  void checkResult() {

    showDialog(
        barrierDismissible: false,
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
            onTap: i==4 ?  navigate : goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        });

  }  void checkResult1() {

    showDialog(
        barrierDismissible: false,
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
            message: 'Time_out!',
            onTap: i==4 ?  navigate : goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        });

  }

  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestion() {
    // dismiss alert dialog

    Navigator.of(context).pop();

    // reset values
    setState(() {
      startTimer();

      i++;
      if(i==1){
        numberA=5;
        numberB=4;
      }
      else if(i==2){
        numberA=8;
        numberB=5;
      }
      else if(i==3){
        numberA=5;
        numberB=8;
      }
      else if(i==4){
        numberA=2;
        numberB=7;
      }


      userAnswer='?';

    });


  }





  // GO BACK TO QUESTION




  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)
      {

        final double scaleFactor = MediaQuery
            .of(context)
            .devicePixelRatio;

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
                        child: Container(
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

                        child: Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: ColorManager.green,
                          //     width: 2,
                          //
                          //   ),
                          // ),
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height:screenHeight*0.1),


                              Row(
                                children: [
                                   // CountdownPage1(path: Addition(childName: widget.childName, number: 10,),),
                                  SizedBox(width: screenWidth*0.01,)

                                ],
                              ),

                            ],
                          ),

                        )),
                    // SizedBox(width:MediaQuery
                    //     .of(context)
                    //         .size.width*0.05),
                    Expanded(
                      flex: 5,
                      child: SizedBox(

                        

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
                                    SizedBox(height: screenHeight*0.06,),


                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(width: screenWidth*0.03,),

                                          Expanded(
                                         child: GestureDetector(
                                                   // text-to-speech
            onTap:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak( i==0? question :i==1? question1.tr: i==2? question2.tr: i==3? question3.tr : question4.tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
                                           child: Text(
                                              i==0? question :i==1? question1.tr: i==2? question2.tr: i==3? question3.tr : question4.tr ,
                                              textAlign: TextAlign.center,
                                              style:GoogleFonts.montserrat(textStyle: TextStyle(
                                                fontSize:   i==3?MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.020:MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.020, // Change font size
                                                // Change font family
                                                fontWeight: FontWeight.bold, // Change font weight
                                                fontStyle: FontStyle.normal, // Change font style
                                                color: Colors.white, // Change text color
                                              ),
                                              ),
                                         
                                            ),
                                         ),
                                      ),
                                          SizedBox(width: screenWidth*0.03,),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height:  MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.035,),
                                    
                                    i==0||i==1||i==2? Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // question
                                          Text(
                                            i==0 || i==1 ?  '$numberA  +  $numberB = ': '$numberA  -  $numberB = ',
                                            style: GoogleFonts.montserrat(textStyle: TextStyle(
                                              fontSize:  MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.030, // Change font size
                                              // Change font family
                                              fontWeight: FontWeight.bold, // Change font weight
                                              fontStyle: FontStyle.normal, // Change font style
                                              color: Colors.white, // Change text color
                                            ),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth*0.03,),

                                          // answer box
                                          ButtonAnswer(
                                              userAnswer,
                                                  () {},
                                              _containerColor

                                          ),

                                        ],
                                      ),
                                    ): i==3? Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          // question
                                           Text(
                                              '$numberA  +  ',
                                              style:GoogleFonts.montserrat(textStyle: TextStyle(
                                                fontSize:  MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.030, // Change font size
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
                                          Text(
                                            '  =  $numberB',
                                            style: GoogleFonts.montserrat(textStyle: TextStyle(
                                              fontSize:  MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.030, // Change font size
                                              // Change font family
                                              fontWeight: FontWeight.bold, // Change font weight
                                              fontStyle: FontStyle.normal, // Change font style
                                              color: Colors.white, // Change text color
                                            ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ):  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // question
                                        ButtonAnswer(
                                            userAnswer,
                                                () {},
                                            _containerColor

                                        ),
                                        Text(
                                          '  +  $numberA',
                                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.030, // Change font size
                                            // Change font family
                                            fontWeight: FontWeight.bold, // Change font weight
                                            fontStyle: FontStyle.normal, // Change font style
                                            color: Colors.white, // Change text color
                                          ),
                                          ),
                                        ),

                                        // answer box

                                        Text(
                                          '  =  $numberB',
                                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.030, // Change font size
                                            // Change font family
                                            fontWeight: FontWeight.bold, // Change font weight
                                            fontStyle: FontStyle.normal, // Change font style
                                            color: Colors.white, // Change text color
                                          ),
                                          ),
                                        ),

                                      ],
                                    ),
                                     const Expanded(
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
          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;

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
              width: MediaQuery.of(context).size.width * 0.078,
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
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                    fontSize:  MediaQuery
                        .of(context)
                        .size
                        .width * 0.025, // Change font size
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

