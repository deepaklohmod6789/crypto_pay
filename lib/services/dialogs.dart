import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dialogs{
  static void toast(String content){
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  static void popAlert(BuildContext context,String content){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(content),
        );
      },
    );
  }

}