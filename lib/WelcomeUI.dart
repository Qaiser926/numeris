
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_tts/flutter_tts_web.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numeris/authenticate/login.dart';
import 'package:numeris/circle(1-2,%2028-35)/circles.dart';
import 'package:numeris/report/report.dart';

import 'package:numeris/splash/back.dart';
import 'package:numeris/util/background-image.dart';
import 'package:numeris/util/color_manager.dart';
import 'package:numeris/util/name_message.dart';
import 'package:numeris/util/result_message.dart';
import 'package:numeris/util/utilis.dart';

import '../WelcomeUI.dart';
import 'Test/test2.dart';
import 'lagnuage/languageChange/langChanger.dart';

import 'dart:async';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
   bool _isChecked = true;
  String _currText = '';

  List<String> text = ["Text-to-Speech"];

  String dropdownValue = 'Select';
  final FirebaseAuth auth = FirebaseAuth.instance;
  String childName = "";
  int i = 0;
  late String _email, _password;
  String hint = "mail@gmail.com";
  final TextEditingController _emailController = TextEditingController();
  List<String> _dropdownItems = ['Select'];
  final Map<String, dynamic> docData = {
    'Q1': '',
    'Q2': '',
    ...List.generate(90, (index) => index + 3)
        .fold<Map<String, String>>({}, (map, i) => map..['Q$i'] = ''),
  };

// Function to update the items list with the new value entered by the user
  void _updateDropdownItems(String newValue) {
    if (!_dropdownItems.contains(newValue)) {
      // Add the new value to the list
      _dropdownItems.add(newValue);
      // Set the dropdown value to the new value
      dropdownValue = newValue;
      // Update the state to rebuild the UI
      setState(() {});
    }
  }

  Future<void> getDocuments() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final querySnapshot = await FirebaseFirestore.instance
        .collection(currentUser!.email!)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _dropdownItems.add(doc.id);
        });
      }
    });
  }

  String? lng;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lng = TranslationPage().getCurrentLang();
    getDocuments();
    initTts();
  }

  late FlutterTts flutterTts;

  TtsState ttsState = TtsState.stopped;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });
    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

