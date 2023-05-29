


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeris/WelcomeUI.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/splash/splashscreen.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';
import 'package:numeris/util/name_message.dart';
import 'package:numeris/util/result_message.dart';
import 'package:share_plus/share_plus.dart';



class Report2 extends StatefulWidget {
  final String childName;

  const Report2({super.key, required this.childName});

  @override
  Report2State createState() => Report2State();
}

class Report2State extends State<Report2> {

  String dropdownValue = 'Option 1';
  int i = 0;
  late String _email,_password;
  String hint="mail@gmail.com";
  final TextEditingController _emailController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text="Thank you for completing the Diagnostic. Below is a list of exercises that will help you improve in areas where you need a bit of help.\n\nExercises:";
    data();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)
      {

        final double scaleFactor = MediaQuery
            .of(context)
            .devicePixelRatio;
        final double screenHeight= MediaQuery
            .of(context)
            .size
            .height;
        final  double screenWidth= MediaQuery
            .of(context)
            .size
            .width;

        return SafeArea(
          child: Stack(
            children: [
              const BackgroundImage(imagePath: "assets/countingBackground.png",),
              Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          SizedBox(height: screenHeight*0.010,),
                          Row(
                            children: [
                              SizedBox(width: screenWidth*0.002,),

                              Expanded(
                                child: IconButton(
                                  onPressed: () { Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   const Back(imagePath: 'assets/back.json', path: Welcome(),))); },
                                  icon:  Icon(Icons.home
                                    , size: screenWidth*0.065,color: Colors.greenAccent.shade700,),
                                ),
                              ),
                              const Expanded(
                                  flex:3, child: SizedBox())
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.93,
                        // // width: 900,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: ColorManager.LightRed,
                        //     width: 2,
                        //   ),
                        // ),
                        padding: EdgeInsets.all(MediaQuery
                            .of(context)
                            .size
                            .height * 0.014*scaleFactor),
                        child: Expanded(

                            child: Column(
                                children:[
                                  SizedBox(height: screenHeight*0.04,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [


                                      Padding(
                                        padding: const EdgeInsets.only(left: 30.0),
                                        child: SizedBox(
                                          width:screenWidth*0.18 ,
                                          height: screenHeight*0.128,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              padding: EdgeInsets.zero, // remove padding
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10), // set border radius
                                                side: BorderSide(color: ColorManager.blue,width: 3), // set border width and color
                                              ),
                                            ),
                                            onPressed: () {
                                              // button action
                                            },
                                            child: Center(child: Text(widget.childName.substring(0, 1).toUpperCase() + widget.childName.substring(1),textAlign: TextAlign.center,style: TextStyle(
                                              fontSize: screenWidth*0.016,
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.white,
                                            ),)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth*0.01,),
                                      Padding(
                                        padding: const EdgeInsets.only(right:10,top: 5),
                                        child: SizedBox(
                                          width:screenWidth*0.13 ,
                                          height: screenHeight*0.160,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent, // set background color to transparent// set border color
                                              padding: EdgeInsets.zero, // remove padding
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15), // set border radius
                                                side: BorderSide(color: ColorManager.o,width: 3), // set border width and color
                                              ),
                                            ),
                                            onPressed: () {
                                              Share.share(_emailController.text);
                                            },
                                            child: Center(child: Text('Share',textAlign: TextAlign.center,style: TextStyle(
                                                fontSize: screenWidth*0.017,
                                                fontWeight: FontWeight.bold,
                                                color: ColorManager.white
                                            ),
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],

                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: screenWidth*0.03,),
                                      Text("Report",
                                        style: TextStyle(
                                            fontSize: screenWidth*0.027,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     color: ColorManager.LightRed,
                                      //     width: 2,
                                      //   ),
                                      // ),
                                      child: Padding(
                                        // padding: const EdgeInsets.all(16.0),
                                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorManager.white,
                                              width: 3,
                                            ),
                                          ),
                                          height: screenHeight*0.6,

                                          child:  field(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.07,)

                                ]
                            )),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [


                        ],
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

  Future data() async {

// fetch data from Firestore
    final FirebaseAuth auth = FirebaseAuth.instance;
    final  currentUser = auth.currentUser;

    String collectionName = currentUser!.email!;
    String documentName = widget.childName;

    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentName)
        .get();

// get Q1 to Q92 values
    Map<String, dynamic> docData = docSnapshot.data() as Map<String, dynamic>;
    List<String> qValues = [];
    int count=0;
    int counter=0;
    int j=0;
    for (int i = 1; i <= 92; i++) {
      String key = 'Q$i';
      String value = docData[key]?.toString() ?? '0';
      if (value == "0" || value == "") {
        j++;
        qValues.add(key);
      }
      if (value == "1") {
        count++;
      }
      if (value == "") {
        counter++;
      }
    }

    String existingText = _emailController.text;
    String newText = existingText;
    Set<String> itemsAdded = Set<String>();

    if (qValues.contains('Q1') && qValues.contains('Q2')) {
      String existingText = _emailController.text;

      // Add new items to a temporary list
      List<String> newItems = ["-Counting tiles", "-Ordering numbers"];

      // Check if each new item has already been added, and only add it if it hasn't
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }

      // Set the new text to the controller
      _emailController.text = newText;
    }

    if (qValues.contains('Q3') || qValues.contains('Q4') ||
        qValues.contains('Q5') || qValues.contains('Q6')) {
      // Same process as above
      List<String> newItems = ["-Regularity of the tens system", "-Neighbouring numbers"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
      _emailController.text = newText;
    }

    if (qValues.contains('Q7') || qValues.contains('Q8') ||
        qValues.contains('Q9') || qValues.contains('Q10') ||
        qValues.contains('Q11') || qValues.contains('Q12') ||
        qValues.contains('Q13') || qValues.contains('Q14')) {
      // Same process as above
      List<String> newItems = ["-Neighbouring numbers", "-Finding neighbouring numbers"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q15') || qValues.contains('Q16') ||
        qValues.contains('Q17') || qValues.contains('Q18')) {
      // Same process as above
      List<String> newItems = ["-Counting in steps of two on the 20-Field", "-Counting cubes in two steps", "-Understanding number sequences in the Hundred-Table", "-Counting in steps on the Hundred-Table"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q19')) {
      // Same process as above
      List<String> newItems = ["-Arranging number cards up to 20", "-Ordering numbers"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q20')) {
      // Same process as above
      List<String> newItems = ["-Arrange selected number cards up to 100", "-Ordering numbers"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q21')) {


      List<String> newItems = ["-Decompositions 2 to 9", "-Number decomposition up to 12", "-Conscious and quick seeing", "-Number representation up to 10 - conscious seeing"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q22') || qValues.contains('Q23') ||
        qValues.contains('Q24') || qValues.contains('Q25') ||
        qValues.contains('Q26') || qValues.contains('Q27')) {

      List<String> newItems = ["-All decompositions of 10 Number representation up to 10 - conscious seeing"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q28') || qValues.contains('Q29') ||
        qValues.contains('Q30') || qValues.contains('Q31')) {
      List<String> newItems = ["-Conscious and quick seeing'"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q32') || qValues.contains('Q33') ||
        qValues.contains('Q34') || qValues.contains('Q35')) {

      List<String> newItems = ["-Number decomposition on the 20-Field","-Drawing the 20-Field from memory","-Seeing quickly on the 20-Field","-Decompositions 2 to 9'"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }
    if (qValues.contains('Q36')) {
      List<String> newItems = ["-Bundle up to 100","-Listening to and writing numbers up to 100","-Power of 10 (game: Ten-one quiz)","-Writing numbers on the hundreds chart"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q37')) {
      List<String> newItems = ["-Number representation with multi-system blocks (2)","-Listening to and writing numbers up to 100","-Writing numbers on the hundreds chart","-Power of 10 (game: Ten-one quiz)"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q38')) {

      List<String> newItems = ["-Listening to and writing numbers up to 100","-Power of 10 (game: Ten-one quiz)","-Writing numbers on the hundreds chart"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }


    if (qValues.contains('Q39') || qValues.contains('Q40') ||
        qValues.contains('Q41') || qValues.contains('Q42')) {

      List<String> newItems = ["-How many in the hundred-point field?","-Adding up to 100 - decomposing 100"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q43') || qValues.contains('Q44') ||
        qValues.contains('Q45')) {

      List<String> newItems = ["-Understanding number sequences in the Hundred-Table","-Counting in steps on the Hundred-Table"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q46')) {

      List<String> newItems = ["-1 or 2 more/less (folding fingers)","-More/less (Game: Hoarding)","-1 or 2 more/less (Game: Dice)"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q47') || qValues.contains('Q48') ||
        qValues.contains('Q49') || qValues.contains('Q50') ||
        qValues.contains('Q51')) {

      List<String> newItems = ["-Finger flash game","-First arithmetic (folding fingers)","-Swapping problems on the 20-Field","-Calculating with tens (10 + 3 and 10 - 7)"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q52') || qValues.contains('Q53') ||
        qValues.contains('Q54') || qValues.contains('Q55')) {

      List<String> newItems = ["-Calculating with tens (10 + 3 and 10 - 7)"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q56') || qValues.contains('Q57') ||
        qValues.contains('Q58') || qValues.contains('Q59')) {

      List<String> newItems = ["-Calculating with tens up to 100 (30 + 7 and 80 - 3)"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q60') || qValues.contains('Q61') ||
        qValues.contains('Q62')) {

      List<String> newItems = ["-Doubling with the mirror","-Doubling with the fingers","-Doubling with the slide rule"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q63') || qValues.contains('Q64') ||
        qValues.contains('Q65') || qValues.contains('Q66')) {

      List<String> newItems = ["-Doubling with tens","-Doubling two-digit numbers up to 100"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q67') || qValues.contains('Q68') ||
        qValues.contains('Q69')) {

      List<String> newItems = ["-Halving to 20","-Halving on the arithmetic line","-Even and odd numbers"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }
    if (qValues.contains('Q70') || qValues.contains('Q71') ||
        qValues.contains('Q72') || qValues.contains('Q73')) {

      List<String> newItems = ["-Halving numbers of ten","-Halving two-digit numbers ending in 0","-Counting in tens from an odd number","-Halving on the arithmetic line"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q74') || qValues.contains('Q75') ||
        qValues.contains('Q76')) {

      List<String> newItems = ["-Dividing a number in half","-Halving up to 20"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q77') || qValues.contains('Q78') ||
        qValues.contains('Q79')) {

      List<String> newItems = ["-Finding the pairs of numbers that add up to 10","-Using fingers to count down"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q80') || qValues.contains('Q81') ||
        qValues.contains('Q82')) {

      List<String> newItems = ["-Making 10 using a finger pattern"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q83') || qValues.contains('Q84') ||
        qValues.contains('Q85')) {

      List<String> newItems = ["-Addition and subtraction to/from numbers to 20","-Finding missing numbers in a row","-Finding missing numbers in a grid"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q86') || qValues.contains('Q87') ||
        qValues.contains('Q88') || qValues.contains('Q89')) {

      List<String> newItems = ["-Addition and subtraction to/from numbers up to 100","-Addition and subtraction with trading","-Addition and subtraction with tens","-Addition and subtraction with hundreds"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q90')) {

      List<String> newItems = ["-Addition and subtraction on the 100-Table"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q91')) {

      List<String> newItems = ["-Multiplication with the mirror","-Multiplication using fingers","-Arrays as help with multiplication"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    if (qValues.contains('Q92')) {

      List<String> newItems = ["-Multiplication using the slide rule","-Multiplication with the 100-Table'"];
      for (String item in newItems) {
        if (!itemsAdded.contains(item)) {
          itemsAdded.add(item);
          newText += "\n$item";
        }
      }
    }

    _emailController.text = newText;

    newText +="\n\n Correct Answers: $count" ;

    _emailController.text = newText;

    newText +="\n\n Incorrect Answers: $j" ;

    _emailController.text = newText;

    newText +="\n\n Questions not attempted on time: $counter" ;

    _emailController.text = newText;

    newText +="\n\n Marks: $count/92" ;

    _emailController.text = newText;

    newText +="\n\nask_you_parents_or_your_teacher_to_checkk_the_website".tr ;

    _emailController.text = newText;




  }

  Widget field(){

    return SingleChildScrollView(

        child: Scrollbar(
          controller: _scrollController,
          scrollbarOrientation: ScrollbarOrientation.right,
          hoverThickness: 30,
          thickness: 30,


          isAlwaysShown: true,
          child: TextFormField(
            scrollController: _scrollController,
            autofocus: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 100,


            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.bottom,
            onTap: (){



            },
            readOnly: true,
            controller: _emailController,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .width*0.015,
            ),
            decoration: InputDecoration(
              filled:true,
              fillColor:Colors.black12,
              hintStyle: TextStyle(
                color: ColorManager.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width*0.015,
              ),
              hintText: 'Placeholder Text',

              // enabledBorder:OutlineInputBorder(
              //   borderSide: BorderSide(
              //     width: 3,
              //     color: ColorManager.white,
              //   ),
              // ),
              //
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //       width: 3,
              //       color: ColorManager.black
              //
              //   ),
              // ),
            ),

          ),
        ));
  }



}
