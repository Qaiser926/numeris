


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeris/Dice(21,36,46)/Dice.dart';
import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';
import 'package:numeris/util/views/countdown-page.dart';
import '../../util/result_message.dart';
import '../WelcomeUI.dart';
import '../count/Q4.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Q20 extends StatefulWidget {
  final String childName;
  const Q20({super.key,required this.childName});

  @override
  Q20State createState() => Q20State();
}

class Q20State extends State<Q20> {

  List<String> containerItems = ["53","91","3","35","80"];
  List<String> targetItems = ['','','','',''];
  String answer = '';
  int targetIndex = 0;
  Color targetColor = ColorManager.offWhite;
  List<int> order=[];
  // final audioPlayer = AudioPlayer();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
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



  // Future<void> startPlaying() async {
  //   await audioPlayer.play(DeviceFileSource("https://elements.envato.com/button-press-44332-678E2AA?utm_source=mixkit&utm_medium=referral&utm_campaign=elements_mixkit_cs_sfx_search_no_results&_ga=2.114012485.315717966.1679429102-528168894.1679429102"));
  //   await audioPlayer.setVolume(1.0);
  //
  // }



  // create random numbers
  // var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestion() {
    // dismiss alert dialog

    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   Dice(number: 7,childName: widget.childName
      )),
    );



  }