final box = GetStorage();
var checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double scaleFactor = MediaQuery.of(context).devicePixelRatio;
        final double screenHeight = MediaQuery.of(context).size.height;
        final double screenWidth = MediaQuery.of(context).size.width;

        return SafeArea(
          child: Stack(
            children: [
              const BackgroundImage(
                imagePath: "assets/countingBackground.png",
              ),
              Scaffold(
                resizeToAvoidBottomInset: false,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.004,
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      auth.signOut().then(
                                          (value) => Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Back(
                                                          imagePath:
                                                              'assets/back.json',
                                                          path: LoginPage(),
                                                        )),
                                              ));
                                    },
                                    icon: Icon(
                                      Icons.logout,
                                      size: screenWidth * 0.05,
                                      color: ColorManager.r,
                                    ),
                                  ),
                                ),
                                const Expanded(flex: 3, child: SizedBox())
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.93,
                        // // width: 900,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: ColorManager.LightRed,
                        //     width: 2,
                        //   ),
                        // ),
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height *
                                0.014 *
                                scaleFactor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //     color: ColorManager.LightRed,
                                  //     width: 2,
                                  //   ),
                                  // ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: screenHeight * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0.0),
                                          child: Icon(
                                            Icons.account_circle_rounded,
                                            size: screenWidth * 0.048,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.004,
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            height: screenHeight * 0.079,
                                            width: screenWidth * 0.184,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Colors
                                                      .transparent, // set background color to transparent
                                                  primary: ColorManager
                                                      .o, // set border color// remove padding
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6), // set border radius
                                                    side: BorderSide(
                                                        color: ColorManager.o,
                                                        width:
                                                            2), // set border width and color
                                                  ),
                                                ),
                                                //  child:Text("profie"),
                                                child: Text(
                                                  auth.currentUser!.email!
                                                      .split('@')[0]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.014,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            // height: screenHeight * 0.049,
                                            width: screenWidth * 0.184,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Colors
                                                      .transparent, // set background color to transparent
                                                  primary: ColorManager
                                                      .o, // set border color// remove padding
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6), // set border radius
                                                    side: BorderSide(
                                                        color: ColorManager.o,
                                                        width:
                                                            2), // set border width and color
                                                  ),
                                                ),
                                                child: InkWell(
                                                    onTap: () {
                                                      _settingDialog(
                                                          context,
                                                          screenHeight,
                                                          screenWidth);
                                                    },
                                                    child: Text("Setting")),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                        ),
                                        Container(
                                          width: screenWidth * 0.36,
                                          height: screenHeight * 0.26,

                                          // set height to fill screen vertically
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 4,
                                              color: ColorManager
                                                  .blue, // set border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors
                                                .transparent, // set container background color
                                          ),
                                          child: Center(
                                            child: Text(
                                              "add_interactive_exercises".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: ColorManager
                                                    .white, // set text color
                                                fontSize: screenWidth *
                                                    0.016, // set font size
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.04,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.125,
                                          width: screenWidth * 0.135,
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() async {
                                                _updateDropdownItems(
                                                    _emailController.text
                                                        .toString());
                                                await FirebaseFirestore.instance
                                                    .collection(FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .email!)
                                                    .doc(_emailController.text
                                                        .toString())
                                                    .set({}).then((value) =>
                                                        Utlils().toast(
                                                            'Child_Added'.tr));
                                              });
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors
                                                  .transparent, // set background color to transparent
                                              primary: ColorManager
                                                  .r, // set border color// remove padding
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10), // set border radius
                                                side: BorderSide(
                                                    color: ColorManager.r,
                                                    width:
                                                        3), // set border width and color
                                              ),
                                            ),
                                            child: Text(
                                              'New_Child'.tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.white,
                                                  fontSize:
                                                      screenWidth * 0.014),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.013,
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                              height: screenHeight * 0.125,
                                              width: screenWidth * 0.26,
                                              child: field()),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.04,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.125,
                                          width: screenWidth * 0.135,
                                          child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors
                                                  .transparent, // set background color to transparent
                                              primary: ColorManager
                                                  .r, // set border color// remove padding
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10), // set border radius
                                                side: BorderSide(
                                                    color: ColorManager.r,
                                                    width:
                                                        3), // set border width and color
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Select_Existing'.tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      screenWidth * 0.0133,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.013,
                                        ),
                                        // Flexible(
                                        //   child: SizedBox(
                                        //       height: screenHeight * 0.143,
                                        //       width: screenWidth * 0.26,
                                        //       child: dropDownButton()),
                                        // ),
                                      ],
                                    )
                                  ]),
                                )),
                            Expanded(
                                child: Container(
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: ColorManager.LightRed,
                              //     width: 2,
                              //   ),
                              // ),
                              child: Column(children: [
                                SizedBox(
                                  height: screenHeight * 0.096,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.13,
                                  height: screenHeight * 0.185,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .transparent, // set background color to transparent
                                      onPrimary:
                                          ColorManager.o, // set border color
                                      padding:
                                          EdgeInsets.zero, // remove padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15), // set border radius
                                        side: BorderSide(
                                            color: ColorManager.o,
                                            width:
                                                4), // set border width and color
                                      ),
                                    ),
                                    onPressed: () async {
                                      final FirebaseAuth auth =
                                          FirebaseAuth.instance;
                                      final currentUser = auth.currentUser;
                                      final CollectionReference userCollection =
                                          FirebaseFirestore.instance
                                              .collection(currentUser!.email!);
                                      childName != ''
                                          ? await userCollection
                                              .doc(childName)
                                              .set(docData)
                                              .then((value) =>
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Circles(
                                                                numberA: 15,
                                                                childName:
                                                                    childName,
                                                              ))))
                                              .onError((error, stackTrace) {
                                              Utlils().toastMessage(
                                                  'Select_Child_Name'.tr);
                                            })
                                          : Utlils().toastMessage(
                                              'Select_Child_Name'.tr);
                                    },
                                    child: Center(
                                        child: Text(
                                      'Start_diagnostic'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.016,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.o),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.13,
                                  height: screenHeight * 0.185,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      primary: Colors
                                          .transparent, // set background color to transparent
                                      onPrimary:
                                          ColorManager.blue, // set border color
                                      padding:
                                          EdgeInsets.zero, // remove padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15), // set border radius
                                        side: BorderSide(
                                            color: ColorManager.blue,
                                            width:
                                                4), // set border width and color
                                      ),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (context) {
                                            return ResultMessage(
                                              message:
                                                  'Feature_not_available'.tr,
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icons
                                                  .settings_backup_restore_rounded,
                                            );
                                          });

                                      // button action
                                    },
                                    child: Center(
                                        child: Text(
                                      'Practise'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.016,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.13,
                                  height: screenHeight * 0.165,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .transparent, // set background color to transparent
                                      onPrimary:
                                          ColorManager.r, // set border color
                                      padding:
                                          EdgeInsets.zero, // remove padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15), // set border radius
                                        side: BorderSide(
                                            color: ColorManager.r,
                                            width:
                                                4), // set border width and color
                                      ),
                                    ),
                                    onPressed: () async {
                                      final FirebaseAuth auth =
                                          FirebaseAuth.instance;
                                      final currentUser = auth.currentUser;
                                      final CollectionReference userCollection =
                                          FirebaseFirestore.instance
                                              .collection(currentUser!.email!);
                                      childName != ''
                                          ?
                                          // await userCollection.doc(childName).set(docData).then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Report(
                                                        childName: childName,
                                                      )))
                                          : Utlils().toastMessage(
                                              'Select Child Name'.tr);
                                    },
                                    child: Center(
                                        child: Text(
                                      'Report'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.016,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ]),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [],
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

  Future<dynamic> _settingDialog(
      BuildContext context, double screenHeight, double screenWidth) {
    return showDialog(
        context: context,
        builder: (Context) {
          return Container(
            child: AlertDialog(
              content: Column(
                children: [
                  Flexible(
                    child: SizedBox(
                        // height: screenHeight * 0.143,
                        // width: screenWidth * 0.26,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.size.height*0.05),
                          child: DropdownButton<String>(
                            // menuMaxHeight: Get.size.height * 0.15,
                            value: this.lng,
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (newVal) {
                              setState(() {
                                this.lng = newVal!;
                                TranslationPage().changeLocale(newVal);
                              });
                            },
                            items: TranslationPage.langs.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Text(value),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                  ),
                   Expanded(
              child:    CheckboxListTile(
        title: Text('My Checkbox'),
        value:box.read("isCheck"),
        onChanged: (value) {
        setState(() {
            checkboxValue = value!;
          box.write("isCheck",  checkboxValue);
        });
        },
      ))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel"))
              ],
            ),
          );
        });
  }

  // Widget dropDownButton() {
  //   return DropdownButtonFormField<String>(
  //     value: dropdownValue,
  //     onChanged: (newValue) {
  //       setState(() {
  //         childName = newValue!;
  //         dropdownValue = newValue.tr;
  //       });
  //       Utlils().toast('Child_Selected'.tr);
  //     },
  //     iconSize: MediaQuery.of(context).size.width * 0.028,
  //     decoration: const InputDecoration(
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           width: 3,
  //           color: Colors.blue,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           width: 3,
  //           color: Colors.blue,
  //         ),
  //       ),
  //     ),
  //     items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(
  //           value.tr,
  //           style: TextStyle(
  //             color: ColorManager.white,
  //             fontWeight: FontWeight.bold,
  //             fontSize: MediaQuery.of(context).size.width * 0.0140,
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //     style: TextStyle(
  //       color: ColorManager.white,
  //       fontWeight: FontWeight.bold,
  //       fontSize: MediaQuery.of(context).size.width * 0.0130,
  //     ),
  //     dropdownColor: Colors.white60,
  //     iconEnabledColor: Colors.white,
  //   );
  // }

  Widget field() {
    return TextField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.bottom,
      onTap: () {
        setState(() {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return NameMessage(
                  emailController: _emailController,
                  message: 'Enter_Name'.tr,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icons.arrow_forward,
                );
              });
        });
      },
      onSubmitted: _updateDropdownItems,
      readOnly: true,
      controller: _emailController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorManager.white,
        fontSize: MediaQuery.of(context).size.width * 0.015,
      ),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: ColorManager.white,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.015,
        ),
        hintText: 'Enter_Name'.tr,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
        ),
      ),
    );
  }
}
