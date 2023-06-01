


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/Dice(21,36,46)/Dice.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';

import 'package:numeris/util/result_message.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../WelcomeUI.dart';


import '../count/Q3.dart';
import '../util/background-image1.dart';
import '../util/views/countdown-page.dart';






class Q45 extends StatefulWidget {
  final String childName;
  const Q45({super.key,
    required this.childName});

  @override
  Q45State createState() => Q45State();
}

class Q45State extends State<Q45> {

  int i = 1;

  String answer = '';

  List<TextEditingController> controllerList= [TextEditingController(),TextEditingController()];
  List<TextEditingController> controllerList1= [];
  List<Color> colorlist=[ColorManager.orange,ColorManager.LightRed,ColorManager.lightBlue,ColorManager.lightGreen, ColorManager.LightRed];


  List order=[42];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerList[0].text=',42';
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
  void buttonTapped() {
    bool success = true;
    setState(()   async {


      if (order.length < 5) {
        success = false;
      } else {
        for (int i = 0; i < 4; i++) {
          if (order[i] != 42-(10*i)) {
            success = false;
            break;
          }
        }

      }
      final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
      success==true? await userCollection.doc(widget.childName).update({"Q45": "1"}):
      await userCollection.doc(widget.childName).update({"Q45": "0"});

      checkResult();


    });
  }


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
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        });



  }



  void goToNextQuestion() {
    // dismiss alert dialog

    // Navigator.of(context).pop();

    // reset values
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Dice(childName: widget.childName, number: 18,)));
    // create a new question

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
              const BackgroundImage1(imagePath: "assets/new3.jpg",),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.0025),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenWidth*0.009,),
                            Row(
                              children: [
                                SizedBox(width: screenWidth*0.042,),
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          CountdownPage(path: Dice(childName: widget.childName, number: 18,),),
                          SizedBox(height: screenHeight*0.6,)

                        ],
                      ),
                    ),
                    // SizedBox(width:MediaQuery
                    //     .of(context)
                    //         .size.width*0.05),
                    Expanded(
                      flex: 3,
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
                                padding: EdgeInsets.all( MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    GestureDetector(
                                        // text-to-speech
            onTap:  () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Count_backwards_in_steps_of_10_from_the_number_42".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
                                      child: Text(
                                        "Count_backwards_in_steps_of_10_from_the_number_42".tr,
                                        textAlign: TextAlign.center,
                                        style:
                                        GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.018, // Change font size
                                            fontFamily: 'YourFontName', // Change font family
                                            fontWeight: FontWeight.bold, // Change font weight
                                            fontStyle: FontStyle.normal, // Change font style
                                            color: ColorManager.white, // Change text color
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height:  MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02,),
                                    Expanded(
                                      child: ListView.builder(
                                        reverse: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controllerList.length ,
                                        itemBuilder: (BuildContext context, int index) {
                                          return getTextField(index);

                                        },
                                      ),
                                    ),

                                    Expanded(
                                      child: ListView.builder(
                                        reverse: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controllerList1.length ,
                                        itemBuilder: (BuildContext context, int index) {
                                          return getTextField1(index);

                                        },
                                      ),
                                    ),

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
                    ), Expanded(
                      flex: 2,
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: ColorManager.LightRed,
                        //     width: 2,
                        //   ),
                        // ),
                          child: Row(
                              children: [
                              const Expanded(child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                              const Expanded(child: SizedBox()),

                      Expanded(
                        flex: 12,
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
                                      setState(() {
                                        answer += '1';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                    KeypadButton('2', () {
                                      setState(() {
                                        answer += '2';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children: [
                                    KeypadButton('3', () {
                                      setState(() {
                                        answer += '3';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                    KeypadButton('4', () {
                                      setState(() {
                                        answer += '4';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    KeypadButton('5', () {
                                      setState(() {
                                        answer += '5';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                    KeypadButton('6', () {
                                      setState(() {
                                        answer += '6';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    KeypadButton('7', () {
                                      setState(() {
                                        answer += '7';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                    KeypadButton('8', () {
                                      setState(() {
                                        answer += '8';
                                        if(i<=3){ controllerList[i].text =','+answer;}
                                        else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    KeypadButton('9', () {
                                      setState(() {
                                        answer += '9';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
                                      });
                                    }),
                                    KeypadButton('0', () {
                                      setState(() {
                                        answer += '0';
                                        if(i<=3){ controllerList[i].text =','+answer;} else if(i>=4){controllerList1[i-4].text =','+answer;}
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
                                      if(i<=3) {
                                        controllerList[i].text = "";
                                        answer='';
                                      }



                                      if(i>=4) {
                                        controllerList1[i - 4].text = "";
                                        answer='';
                                      }


                                    }),
                                    ActionButton(Icons.check, ColorManager.lightGreen,onPressed: (){
                                      // if(controllerList[i].text.toString()!='' && i<=3){
                                      i<=3? order.add(int.parse(controllerList[i].text.replaceAll(',',''))):  order.add(int.parse(controllerList1[i-4].text.replaceAll(',','')));
                                      setState(() {
                                        i=i+1;
                                        generateTextField();
                                        generateTextField1();

                                      });
                                      // }


                                      if(i>=5){
                                        buttonTapped();
                                      }

                                    }),

                                  ],
                                ),

                            ],
                          ),
                        ),
                      ),
                                const Expanded(child: SizedBox()),
                              ],
                          ),
                      ),
                                Expanded(child: SizedBox()),
                              ],
                          ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        );
      },
    );

  }
  void generateTextField() {


    answer='';
    if(i<=3) {
      TextEditingController controller= TextEditingController();
      controllerList.add(controller);
    }

  }
  void generateTextField1() {

    answer = '';
    if (i >= 4  && i<5) {
      TextEditingController controller = TextEditingController();
      controllerList1.add(controller);

    }
  }
  Widget getTextField(int index) {

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;


          return Padding(
            padding: EdgeInsets.only(
                right: MediaQuery
                    .of(context)
                    .size
                    .width * 0.02,
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.05),
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.06,
              child: TextField(
                style:   GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: MediaQuery
                      .of(context)
                      .size
                      .width * 0.023, color: colorlist[index], fontWeight: FontWeight.bold),),
                controller:  controllerList[index],
                readOnly: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.digitsOnly
                // ],
                decoration: InputDecoration(
                  focusColor: ColorManager.LightRed,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: colorlist[index],
                      )),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: const Color(0xffF02E65),
                    ),

                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    answer = value;
                  });
                },
              ),
            ),
          );
        }
    );
  }
  Widget getTextField1(int index) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;


          return Padding(
            padding: EdgeInsets.only(
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02,
            ),
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.06,
              child: TextField(
                style:   GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: MediaQuery
                      .of(context)
                      .size
                      .width * 0.023, color: colorlist[index], fontWeight: FontWeight.bold),),
                controller:  controllerList1[index],
                readOnly: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.digitsOnly
                // ],
                decoration: InputDecoration(
                  focusColor: ColorManager.LightRed,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: colorlist[index],
                      )),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: const Color(0xffF02E65),
                    ),

                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    answer = value;
                  });
                },
              ),
            ),
          );
        }
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

              width: MediaQuery.of(context).size.width * 0.050,
              height: MediaQuery.of(context).size.width * 0.050,
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
                  icon: Center(child: Icon(icon, color: Colors.white,size: MediaQuery.of(context).size.width * 0.027)),
                  onPressed: onPressed,
                ),
              ),
            ),
          );
        }
    );}
}