// GO BACK TO QUESTION


  Future<void> checkResult() async {
    bool success = true;
    setState(()  {


      for (int i = 0; i < targetItems.length - 1; i++) {
        if (order[i].compareTo(order[i + 1]) > 0) {
          success = false;
          break;
        }
      }
      next();




    });


    final FirebaseAuth auth = FirebaseAuth.instance;
      final  currentUser = auth.currentUser;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
      success==true? await userCollection.doc(widget.childName).update({"Q20": "1"}):
      await userCollection.doc(widget.childName).update({"Q20": "0"});




  }

  void next(){
    {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return ResultMessage(
               // text-to-speech
              onClick: () async {
                final isSave = box.read("isCheck");
                if (isSave) {
                  await flutterTts.speak("Next_Question!".tr);
                } else {
                  await flutterTts.setSilence(1);
                }
              },
              message: 'Next_Question!'.tr,
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          final mediaQueryData = MediaQuery.of(context);

          final screenWidth = mediaQueryData.size.width;

          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;

          return SafeArea(
            child: Stack(
              children: [
                const BackgroundImage(imagePath: 'assets/background.jpg',),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: ColorManager.LightRed,
                          //     width: 2,
                          //   ),
                          // ),
                            child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    SizedBox(height:MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.06 ,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:  [
                                        SizedBox(width:MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.028 ,),

                                        CountdownPage(path: Dice(number: 7,childName: widget.childName
                                        ),),

                                      ],
                                    ),
                                  ]
                              ),
                            )

                        ),
                      ),
                      SizedBox(width: screenWidth*0.036,),

                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.84,
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: ColorManager.LightRed,
                          //     width: 2,
                          //   ),
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // SizedBox(height: MediaQuery
                              //     .of(context)
                              //     .size
                              //     .height * 0.12,),

                              // SizedBox(height: screenHeight*0.1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: targetItems
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  String item = entry.value;
                                  return DragTarget<String>(
                                    builder: (context, acceptedItems,
                                        rejectedItems) =>
                                        Container(
                                          // margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.01),
                                          // margin: EdgeInsets.all(MediaQuery
                                          //     .of(context)
                                          //     .size
                                          //     .width * 0.0030*scaleFactor),
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.1119,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.1119,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: targetIndex - 1 >= index
                                                  ? ColorManager.lightBlue
                                                  : ColorManager.button,
                                              // Change border color based on index
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width *
                                                  0.02, // Change border width
                                            ),
                                            color: targetIndex - 1 >= index
                                                ? ColorManager.lightBlue
                                                : ColorManager.button,
                                            // Change container color based on index
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.02),
                                          ),

                                          child: Center(
                                            child: Text(
                                              item,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.042,
                                                // Change font size
                                                fontFamily: 'YourFontName',
                                                // Change font family
                                                fontWeight: FontWeight.bold,
                                                // Change font weight
                                                fontStyle: FontStyle.normal,
                                                // Change font style
                                                color: targetIndex - 1 >= index
                                                    ? Colors.white
                                                    : Colors.white10
                                                , // Change text color based on index
                                              ),
                                            ),
                                          ),
                                        ),
                                    onWillAccept: (item) => targetIndex == index,
                                    onAccept: (item)   async {

                                      setState(() {
                                        targetItems[index] = item;
                                        targetIndex = (targetIndex + 1);
                                        containerItems.remove(item);
                                        order.add(int.parse(item));
                                      });


                                      if(targetIndex==targetItems.length){
                                        checkResult();

                                      }
// ""                                    await audioPlayer.setSourceUrl("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
// "// "                                   //  AssetsAudioPlayer.newPlayer().open(
//                                    //    Audio("assets/yt5s.io - app button click sound (128 kbps).mp3"),
//                                    //    autoStart: true,
//                                    //    showNotification: true,
// //                                    //  );
//                                    await audioPlayer.play(DeviceFileSource("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"));
//                                     await audioPlayer.setVolume(1);


                                    },
                                    onLeave: (item) {},
                                    // onAcceptWithDetails:(){},
                                  );
                                }).toList(),
                              ),

                              // SizedBox(height: MediaQuery
                              //     .of(context)
                              //     .size
                              //     .height * 0.019),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: containerItems
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  String item = entry.value;
                                  return Draggable<String>(
                                    data: item,
                                    feedback:Container(
                                      margin: index == 1 || index == 3
                                          ? EdgeInsets.only(top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.1 * scaleFactor)
                                          : EdgeInsets.all(MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorManager.lightBlue,
                                          // Change border color
                                          // Change border width
                                        ),
                                        color: ColorManager.lightBlue,
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.02),
                                        // Add padding to second and fourth items

                                      ),
                                      child: Center(
                                        child: DefaultTextStyle(
                                          style:  TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.042,
                                            // Change font size
                                            fontFamily: 'YourFontName',
                                            // Change font family
                                            fontWeight: FontWeight.bold,
                                            // Change font weight
                                            fontStyle: FontStyle.normal,
                                            // Change font style
                                            color: ColorManager
                                                .white, // Change text color
                                          ),
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize:  MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.042,
                                              // Change font size
                                              fontFamily: 'YourFontName',
                                              // Change font family
                                              fontWeight: FontWeight.bold,
                                              // Change font weight
                                              fontStyle: FontStyle.normal,
                                              // Change font style
                                              color: ColorManager
                                                  .white, // Change text color
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    childWhenDragging: Container(
                                      margin:

                                      EdgeInsets.all(MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      color: Colors.transparent,
                                      child: const Center(
                                        child: Text(
                                          "",
                                          // style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      margin: index == 1 || index == 3
                                          ? EdgeInsets.only(top: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.1 * scaleFactor)
                                          : EdgeInsets.all(MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.115,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorManager.lightBlue,
                                          // Change border color
                                          // Change border width
                                        ),
                                        color: ColorManager.lightBlue,
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.02),
                                        // Add padding to second and fourth items

                                      ),
                                      child: Center(
                                        child: DefaultTextStyle(
                                          style:TextStyle(
                                            fontSize:  MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.042,
                                            // Change font size
                                            fontFamily: 'YourFontName',
                                            // Change font family
                                            fontWeight: FontWeight.bold,
                                            // Change font weight
                                            fontStyle: FontStyle.normal,
                                            // Change font style
                                            color: ColorManager
                                                .white, // Change text color
                                          ),
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                              fontSize:  MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.042,
                                              // Change font size
                                              fontFamily: 'YourFontName',
                                              // Change font family
                                              fontWeight: FontWeight.bold,
                                              // Change font weight
                                              fontStyle: FontStyle.normal,
                                              // Change font style
                                              color: ColorManager
                                                  .white, // Change text color
                                            ),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize:  MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.042,
                                                // Change font size
                                                fontFamily: 'YourFontName',
                                                // Change font family
                                                fontWeight: FontWeight.bold,
                                                // Change font weight
                                                fontStyle: FontStyle.normal,
                                                // Change font style
                                                color: ColorManager
                                                    .white, // Change text color
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth*0.054,),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.start  ,
                          children: [
                            SizedBox(
                              height: mediaQueryData.size.height*0.02,
                            ),
                            ActionButton(Icons.close_outlined, ColorManager.LightRed, onPressed:() async {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Back(imagePath: 'assets/back.json', path: Welcome(),)),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  const ActionButton(this.icon, this.color, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          final double scaleFactor = MediaQuery
              .of(context)
              .devicePixelRatio;

          return Container(
            // margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.009*scaleFactor,right:MediaQuery.of(context).size.width * 0.009*scaleFactor,),

            width: MediaQuery.of(context).size.width * 0.065,
            height: MediaQuery.of(context).size.width * 0.065,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red.shade500 , // Change border color
                width: 3, // Change border width
              ),
              borderRadius: BorderRadius.circular( MediaQuery.of(context).size.width * 0.029),
              color: color,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(icon, color: Colors.white,size: MediaQuery.of(context).size.width * 0.035),
                onPressed: onPressed,
              ),
            ),
          );
        }
    );}
}