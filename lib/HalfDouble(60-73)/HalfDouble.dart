



import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/double%20(74-77),(89-92)/double.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';


import '../WelcomeUI.dart';
import '../count/Q4.dart';
import '../subtraction(56-59,83-88)/Subtract.dart';
import '../util/views/countdown-page.dart';
import '../util/views/countdown-page1.dart';






class HalfDouble extends StatefulWidget {

  final String childName;

  const HalfDouble({super.key,required this.childName});

  @override
  HalfDoubleState createState() => HalfDoubleState();
}

class HalfDoubleState extends State<HalfDouble> {



  String answer = '';
  Color _containerColor = ColorManager.button;
  bool check = true;

  int targetIndex = 0;
  Color targetColor = ColorManager.offWhite;
  Timer? _timer;

  int i = 0;
  int j=0;


  int numberA=3;
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

  void navigate(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>    DoubleAdditionSubtraction( childName: widget.childName, num: 30,)));
  }
  void startTimer() {
    // Cancel the existing timer if it's running
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(const Duration(seconds: 40), () {
      // This callback will be called every 40 seconds
      i<=5?checkResultMultiplyBy2T():checkResultDivideBy2T();
    });
  }

  Future<void> buttonTapped() async {


    if(i<=5) {
      setState(()  {


        checkResultMultiplyBy2();
      });
        final FirebaseAuth auth = FirebaseAuth.instance;
        final  currentUser = auth.currentUser;
        final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);

          i == 0 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q60": "1"})
              :
          i == 0 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q60": "0"})
              :

          i == 1 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q61": "1"})
              :
          i == 1 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q61": "0"})
              :
          i == 2 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q62": "1"})
              :
          i == 2 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q62": "0"})
              :
          i == 3 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q63": "1"})
              :
          i == 3 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q63": "0"})
              :
          i == 4 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q64": "1"})
              :
          i == 4 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q64": "0"})
              :
          i == 5 && userAnswer == (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q65": "1"})
              :
          i == 5 && userAnswer != (numberA *2).toString()
              ? await userCollection.doc(widget.childName).update({"Q65": "0"})
              :



          null;






    }
    else if (i>=6){
      setState(()  {

        checkResultDivideBy2();
      });

        final FirebaseAuth auth = FirebaseAuth.instance;
        final  currentUser = auth.currentUser;
        final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
        // print((userAnswer).toString());
        // print((numberA).toString());
        // print((numberA ~/2).toString());
        // print(i);
        i == 6 && userAnswer == (numberA ~/2).toString()
            ? await userCollection.doc(widget.childName).update({"Q66": "1"})
            :
        i == 6 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q66": "0"})
            :

        i == 7 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q67": "1"})
            :
        i == 7 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q67": "0"})
            :
        i == 8 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q68": "1"})
            :
        i == 8 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q68": "0"})
            :
        i == 9 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q69": "1"})
            :
        i == 9 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q69": "0"})
            :
        i == 10 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q70": "1"})
            :
        i == 10 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q70": "0"})
            :
        i == 11 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q71": "1"})
            :
        i == 11 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q71": "0"})
            :
        i == 12 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q72": "1"})
            :
        i == 12 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q72": "0"})
            :
 i == 13 && userAnswer == ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q73": "1"})
            :

        i == 13 && userAnswer != ((numberA ~/2)).toString()
            ? await userCollection.doc(widget.childName).update({"Q73": "0"})
            :



        null;








    }
  }
  // check if user is correct or not
  void checkResultMultiplyBy2() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Next_Question'.tr,
            onTap: goToNextQuestionMultiply,
            icon: Icons.arrow_forward,
          );
        });



  }
  void checkResultDivideBy2() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Next_Question'.tr,
            onTap: i==13 ? navigate : goToNextQuestionDivide,
            icon: Icons.arrow_forward,
          );
        });



  }
  void checkResultMultiplyBy2T() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Time_out!'.tr,
            onTap: goToNextQuestionMultiply,
            icon: Icons.arrow_forward,
          );
        });



  }void checkResultDivideBy2T() {


    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Time_out!'.tr,
            onTap: i==13 ? navigate : goToNextQuestionDivide,
            icon: Icons.arrow_forward,
          );
        });



  }

  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestionMultiply() {

    // dismiss alert dialog

    setState(() {
      startTimer();
      userAnswer='?';
      i++;
    });
    Navigator.of(context).pop();

    // reset values
    // create a new question
    numberA = randomNumber.nextInt(42)+3;
    while(numberA%2!=0) {
      numberA = randomNumber.nextInt(70)+8;
    }


  }
  void goToNextQuestionDivide() {

    // dismiss alert dialog

    setState(() {
      startTimer();

      userAnswer='?';
      i++;
    });
    Navigator.of(context).pop();

    // reset values
    // create a new question
    numberA = randomNumber.nextInt(70)+8;
    while(numberA%2!=0) {
      numberA = randomNumber.nextInt(70)+8;
    }

  }






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
                                 // CountdownPage1(path: DoubleAdditionSubtraction( childName: widget.childName, num: 30,),),
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
                                        .height * 0.04),

                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Expanded(
                                            child: Text(
                                              i<=5 ?  "What is the double of $numberA?":  "What is the half of $numberA?" ,
                                              textAlign: TextAlign.center,
                                              style:GoogleFonts.montserrat(textStyle: TextStyle(
                                                fontSize:  MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.026, // Change font size
                                                // Change font family
                                                fontWeight: FontWeight.bold, // Change font weight
                                                fontStyle: FontStyle.normal, // Change font style
                                                color: Colors.white, // Change text color
                                              ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    SizedBox(height:  MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.04,),
                              Expanded(child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: screenWidth*0.02,),
                                        // question
                                        Text(
                                          i <=5  ?  (numberA).toString() + '   *  '+ ' 2  ' + ' =  '  :  (numberA).toString() + '  / '  + ' 2  ' + ' =  ',
                                          style:  GoogleFonts.montserrat(textStyle: TextStyle(
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
              width: MediaQuery.of(context).size.width * 0.098,
              height: MediaQuery.of(context).size.width * 0.090,
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
                        .width * 0.023, // Change font size
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



