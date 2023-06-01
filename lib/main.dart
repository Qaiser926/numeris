import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numeris/HalfDouble(60-73)/HalfDouble.dart';
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
      home: HalfDouble(  childName: 'mush',     )
      // home: Welcome(),
     // dice page me translate ka question he 
   
     // report page
     // beforeafter page
     
    );
  }
}



