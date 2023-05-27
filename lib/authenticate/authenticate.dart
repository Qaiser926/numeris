
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numeris/WelcomeUI.dart';
import 'package:numeris/authenticate/login.dart';



class Authenticate{
  final auth= FirebaseAuth.instance;

   isLogin(){
    if(auth.currentUser!= null){
      return const Welcome();
    }
    else {
      return const LoginPage();


    }

  }

}