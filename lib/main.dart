import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numeris/WelcomeUI.dart';

import 'package:numeris/lagnuage/languageChange/langChanger.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';




Future<void> main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
    ));
    return   GetMaterialApp(

      translations: TranslationPage(),



    // language change k liye he
      locale:TranslationPage().getCurrentLocale(),
      fallbackLocale: Locale('en','US'),
      
      color: Colors.white,

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: HalfDouble(  childName: 'mush',     )
      home: Welcome(),
     // dice page me translate ka question he 
     // "What is the double of
     // report page
     // beforeafter page
     
    );
  }
}




// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async{
//   await GetStorage.init();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// enum TtsState { playing, stopped, paused, continued }

// class _MyAppState extends State<MyApp> {
//   late FlutterTts flutterTts;

//   TtsState ttsState = TtsState.stopped;
//   bool get isIOS => !kIsWeb && Platform.isIOS;
//   bool get isAndroid => !kIsWeb && Platform.isAndroid;

//   initTts() {
//     flutterTts = FlutterTts();

//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         ttsState = TtsState.playing;
//       });
//     });

//     if (isAndroid) {
//       flutterTts.setInitHandler(() {
//         setState(() {
//           print("TTS Initialized");
//         });
//       });
//     }

//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         print("Complete");
//         ttsState = TtsState.stopped;
//       });
//     });
//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         ttsState = TtsState.stopped;
//       });
//     });
//   }

// final box = GetStorage();
// var checkboxValue = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter TTS'),
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               _inputSection(),
//           CheckboxListTile(
//         title: Text('My Checkbox'),
//         value:box.read("isCheck"),
//         onChanged: (value) {
//         setState(() {
//             checkboxValue = value!;
//           box.write("isCheck",  checkboxValue);
//         });
//         },
//       )
      
//             ],
//           ),
//         ),
//       ),
//     );
//   }



//   Widget _inputSection() => Container(
//       child: InkWell(
//         onTap: ()async{
//         final isSave=box.read("isCheck");
//           if(isSave){
//              await flutterTts.speak("Safa");
//           }
//           else{
            
//         await flutterTts.setSilence(1);
//           }
   
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("Safa"),
//         )),
//       );

  
// }


