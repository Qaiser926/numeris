


import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/HalfDouble(60-73)/HalfDouble.dart';
import 'package:numeris/double%20(74-77),(89-92)/double.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';

import '../WelcomeUI.dart';

import '../util/views/countdown-page1.dart';






class Subtract extends StatefulWidget {
  final String childName;
  final int number;
  const Subtract({super.key,required this.childName,required this.number});

  @override
  SubtractState createState() => SubtractState();
}

class SubtractState extends State<Subtract> {



  String answer = '';
  Color _containerColor = ColorManager.button;
  bool check = true;
  Timer? _timer;

  int targetIndex = 0;
  Color targetColor = ColorManager.offWhite;

  int i = 0;
  int j=0;


  int numberA=10;
  int numberB=5;
  String userAnswer='?';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();





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
    _timer = Timer(const Duration(seconds: 40), () {
      // This callback will be called every 40 seconds
      checkResult1();
    });
  }


  void navigate(){
    widget.number==10?
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HalfDouble(childName: widget.childName,))):
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  DoubleAdditionSubtraction(childName: widget.childName, num: 27,)));
  }

  Future<void> buttonTapped() async {

    setState(()  {

      checkResult();


    });

        final FirebaseAuth auth = FirebaseAuth.instance;
        final  currentUser = auth.currentUser;
        final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
        if(widget.number==10) {
          j == 0 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q56": "1"})
              :
          j == 0 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q56": "0"})
              :

          j == 1 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q57": "1"})
              :
          j == 1 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q57": "0"})
              :
          j == 2 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q58": "1"})
              :
          j == 2 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q58": "0"})
              :
          j == 3 && userAnswer == (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q59": "1"})
              :
          j == 3 && userAnswer != (numberA - numberB).toString()
              ? await userCollection.doc(widget.childName).update({"Q59": "0"})
              :


          null;
        }
        if(widget.number==20) {
                  j == 0 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q83": "1"})
                      :
                  j == 0 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q83": "0"})
                      :

                  j == 1 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q84": "1"})
                      :
                  j == 1 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q84": "0"})
                      :
                  j == 2 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q85": "1"})
                      :
                  j == 2 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q85": "0"})
                      :
                  j == 3 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q86": "1"})
                      :
                  j == 3 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q86": "1"})
                      :
                  j == 4 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q87": "1"})
                      :
                  j == 4 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q87": "0"})
                      :
                  j == 5 && userAnswer == (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q88": "1"})
                      :
                  j == 5 && userAnswer != (numberA - numberB).toString()
                  ? await userCollection.doc(widget.childName).update({"Q88": "0"})
                      :


                  null;


                  }
    setState(() {
      j++;
    });
  }

  // check if user is correct or not
  void checkResult() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Next_Question'.tr,
            onTap:  widget.number==10? j<=3 ? goToNextQuestion: navigate: widget.number==20? j<=4? goToNextQuestion: navigate:navigate,
            icon: Icons.arrow_forward,
          );
        });

  }
  void checkResult1() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Time_out!'.tr,
            onTap:  widget.number==10? j<=3 ? goToNextQuestion: navigate: widget.number==20? j<=4? goToNextQuestion: navigate:navigate,
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


      _containerColor = ColorManager.button;
      userAnswer = '?';
    });

    // create a new question
    numberA = randomNumber.nextInt(20)+1;
    numberB = randomNumber.nextInt(10)+3;

    while(numberA<=numberB)
    {
      numberA = randomNumber.nextInt(20)+1;
    }



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
                                // widget.number==10? CountdownPage1(path: HalfDouble(childName: widget.childName)): CountdownPage1(path: DoubleAdditionSubtraction(childName: widget.childName, num: 27,)),
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
                                          '$numberA  -  $numberB  =  ',
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
                                                i=i+1;
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
              width: MediaQuery.of(context).size.width * 0.085,
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




