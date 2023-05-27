


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeris/single%20question(7-14),(22-27),(47-51)/plusMinus(47-51).dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';
import '../WelcomeUI.dart';
import '../count/Q4.dart';
import '../points(37-42)/points.dart';
import '../single question(7-14),(22-27),(47-51)/missing(22-27).dart';
import '../subtraction(56-59,83-88)/Subtract.dart';
import '../util/views/countdown-page.dart';
import '../util/views/countdown-page1.dart';






class Dice extends StatefulWidget {
  final int number;
  final String childName;
  const Dice({super.key, required this.number,required this.childName});

  @override
  DiceState createState() => DiceState();
}

class DiceState extends State<Dice> {



  String answer = '';
  final Color _containerColor = ColorManager.button;




  int i = 0;

  String userAnswer='?';
  String userAnswer1='?';
  String userAnswer2='?';
  String userAnswer3='?';
  String userAnswer4='?';
  String userAnswer5='?';
  String userAnswer6='?';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(const Duration(seconds: 40), () {
    //   checkResult();
    // });



  }

  void navigate(){
   widget.number==7? Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Missing(childName: widget.childName,))):
   widget.number==10? Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   Points(numberA: 15, childName: widget.childName,)))
       :widget.number==18? Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PlusMinus(childName: widget.childName))):null
   ;
  }

  Future<void> buttonTapped() async {
    setState(()  {
      checkResult();

    });

      final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
      if(widget.number==7)  {
     int.parse(userAnswer) +int.parse(userAnswer1)==widget.number&& int.parse(userAnswer2) +int.parse(userAnswer3)==widget.number&&int.parse(userAnswer4) +int.parse(userAnswer5)==widget.number?
      await userCollection.doc(widget.childName).update({"Q21": "1"}):
      await userCollection.doc(widget.childName).update({"Q21": "0"});}
      if(widget.number==10){
     int.parse(userAnswer) +int.parse(userAnswer1)==widget.number&& int.parse(userAnswer2) +int.parse(userAnswer3)==widget.number&&int.parse(userAnswer4) +int.parse(userAnswer5)==widget.number?
      await userCollection.doc(widget.childName).update({"Q36": "1"}):
      await userCollection.doc(widget.childName).update({"Q36": "0"});}
      if(widget.number==18){
     int.parse(userAnswer) +int.parse(userAnswer1)==widget.number&& int.parse(userAnswer2) +int.parse(userAnswer3)==widget.number&&int.parse(userAnswer4) +int.parse(userAnswer5)==widget.number?
      await userCollection.doc(widget.childName).update({"Q46": "1"}):
      await userCollection.doc(widget.childName).update({"Q46": "0"});}


  }

  // check if user is correct or not
  void checkResult() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Next_Question'.tr,
            onTap:  navigate,
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
            message: 'Time out!',
            onTap:  navigate,
            icon: Icons.arrow_forward,
          );
        });

  }





  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 40), () {
      checkResult1();
    });
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 // CountdownPage1(path:  widget.number==7? Missing(childName: widget.childName,):widget.number==10? Points(childName: widget.childName, numberA: 15,) : PlusMinus(childName: widget.childName)),
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
                                .height * 0.03,),
                            Expanded(
                              flex: 4,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //     color: ColorManager.green,
                                //     width: 2,
                                //   ),
                                // ),
                                padding: EdgeInsets.all( MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.018,),

                                    Expanded(
                                      child: Text(
                                        'Together, the two dice show ${widget.number.toString()}. What could the numbers on the dice be?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.020, // Change font size
                                          fontFamily: 'YourFontName', // Change font family
                                          fontWeight: FontWeight.bold, // Change font weight
                                          fontStyle: FontStyle.normal, // Change font style
                                          color: ColorManager.white, // Change text color
                                        ),
                                      ),
                                    ),

                                    SizedBox(height:  MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.01,),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          Rows(userAnswer, userAnswer1),
                                          Rows(userAnswer2, userAnswer3),
                                          Rows(userAnswer4, userAnswer5),],
                                      ),
                                    )

                                    

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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                SizedBox(height: screenHeight*0.07,),

                                Expanded(
                                  child: Container(
                                   


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
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '1';
                                                }
                                                else {
                                                  userAnswer += '1';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '1';
                                                }
                                                else {
                                                  userAnswer1 += '1';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '1';
                                                }
                                                else {
                                                  userAnswer2 += '1';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '1';
                                                }
                                                else {
                                                  userAnswer3 += '1';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '1';
                                                }
                                                else {
                                                  userAnswer4 += '1';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '1';
                                                }
                                                else {
                                                  userAnswer5 += '1';
                                                }

                                              });
                                            }),
                                            KeypadButton('2', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '2';
                                                }
                                                else {
                                                  userAnswer += '2';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '2';
                                                }
                                                else {
                                                  userAnswer1 += '2';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '2';
                                                }
                                                else {
                                                  userAnswer2 += '2';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '2';
                                                }
                                                else {
                                                  userAnswer3 += '2';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '2';
                                                }
                                                else {
                                                  userAnswer4 += '2';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '2';
                                                }
                                                else {
                                                  userAnswer5 += '2';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                          children: [
                                            KeypadButton('3', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '3';
                                                }
                                                else {
                                                  userAnswer += '3';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '3';
                                                }
                                                else {
                                                  userAnswer1 += '3';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '3';
                                                }
                                                else {
                                                  userAnswer2 += '3';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '3';
                                                }
                                                else {
                                                  userAnswer3 += '3';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '3';
                                                }
                                                else {
                                                  userAnswer4 += '3';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '3';
                                                }
                                                else {
                                                  userAnswer5 += '3';
                                                }

                                              });
                                            }),
                                            KeypadButton('4', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '4';
                                                }
                                                else {
                                                  userAnswer += '4';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '4';
                                                }
                                                else {
                                                  userAnswer1 += '4';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '4';
                                                }
                                                else {
                                                  userAnswer2 += '4';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '4';
                                                }
                                                else {
                                                  userAnswer3 += '4';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '4';
                                                }
                                                else {
                                                  userAnswer4 += '4';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '4';
                                                }
                                                else {
                                                  userAnswer5 += '4';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('5', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '5';
                                                }
                                                else {
                                                  userAnswer += '5';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '5';
                                                }
                                                else {
                                                  userAnswer1 += '5';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '5';
                                                }
                                                else {
                                                  userAnswer2 += '5';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '5';
                                                }
                                                else {
                                                  userAnswer3 += '5';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '5';
                                                }
                                                else {
                                                  userAnswer4 += '5';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '5';
                                                }
                                                else {
                                                  userAnswer5 += '5';
                                                }

                                              });
                                            }),
                                            KeypadButton('6', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '6';
                                                }
                                                else {
                                                  userAnswer += '6';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '6';
                                                }
                                                else {
                                                  userAnswer1 += '6';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '6';
                                                }
                                                else {
                                                  userAnswer2 += '6';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '6';
                                                }
                                                else {
                                                  userAnswer3 += '6';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '6';
                                                }
                                                else {
                                                  userAnswer4 += '6';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '6';
                                                }
                                                else {
                                                  userAnswer5 += '6';
                                                }

                                              });
                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('7', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '7';
                                                }
                                                else {
                                                  userAnswer += '7';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '7';
                                                }
                                                else {
                                                  userAnswer1 += '7';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '7';
                                                }
                                                else {
                                                  userAnswer2 += '7';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '7';
                                                }
                                                else {
                                                  userAnswer3 += '7';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '7';
                                                }
                                                else {
                                                  userAnswer4 += '7';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '7';
                                                }
                                                else {
                                                  userAnswer5 += '7';
                                                }

                                              });
                                            }),
                                            KeypadButton('8', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '8';
                                                }
                                                else {
                                                  userAnswer += '8';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '8';
                                                }
                                                else {
                                                  userAnswer1 += '8';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '8';
                                                }
                                                else {
                                                  userAnswer2 += '8';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '8';
                                                }
                                                else {
                                                  userAnswer3 += '8';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '8';
                                                }
                                                else {
                                                  userAnswer4 += '8';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '8';
                                                }
                                                else {
                                                  userAnswer5 += '8';
                                                }

                                              });

                                            }),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            KeypadButton('9', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '9';
                                                }
                                                else {
                                                  userAnswer += '9';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '9';
                                                }
                                                else {
                                                  userAnswer1 += '9';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '9';
                                                }
                                                else {
                                                  userAnswer2 += '9';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '9';
                                                }
                                                else {
                                                  userAnswer3 += '9';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '9';
                                                }
                                                else {
                                                  userAnswer4 += '9';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '9';
                                                }
                                                else {
                                                  userAnswer5 += '9';
                                                }

                                              });

                                            }),
                                            KeypadButton('0', () {
                                              i==0? setState(() {
                                                if(userAnswer=='?'){
                                                  userAnswer = '0';
                                                }
                                                else {
                                                  userAnswer += '0';
                                                }

                                              }):i==1 ? setState(() {
                                                if(userAnswer1=='?'){
                                                  userAnswer1 = '0';
                                                }
                                                else {
                                                  userAnswer1 += '0';
                                                }

                                              }):i==2 ? setState(() {
                                                if(userAnswer2=='?'){
                                                  userAnswer2 = '0';
                                                }
                                                else {
                                                  userAnswer2 += '0';
                                                }

                                              }):i==3 ? setState(() {
                                                if(userAnswer3=='?'){
                                                  userAnswer3 = '0';
                                                }
                                                else {
                                                  userAnswer3 += '0';
                                                }

                                              }):i==4 ? setState(() {
                                                if(userAnswer4=='?'){
                                                  userAnswer4 = '0';
                                                }
                                                else {
                                                  userAnswer4 += '0';
                                                }

                                              }): setState(() {
                                                if(userAnswer5=='?'){
                                                  userAnswer5 = '0';
                                                }
                                                else {
                                                  userAnswer5 += '0';
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
                                                i==0? userAnswer='?':
                                                i==1? userAnswer1='?':
                                                i==2? userAnswer2='?':
                                                i==3? userAnswer3='?':
                                                i==4? userAnswer4='?':
                                                userAnswer5='?';
                                              });
                                            }


                                            ),
                                            ActionButton(Icons.check, ColorManager.lightGreen,onPressed: (){
                                              // if(controllerList[i].text.toString()!='' && i<=3){
                                              setState(() {

                                                i++;
                                                answer='?';
                                                if(i>=6){
                                                  buttonTapped();
                                                }

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

  Widget Rows(String m, String n){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stacks(m),
        Text(
          '+',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery
                .of(context)
                .size
                .width * 0.035,
            color: Colors.white,
          ),
        ),
        Stacks(n),
        Icon(Icons.arrow_right_alt_outlined, size: MediaQuery
            .of(context).size.width*0.09/1.5625, color: ColorManager.primary,),
        Text(
          "${widget.number}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery
                .of(context)
                .size
                .width * 0.028,
            color: ColorManager.white,
          ),
        ),

      ],
    );
  }

  Widget Stacks(String m){
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/dice4.png',
          height: MediaQuery
              .of(context).size.width*0.09,
          width: MediaQuery
              .of(context).size.width*0.09,

        ),
        Positioned(
          bottom: MediaQuery
              .of(context).size.width*0.087/1.875, // adjust this value to position the text as desired
          left: MediaQuery
        .of(context).size.width*0.088/2.272, // adjust this value to position the text as desired
          child: Text(
            m,
            style:  TextStyle(
              color: Colors.white,
              fontSize: MediaQuery
                  .of(context).size.width*0.087/4.1667,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
          final mediaQueryData = MediaQuery.of(context);


          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;

          return GestureDetector(
            onTap: onPressed,
            child: Container(
              // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.100,
              height: MediaQuery.of(context).size.width * 0.100,
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
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
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



