import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utlils{

  void toastMessage(String message){
    Fluttertoast.showToast(
      msg:message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,




    );}
    void toast(String message){
    Fluttertoast.showToast(
      msg:message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,




    );}


  }


